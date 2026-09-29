import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/repositories/vehicle_attachment_repository.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/portal_sync_credentials.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/logger/logger.dart';

class SyncVehicleAttachmentIdsToPortalUseCase {
  const SyncVehicleAttachmentIdsToPortalUseCase({
    required PortalConnectionRepository portalConnectionRepository,
    required PortalMonitorApi portalMonitorApi,
    required PortalUrlValidator portalUrlValidator,
    required VehicleAttachmentRepository attachmentRepository,
  })  : _portalConnectionRepository = portalConnectionRepository,
        _portalMonitorApi = portalMonitorApi,
        _portalUrlValidator = portalUrlValidator,
        _attachmentRepository = attachmentRepository;

  final PortalConnectionRepository _portalConnectionRepository;
  final PortalMonitorApi _portalMonitorApi;
  final PortalUrlValidator _portalUrlValidator;
  final VehicleAttachmentRepository _attachmentRepository;

  Future<void> call() async {
    final credentials = await _resolveCredentials();
    if (credentials == null) {
      return;
    }

    final attachmentIds = await _attachmentRepository.listAllIds();

    try {
      final result = await _portalMonitorApi.syncAttachmentIds(
        apiBaseUrl: credentials.apiBaseUrl,
        mobileId: credentials.mobileId,
        attachmentIds: attachmentIds,
      );
      logSuccess(
        'Portal attachment ID sync succeeded '
        '(kept=${attachmentIds.length}, deleted=${result.deleted})',
      );
    } on PortalMonitorApiException catch (e) {
      final statusSuffix =
          e.statusCode != null ? ' (HTTP ${e.statusCode})' : '';
      logFailure('Portal attachment ID sync failed$statusSuffix: ${e.message}');
    }
  }

  Future<PortalSyncCredentials?> _resolveCredentials() async {
    final portalBaseUrl = await _portalConnectionRepository.getPortalBaseUrl();
    final mobileId = await _portalConnectionRepository.getMobileId();
    if (portalBaseUrl == null || mobileId == null) {
      logSkipped(
        'Portal attachment ID sync skipped: portal not configured '
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
