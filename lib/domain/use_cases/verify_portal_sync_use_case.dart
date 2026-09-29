import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/get_latest_garage_updated_at_use_case.dart';
import 'package:carport/domain/use_cases/portal_sync_credentials.dart';
import 'package:carport/domain/use_cases/sync_all_garage_data_to_portal_use_case.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/logger/logger.dart';

class VerifyPortalSyncUseCase {
  const VerifyPortalSyncUseCase({
    required PortalConnectionRepository portalConnectionRepository,
    required PortalMonitorApi portalMonitorApi,
    required PortalUrlValidator portalUrlValidator,
    required SyncAllGarageDataToPortalUseCase syncAllGarageDataToPortalUseCase,
    required GetLatestGarageUpdatedAtUseCase getLatestGarageUpdatedAtUseCase,
  })  : _portalConnectionRepository = portalConnectionRepository,
        _portalMonitorApi = portalMonitorApi,
        _portalUrlValidator = portalUrlValidator,
        _syncAllGarageDataToPortalUseCase = syncAllGarageDataToPortalUseCase,
        _getLatestGarageUpdatedAtUseCase = getLatestGarageUpdatedAtUseCase;

  final PortalConnectionRepository _portalConnectionRepository;
  final PortalMonitorApi _portalMonitorApi;
  final PortalUrlValidator _portalUrlValidator;
  final SyncAllGarageDataToPortalUseCase _syncAllGarageDataToPortalUseCase;
  final GetLatestGarageUpdatedAtUseCase _getLatestGarageUpdatedAtUseCase;

  Future<void> call() async {
    final credentials = await _resolveCredentials();
    if (credentials == null) {
      return;
    }

    final updatedAt = await _getLatestGarageUpdatedAtUseCase();

    try {
      final result = await _portalMonitorApi.checkin(
        apiBaseUrl: credentials.apiBaseUrl,
        updatedAt: updatedAt,
      );

      logSuccess(
        'Portal checkin succeeded '
        '(url=${credentials.apiBaseUrl}, updatedAt=$updatedAt, '
        'isDatabaseSync=${result.isDatabaseSync}, webUsers=${result.users.length})',
      );

      if (!result.isDatabaseSync) {
        try {
          await _syncAllGarageDataToPortalUseCase();
          logSuccess('Portal bulk sync succeeded');
        } on PortalMonitorApiException catch (e) {
          final statusSuffix =
              e.statusCode != null ? ' (HTTP ${e.statusCode})' : '';
          logFailure('Portal bulk sync failed$statusSuffix: ${e.message}');
        } catch (e) {
          logFailure(
            'Portal bulk sync failed: $e',
            error: e,
          );
        }
      }
    } on PortalMonitorApiException catch (e) {
      final statusSuffix =
          e.statusCode != null ? ' (HTTP ${e.statusCode})' : '';
      logFailure('Portal checkin failed$statusSuffix: ${e.message}');
    }
  }

  Future<PortalSyncCredentials?> _resolveCredentials() async {
    final portalBaseUrl = await _portalConnectionRepository.getPortalBaseUrl();
    final mobileId = await _portalConnectionRepository.getMobileId();
    if (portalBaseUrl == null || mobileId == null) {
      logSkipped(
        'Portal sync checkin skipped: portal not configured '
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
