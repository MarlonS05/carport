abstract class PortalConnectionRepository {
  Future<String?> getPortalBaseUrl();

  Future<void> setPortalBaseUrl(String url);

  Future<String?> getMobileId();

  Future<void> setMobileId(String id);

  Future<void> clearMobileId();

  /// Whether the user has explicitly customized viewer permissions.
  Future<bool> arePermissionsCustomized();

  /// Persisted allowed user ids; only authoritative when [arePermissionsCustomized].
  Future<List<int>> getAllowedUserIds();

  Future<void> setAllowedUserIds(List<int> userIds);

  Future<void> setPermissionsCustomized(bool customized);

  Future<void> resetPermissions();
}
