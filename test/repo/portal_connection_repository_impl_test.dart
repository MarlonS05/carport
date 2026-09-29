import 'dart:convert';

import 'package:carport/repo/portal_connection_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const url = 'https://monitor.example.com';
  const otherUrl = 'https://other.example.com';
  const mobileId = '550e8400-e29b-41d4-a716-446655440000';

  Future<PortalConnectionRepositoryImpl> createRepository({
    Map<String, Object> initial = const {},
  }) async {
    SharedPreferences.setMockInitialValues(initial);
    final prefs = await SharedPreferences.getInstance();
    return PortalConnectionRepositoryImpl(prefs);
  }

  test('setMobileId then getMobileId round-trips', () async {
    final repository = await createRepository();

    await repository.setMobileId(mobileId);

    expect(await repository.getMobileId(), mobileId);
  });

  test('clearMobileId removes stored ID', () async {
    final repository = await createRepository(
      initial: {
        'portal_mobile_id': mobileId,
      },
    );

    await repository.clearMobileId();

    expect(await repository.getMobileId(), isNull);
  });

  test('permissions are not customized by default', () async {
    final repository = await createRepository();

    expect(await repository.arePermissionsCustomized(), isFalse);
    expect(await repository.getAllowedUserIds(), isEmpty);
  });

  test('setPortalBaseUrl clears mobile ID and resets permissions when URL changes',
      () async {
    final repository = await createRepository(
      initial: {
        'portal_base_url': url,
        'portal_mobile_id': mobileId,
        'portal_allowed_user_ids': jsonEncode([1, 2]),
        'portal_permissions_customized': true,
      },
    );

    await repository.setPortalBaseUrl(otherUrl);

    expect(await repository.getPortalBaseUrl(), otherUrl);
    expect(await repository.getMobileId(), isNull);
    expect(await repository.arePermissionsCustomized(), isFalse);
    expect(await repository.getAllowedUserIds(), isEmpty);
  });

  test('setPortalBaseUrl keeps mobile ID when URL unchanged', () async {
    final repository = await createRepository(
      initial: {
        'portal_base_url': url,
        'portal_mobile_id': mobileId,
      },
    );

    await repository.setPortalBaseUrl(url);

    expect(await repository.getMobileId(), mobileId);
  });

  test('setAllowedUserIds persists sorted ids', () async {
    final repository = await createRepository();

    await repository.setAllowedUserIds([2, 1]);

    expect(await repository.getAllowedUserIds(), [1, 2]);
  });
}
