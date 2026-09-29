import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/mappers/portal_sync_mapper.dart';
import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/repositories/service_item_repository.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/use_cases/portal_sync_credentials.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/logger/logger.dart';

class SyncServiceItemToPortalUseCase {
  const SyncServiceItemToPortalUseCase({
    required PortalConnectionRepository portalConnectionRepository,
    required PortalMonitorApi portalMonitorApi,
    required PortalUrlValidator portalUrlValidator,
    required GetDistanceUnitUseCase getDistanceUnitUseCase,
    required ServiceItemRepository serviceItemRepository,
  })  : _portalConnectionRepository = portalConnectionRepository,
        _portalMonitorApi = portalMonitorApi,
        _portalUrlValidator = portalUrlValidator,
        _getDistanceUnitUseCase = getDistanceUnitUseCase,
        _serviceItemRepository = serviceItemRepository;

  final PortalConnectionRepository _portalConnectionRepository;
  final PortalMonitorApi _portalMonitorApi;
  final PortalUrlValidator _portalUrlValidator;
  final GetDistanceUnitUseCase _getDistanceUnitUseCase;
  final ServiceItemRepository _serviceItemRepository;

  Future<void> call(List<ServiceItem> serviceItems) async {
    if (serviceItems.isEmpty) {
      return;
    }

    final credentials = await _resolveCredentials();
    if (credentials == null) {
      return;
    }

    try {
      final distanceUnit = await _getDistanceUnitUseCase();
      final payloads = <Map<String, dynamic>>[];
      for (final item in serviceItems) {
        final updatedAt = await _serviceItemRepository.getUpdatedAt(item.id);
        if (updatedAt == null) {
          logSkipped(
            'Skipping portal sync for unknown service item ${item.id}',
          );
          continue;
        }
        payloads.add(
          PortalSyncMapper.serviceItemToJson(item, distanceUnit, updatedAt),
        );
      }
      if (payloads.isEmpty) {
        return;
      }

      await _portalMonitorApi.syncServiceItems(
        apiBaseUrl: credentials.apiBaseUrl,
        mobileId: credentials.mobileId,
        serviceItems: payloads,
      );
      logSuccess(
        'Portal service item sync succeeded (count=${payloads.length})',
      );
    } on PortalMonitorApiException catch (e) {
      final statusSuffix =
          e.statusCode != null ? ' (HTTP ${e.statusCode})' : '';
      logFailure('Portal service item sync failed$statusSuffix: ${e.message}');
    }
  }

  Future<PortalSyncCredentials?> _resolveCredentials() async {
    final portalBaseUrl = await _portalConnectionRepository.getPortalBaseUrl();
    final mobileId = await _portalConnectionRepository.getMobileId();
    if (portalBaseUrl == null || mobileId == null) {
      logSkipped(
        'Portal service item sync skipped: portal not configured '
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
