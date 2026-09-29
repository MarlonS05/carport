import 'dart:convert';

import 'package:carport/domain/repositories/portal_connection_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PortalConnectionRepositoryImpl implements PortalConnectionRepository {
  PortalConnectionRepositoryImpl(this._preferences);

  static const _portalBaseUrlKey = 'portal_base_url';
  static const _mobileIdKey = 'portal_mobile_id';
  static const _allowedUserIdsKey = 'portal_allowed_user_ids';
  static const _permissionsCustomizedKey = 'portal_permissions_customized';

  final SharedPreferences _preferences;

  @override
  Future<String?> getPortalBaseUrl() async {
    return _preferences.getString(_portalBaseUrlKey);
  }

  @override
  Future<void> setPortalBaseUrl(String url) async {
    final previousUrl = await getPortalBaseUrl();
    if (previousUrl != null && previousUrl != url) {
      await clearMobileId();
      await resetPermissions();
    }
    await _preferences.setString(_portalBaseUrlKey, url);
  }

  @override
  Future<String?> getMobileId() async {
    return _preferences.getString(_mobileIdKey);
  }

  @override
  Future<void> setMobileId(String id) async {
    await _preferences.setString(_mobileIdKey, id);
  }

  @override
  Future<void> clearMobileId() async {
    await _preferences.remove(_mobileIdKey);
  }

  @override
  Future<bool> arePermissionsCustomized() async {
    return _preferences.getBool(_permissionsCustomizedKey) ?? false;
  }

  @override
  Future<List<int>> getAllowedUserIds() async {
    final raw = _preferences.getString(_allowedUserIdsKey);
    if (raw == null) {
      return const [];
    }
    final decoded = jsonDecode(raw);
    if (decoded is! List) {
      return const [];
    }
    return decoded.map((e) => (e as num).toInt()).toList();
  }

  @override
  Future<void> setAllowedUserIds(List<int> userIds) async {
    final sorted = List<int>.from(userIds)..sort();
    await _preferences.setString(_allowedUserIdsKey, jsonEncode(sorted));
  }

  @override
  Future<void> setPermissionsCustomized(bool customized) async {
    await _preferences.setBool(_permissionsCustomizedKey, customized);
  }

  @override
  Future<void> resetPermissions() async {
    await _preferences.remove(_allowedUserIdsKey);
    await _preferences.remove(_permissionsCustomizedKey);
  }
}
