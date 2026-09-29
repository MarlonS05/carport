import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/portal_sync_credentials.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/logger/logger.dart';

class SyncVehicleAttachmentToPortalUseCase {
  const SyncVehicleAttachmentToPortalUseCase({
    required PortalConnectionRepository portalConnectionRepository,
    required PortalMonitorApi portalMonitorApi,
    required PortalUrlValidator portalUrlValidator,
  })  : _portalConnectionRepository = portalConnectionRepository,
        _portalMonitorApi = portalMonitorApi,
        _portalUrlValidator = portalUrlValidator;

  final PortalConnectionRepository _portalConnectionRepository;
  final PortalMonitorApi _portalMonitorApi;
  final PortalUrlValidator _portalUrlValidator;

  Future<void> call(List<VehicleAttachment> attachments) async {
    if (attachments.isEmpty) {
      return;
    }

    final credentials = await _resolveCredentials();
    if (credentials == null) {
      return;
    }

    var uploaded = 0;
    for (final attachment in attachments) {
      try {
        await _portalMonitorApi.uploadAttachment(
          apiBaseUrl: credentials.apiBaseUrl,
          mobileId: credentials.mobileId,
          vehicleId: attachment.vehicleId,
          attachmentId: attachment.id,
          filePath: attachment.filePath,
          filename: attachment.displayName,
        );
        uploaded++;
      } on PortalMonitorApiException catch (e) {
        if (_isDuplicateAttachmentError(e)) {
          logSkipped(
            'Portal attachment upload skipped (already exists): ${attachment.id}',
          );
          continue;
        }
        final statusSuffix =
            e.statusCode != null ? ' (HTTP ${e.statusCode})' : '';
        logFailure(
          'Portal attachment upload failed$statusSuffix for ${attachment.id}: '
          '${e.message}',
        );
      }
    }

    if (uploaded > 0) {
      logSuccess('Portal attachment upload succeeded (count=$uploaded)');
    }
  }

  bool _isDuplicateAttachmentError(PortalMonitorApiException error) {
    if (error.statusCode != 422) {
      return false;
    }
    final message = error.message.toLowerCase();
    if (message.contains('already exists')) {
      return true;
    }
    final idErrors = error.errors?['id'];
    if (idErrors == null) {
      return false;
    }
    return idErrors.any(
      (entry) => entry.toLowerCase().contains('already exists'),
    );
  }

  Future<PortalSyncCredentials?> _resolveCredentials() async {
    final portalBaseUrl = await _portalConnectionRepository.getPortalBaseUrl();
    final mobileId = await _portalConnectionRepository.getMobileId();
    if (portalBaseUrl == null || mobileId == null) {
      logSkipped(
        'Portal attachment upload skipped: portal not configured '
        '(portalBaseUrl=${portalBaseUrl != null}, mobileId=${mobileId != null})',
      );
      return null;
    }

    return PortalSyncCredentials(
      apiBaseUrl: _portalUrlValidator.apiBaseUrl(portalBaseUrl),
      mobileId: mobileId,
    );
  }
}
