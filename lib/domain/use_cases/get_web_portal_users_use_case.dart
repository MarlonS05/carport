import 'package:carport/domain/entities/web_portal_user.dart';
import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/get_latest_garage_updated_at_use_case.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/logger/logger.dart';

class GetWebPortalUsersUseCase {
  const GetWebPortalUsersUseCase({
    required PortalConnectionRepository portalConnectionRepository,
    required PortalMonitorApi portalMonitorApi,
    required PortalUrlValidator portalUrlValidator,
    required GetLatestGarageUpdatedAtUseCase getLatestGarageUpdatedAtUseCase,
  })  : _portalConnectionRepository = portalConnectionRepository,
        _portalMonitorApi = portalMonitorApi,
        _portalUrlValidator = portalUrlValidator,
        _getLatestGarageUpdatedAtUseCase = getLatestGarageUpdatedAtUseCase;

  final PortalConnectionRepository _portalConnectionRepository;
  final PortalMonitorApi _portalMonitorApi;
  final PortalUrlValidator _portalUrlValidator;
  final GetLatestGarageUpdatedAtUseCase _getLatestGarageUpdatedAtUseCase;

  Future<List<WebPortalUser>> call() async {
    final portalBaseUrl = await _portalConnectionRepository.getPortalBaseUrl();
    final mobileId = await _portalConnectionRepository.getMobileId();
    if (portalBaseUrl == null || mobileId == null) {
      logSkipped(
        'Portal web users fetch skipped: portal not configured '
        '(portalBaseUrl=${portalBaseUrl != null}, mobileId=${mobileId != null})',
      );
      return const [];
    }

    final apiBaseUrl = _portalUrlValidator.apiBaseUrl(portalBaseUrl);
    final updatedAt = await _getLatestGarageUpdatedAtUseCase();

    try {
      final result = await _portalMonitorApi.checkin(
        apiBaseUrl: apiBaseUrl,
        updatedAt: updatedAt,
      );

      logSuccess(
        'Portal web users fetch succeeded '
        '(url=$apiBaseUrl, updatedAt=$updatedAt, webUsers=${result.users.length})',
      );

      final customized =
          await _portalConnectionRepository.arePermissionsCustomized();
      final allowedIds = customized
          ? await _portalConnectionRepository.getAllowedUserIds()
          : const <int>[];

      final users = result.users.entries.map((entry) {
        return WebPortalUser(
          id: entry.key,
          name: entry.value,
          hasAccess: customized ? allowedIds.contains(entry.key) : true,
        );
      }).toList()
        ..sort((a, b) => a.id.compareTo(b.id));

      return users;
    } on PortalMonitorApiException catch (e) {
      final statusSuffix =
          e.statusCode != null ? ' (HTTP ${e.statusCode})' : '';
      logFailure('Portal web users fetch failed$statusSuffix: ${e.message}');
      rethrow;
    }
  }
}
