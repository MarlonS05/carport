import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:carport/domain/services/portal_monitor_api.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/get_web_portal_users_use_case.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:carport/logger/logger.dart';

class SetWebPortalUserAccessUseCase {
  const SetWebPortalUserAccessUseCase({
    required PortalConnectionRepository portalConnectionRepository,
    required PortalMonitorApi portalMonitorApi,
    required PortalUrlValidator portalUrlValidator,
    required GetWebPortalUsersUseCase getWebPortalUsersUseCase,
  })  : _portalConnectionRepository = portalConnectionRepository,
        _portalMonitorApi = portalMonitorApi,
        _portalUrlValidator = portalUrlValidator,
        _getWebPortalUsersUseCase = getWebPortalUsersUseCase;

  final PortalConnectionRepository _portalConnectionRepository;
  final PortalMonitorApi _portalMonitorApi;
  final PortalUrlValidator _portalUrlValidator;
  final GetWebPortalUsersUseCase _getWebPortalUsersUseCase;

  Future<void> call({required int userId, required bool enabled}) async {
    final portalBaseUrl = await _portalConnectionRepository.getPortalBaseUrl();
    final mobileId = await _portalConnectionRepository.getMobileId();
    if (portalBaseUrl == null || mobileId == null) {
      logSkipped(
        'Portal permissions sync skipped: portal not configured '
        '(portalBaseUrl=${portalBaseUrl != null}, mobileId=${mobileId != null})',
      );
      return;
    }

    final currentUsers = await _getWebPortalUsersUseCase();
    final customized =
        await _portalConnectionRepository.arePermissionsCustomized();

    final allowedIds = customized
        ? await _portalConnectionRepository.getAllowedUserIds()
        : currentUsers.map((user) => user.id).toList();

    final updated = Set<int>.from(allowedIds);
    if (enabled) {
      updated.add(userId);
    } else {
      updated.remove(userId);
    }

    final sortedAllowed = updated.toList()..sort();

    if (!customized) {
      await _portalConnectionRepository.setPermissionsCustomized(true);
    }
    await _portalConnectionRepository.setAllowedUserIds(sortedAllowed);

    try {
      await _portalMonitorApi.syncPermissions(
        apiBaseUrl: _portalUrlValidator.apiBaseUrl(portalBaseUrl),
        mobileId: mobileId,
        userIds: sortedAllowed,
      );
      logSuccess(
        'Portal permissions sync succeeded (userIds=${sortedAllowed.length})',
      );
    } on PortalMonitorApiException catch (e) {
      final statusSuffix =
          e.statusCode != null ? ' (HTTP ${e.statusCode})' : '';
      logFailure('Portal permissions sync failed$statusSuffix: ${e.message}');
      rethrow;
    }
  }
}
