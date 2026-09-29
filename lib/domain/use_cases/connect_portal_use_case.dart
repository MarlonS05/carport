import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/sync_all_garage_data_to_portal_use_case.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/logger/logger.dart';

class ConnectPortalUseCase {
  const ConnectPortalUseCase({
    required PortalConnectionRepository portalConnectionRepository,
    required PortalMonitorApi portalMonitorApi,
    required PortalUrlValidator portalUrlValidator,
    required SyncAllGarageDataToPortalUseCase syncAllGarageDataToPortalUseCase,
  })  : _portalConnectionRepository = portalConnectionRepository,
        _portalMonitorApi = portalMonitorApi,
        _portalUrlValidator = portalUrlValidator,
        _syncAllGarageDataToPortalUseCase = syncAllGarageDataToPortalUseCase;

  final PortalConnectionRepository _portalConnectionRepository;
  final PortalMonitorApi _portalMonitorApi;
  final PortalUrlValidator _portalUrlValidator;
  final SyncAllGarageDataToPortalUseCase _syncAllGarageDataToPortalUseCase;

  Future<void> call(
    String normalizedPortalUrl, {
    bool forceReregister = false,
    void Function()? onSyncStarting,
  }) async {
    final previousUrl = await _portalConnectionRepository.getPortalBaseUrl();
    final previousMobileId = await _portalConnectionRepository.getMobileId();
    final urlChanged = previousUrl != normalizedPortalUrl;

    if (!forceReregister && !urlChanged && previousMobileId != null) {
      await _portalConnectionRepository.setPortalBaseUrl(normalizedPortalUrl);
      logSkipped(
        'Portal registration skipped: already connected (url=$normalizedPortalUrl)',
      );
      return;
    }

    final apiBase = _portalUrlValidator.apiBaseUrl(normalizedPortalUrl);

    late final String mobileId;
    try {
      mobileId = await _portalMonitorApi.register(apiBaseUrl: apiBase);
      logSuccess('Portal registration succeeded (url=$apiBase)');
    } on PortalMonitorApiException catch (e) {
      final statusSuffix =
          e.statusCode != null ? ' (HTTP ${e.statusCode})' : '';
      logFailure('Portal registration failed$statusSuffix: ${e.message}');
      rethrow;
    }

    await _portalConnectionRepository.setPortalBaseUrl(normalizedPortalUrl);
    await _portalConnectionRepository.setMobileId(mobileId);

    onSyncStarting?.call();

    try {
      await _syncAllGarageDataToPortalUseCase();
      logSuccess('Portal bulk sync succeeded');
    } on PortalMonitorApiException catch (e) {
      final statusSuffix =
          e.statusCode != null ? ' (HTTP ${e.statusCode})' : '';
      logFailure(
        'Portal bulk sync failed after registration$statusSuffix: ${e.message}',
      );
    } catch (e) {
      logFailure(
        'Portal bulk sync failed after registration: $e',
        error: e,
      );
    }
  }
}
