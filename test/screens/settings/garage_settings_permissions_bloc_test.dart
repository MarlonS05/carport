import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/notification_permission_status.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_bloc.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_event.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

void main() {
  late MockReminderNotificationScheduler scheduler;
  late MockAppRouter router;

  setUp(() {
    scheduler = MockReminderNotificationScheduler();
    router = MockAppRouter();
    stubRouterPush(router);
  });

  GarageSettingsPermissionsBloc build() => GarageSettingsPermissionsBloc(
        notificationScheduler: scheduler,
        router: router,
      );

  blocTest<GarageSettingsPermissionsBloc, GarageSettingsPermissionsState>(
    'started refreshes the permission status',
    setUp: () => when(() => scheduler.getPermissionStatus())
        .thenAnswer((_) async => NotificationPermissionStatus.granted),
    build: build,
    act: (bloc) => bloc.add(const GarageSettingsPermissionsEvent.started()),
    expect: () => [
      const GarageSettingsPermissionsState(isLoading: true),
      const GarageSettingsPermissionsState(
        isLoading: false,
        permissionStatus: NotificationPermissionStatus.granted,
      ),
    ],
  );

  blocTest<GarageSettingsPermissionsBloc, GarageSettingsPermissionsState>(
    'permissionTapped requests and grants without opening settings',
    setUp: () {
      when(() => scheduler.requestPermissions()).thenAnswer((_) async => true);
      when(() => scheduler.getPermissionStatus())
          .thenAnswer((_) async => NotificationPermissionStatus.granted);
    },
    build: build,
    seed: () => const GarageSettingsPermissionsState(
      isLoading: false,
      permissionStatus: NotificationPermissionStatus.denied,
    ),
    act: (bloc) =>
        bloc.add(const GarageSettingsPermissionsEvent.permissionTapped()),
    expect: () => [
      const GarageSettingsPermissionsState(
        isLoading: false,
        isRequesting: true,
        permissionStatus: NotificationPermissionStatus.denied,
      ),
      const GarageSettingsPermissionsState(
        isLoading: false,
        permissionStatus: NotificationPermissionStatus.granted,
      ),
    ],
    verify: (_) => verifyNever(() => scheduler.openAppSettings()),
  );

  blocTest<GarageSettingsPermissionsBloc, GarageSettingsPermissionsState>(
    'permissionTapped opens app settings when still not granted',
    setUp: () {
      when(() => scheduler.requestPermissions()).thenAnswer((_) async => false);
      when(() => scheduler.getPermissionStatus())
          .thenAnswer((_) async => NotificationPermissionStatus.denied);
      when(() => scheduler.openAppSettings()).thenAnswer((_) async {});
    },
    build: build,
    seed: () => const GarageSettingsPermissionsState(
      isLoading: false,
      permissionStatus: NotificationPermissionStatus.denied,
    ),
    act: (bloc) =>
        bloc.add(const GarageSettingsPermissionsEvent.permissionTapped()),
    verify: (_) => verify(() => scheduler.openAppSettings()).called(1),
  );

  blocTest<GarageSettingsPermissionsBloc, GarageSettingsPermissionsState>(
    'permissionTapped is a no-op when already granted',
    build: build,
    seed: () => const GarageSettingsPermissionsState(
      isLoading: false,
      permissionStatus: NotificationPermissionStatus.granted,
    ),
    act: (bloc) =>
        bloc.add(const GarageSettingsPermissionsEvent.permissionTapped()),
    expect: () => const <GarageSettingsPermissionsState>[],
    verify: (_) => verifyNever(() => scheduler.requestPermissions()),
  );
}
