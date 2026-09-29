import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/portal_permissions_sync_result.dart';
import 'package:carport/domain/entities/portal_bulk_sync_result.dart';
import 'package:carport/domain/entities/portal_checkin_result.dart';
import 'package:carport/domain/entities/web_portal_user.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/get_latest_garage_updated_at_use_case.dart';
import 'package:carport/domain/use_cases/get_web_portal_users_use_case.dart';
import 'package:carport/domain/use_cases/set_web_portal_user_access_use_case.dart';
import 'package:carport/domain/entities/vehicle_attachment.dart';
import 'package:carport/domain/use_cases/sync_all_garage_data_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_service_item_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_ids_on_app_start_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_ids_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_attachment_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/verify_portal_sync_on_app_start_use_case.dart';
import 'package:carport/domain/use_cases/verify_portal_sync_use_case.dart';
import 'package:carport/domain/validators/portal_url_validator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/builders.dart';
import '../../support/mocks.dart';

class MockSyncVehicleToPortalUseCase extends Mock
    implements SyncVehicleToPortalUseCase {}

class MockSyncServiceItemToPortalUseCase extends Mock
    implements SyncServiceItemToPortalUseCase {}

class MockSyncVehicleAttachmentToPortalUseCase extends Mock
    implements SyncVehicleAttachmentToPortalUseCase {}

class MockSyncVehicleAttachmentIdsToPortalUseCase extends Mock
    implements SyncVehicleAttachmentIdsToPortalUseCase {}

class MockSyncAllGarageDataToPortalUseCase extends Mock
    implements SyncAllGarageDataToPortalUseCase {}

class MockVerifyPortalSyncUseCase extends Mock implements VerifyPortalSyncUseCase {}

class MockGetLatestGarageUpdatedAtUseCase extends Mock
    implements GetLatestGarageUpdatedAtUseCase {}

class MockGetWebPortalUsersUseCase extends Mock
    implements GetWebPortalUsersUseCase {}

void main() {
  setUpAll(() {
    registerCommonFallbacks();
    registerFallbackValue(DateTime.utc(2026, 1, 1));
  });

  group('SyncVehicleToPortalUseCase', () {
    late MockPortalConnectionRepository portalRepository;
    late MockPortalMonitorApi api;
    late MockGetDistanceUnitUseCase getDistanceUnitUseCase;
    late MockVehicleRepository vehicleRepository;
    late SyncVehicleToPortalUseCase useCase;

    const portalUrl = 'https://monitor.example.com';
    const mobileId = '550e8400-e29b-41d4-a716-446655440000';
    final updatedAt = DateTime.utc(2026, 7, 8, 10, 15, 30);

    setUp(() {
      portalRepository = MockPortalConnectionRepository();
      api = MockPortalMonitorApi();
      getDistanceUnitUseCase = MockGetDistanceUnitUseCase();
      vehicleRepository = MockVehicleRepository();
      useCase = SyncVehicleToPortalUseCase(
        portalConnectionRepository: portalRepository,
        portalMonitorApi: api,
        portalUrlValidator: const PortalUrlValidator(),
        getDistanceUnitUseCase: getDistanceUnitUseCase,
        vehicleRepository: vehicleRepository,
      );
    });

    test('no-ops when not connected', () async {
      when(() => portalRepository.getPortalBaseUrl()).thenAnswer((_) async => null);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => null);

      await useCase([buildVehicle()]);

      verifyNever(
        () => api.syncVehicles(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          vehicles: any(named: 'vehicles'),
        ),
      );
    });

    test('syncs vehicles with updated_at when connected', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(() => getDistanceUnitUseCase()).thenAnswer((_) async => DistanceUnit.miles);
      when(() => vehicleRepository.getUpdatedAt('v1'))
          .thenAnswer((_) async => updatedAt);
      when(
        () => api.syncVehicles(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          vehicles: any(named: 'vehicles'),
        ),
      ).thenAnswer(
        (_) async => const PortalBulkSyncResult(
          created: 1,
          updated: 0,
          ignored: 0,
          items: [],
        ),
      );

      await useCase([buildVehicle(id: 'v1')]);

      final captured = verify(
        () => api.syncVehicles(
          apiBaseUrl: '$portalUrl/api',
          mobileId: mobileId,
          vehicles: captureAny(named: 'vehicles'),
        ),
      ).captured.single as List<Map<String, dynamic>>;

      expect(captured.single['updated_at'], '2026-07-08T10:15:30Z');
    });

    test('swallows API errors', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(() => getDistanceUnitUseCase()).thenAnswer((_) async => DistanceUnit.miles);
      when(() => vehicleRepository.getUpdatedAt(any()))
          .thenAnswer((_) async => updatedAt);
      when(
        () => api.syncVehicles(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          vehicles: any(named: 'vehicles'),
        ),
      ).thenThrow(const PortalMonitorApiException('Monitor unreachable'));

      await expectLater(useCase([buildVehicle()]), completes);
    });
  });

  group('SyncAllGarageDataToPortalUseCase', () {
    late MockVehicleRepository vehicleRepository;
    late MockServiceItemRepository serviceItemRepository;
    late MockVehicleAttachmentRepository attachmentRepository;
    late MockSyncVehicleToPortalUseCase syncVehicles;
    late MockSyncServiceItemToPortalUseCase syncServiceItems;
    late MockSyncVehicleAttachmentToPortalUseCase syncAttachments;
    late SyncAllGarageDataToPortalUseCase useCase;

    final attachment = VehicleAttachment(
      id: 'a1',
      vehicleId: 'v1',
      displayName: 'manual.pdf',
      filePath: '/stored/manual.pdf',
      createdAt: DateTime.utc(2026, 3, 1),
      updatedAt: DateTime.utc(2026, 3, 1),
    );

    setUp(() {
      vehicleRepository = MockVehicleRepository();
      serviceItemRepository = MockServiceItemRepository();
      attachmentRepository = MockVehicleAttachmentRepository();
      syncVehicles = MockSyncVehicleToPortalUseCase();
      syncServiceItems = MockSyncServiceItemToPortalUseCase();
      syncAttachments = MockSyncVehicleAttachmentToPortalUseCase();
      useCase = SyncAllGarageDataToPortalUseCase(
        vehicleRepository: vehicleRepository,
        serviceItemRepository: serviceItemRepository,
        attachmentRepository: attachmentRepository,
        syncVehicleToPortalUseCase: syncVehicles,
        syncServiceItemToPortalUseCase: syncServiceItems,
        syncVehicleAttachmentToPortalUseCase: syncAttachments,
      );
    });

    test('syncs vehicles, service items, then attachments', () async {
      final vehicles = [buildVehicle(id: 'v1'), buildVehicle(id: 'v2')];
      final items = [buildServiceItem(id: 's1', vehicleId: 'v1')];

      when(() => vehicleRepository.getAll()).thenAnswer((_) async => vehicles);
      when(() => serviceItemRepository.getByVehicleId('v1'))
          .thenAnswer((_) async => items);
      when(() => serviceItemRepository.getByVehicleId('v2'))
          .thenAnswer((_) async => []);
      when(() => attachmentRepository.listByVehicleId('v1'))
          .thenAnswer((_) async => [attachment]);
      when(() => attachmentRepository.listByVehicleId('v2'))
          .thenAnswer((_) async => []);
      when(() => syncVehicles(any())).thenAnswer((_) async {});
      when(() => syncServiceItems(any())).thenAnswer((_) async {});
      when(() => syncAttachments(any())).thenAnswer((_) async {});

      await useCase();

      verifyInOrder([
        () => syncVehicles(vehicles),
        () => syncServiceItems(items),
        () => syncAttachments([attachment]),
      ]);
    });
  });

  group('GetLatestGarageUpdatedAtUseCase', () {
    late MockVehicleRepository vehicleRepository;
    late MockServiceItemRepository serviceItemRepository;
    late MockVehicleAttachmentRepository attachmentRepository;
    late GetLatestGarageUpdatedAtUseCase useCase;

    setUp(() {
      vehicleRepository = MockVehicleRepository();
      serviceItemRepository = MockServiceItemRepository();
      attachmentRepository = MockVehicleAttachmentRepository();
      useCase = GetLatestGarageUpdatedAtUseCase(
        vehicleRepository: vehicleRepository,
        serviceItemRepository: serviceItemRepository,
        attachmentRepository: attachmentRepository,
      );
    });

    test('returns epoch when garage is empty', () async {
      when(() => vehicleRepository.getMostRecentlyUpdated())
          .thenAnswer((_) async => null);
      when(() => serviceItemRepository.getMostRecentlyUpdated())
          .thenAnswer((_) async => null);
      when(() => attachmentRepository.getMostRecentlyUpdated())
          .thenAnswer((_) async => null);

      final result = await useCase();

      expect(result, DateTime.fromMillisecondsSinceEpoch(0, isUtc: true));
    });

    test('returns latest service item timestamp when newer', () async {
      when(() => vehicleRepository.getMostRecentlyUpdated()).thenAnswer(
        (_) async => (
          id: 'v1',
          updatedAt: DateTime.utc(2026, 1, 1),
        ),
      );
      when(() => serviceItemRepository.getMostRecentlyUpdated()).thenAnswer(
        (_) async => (
          id: 's1',
          updatedAt: DateTime.utc(2026, 2, 1),
        ),
      );
      when(() => attachmentRepository.getMostRecentlyUpdated())
          .thenAnswer((_) async => null);

      final result = await useCase();

      expect(result, DateTime.utc(2026, 2, 1));
    });

    test('returns latest attachment timestamp when newest', () async {
      when(() => vehicleRepository.getMostRecentlyUpdated()).thenAnswer(
        (_) async => (
          id: 'v1',
          updatedAt: DateTime.utc(2026, 1, 1),
        ),
      );
      when(() => serviceItemRepository.getMostRecentlyUpdated()).thenAnswer(
        (_) async => (
          id: 's1',
          updatedAt: DateTime.utc(2026, 2, 1),
        ),
      );
      when(() => attachmentRepository.getMostRecentlyUpdated()).thenAnswer(
        (_) async => (
          id: 'a1',
          updatedAt: DateTime.utc(2026, 3, 1),
        ),
      );

      final result = await useCase();

      expect(result, DateTime.utc(2026, 3, 1));
    });
  });

  group('VerifyPortalSyncUseCase', () {
    late MockPortalConnectionRepository portalRepository;
    late MockPortalMonitorApi api;
    late MockSyncAllGarageDataToPortalUseCase syncAll;
    late MockGetLatestGarageUpdatedAtUseCase getLatestUpdatedAt;
    late VerifyPortalSyncUseCase useCase;

    const portalUrl = 'https://monitor.example.com';
    const mobileId = '550e8400-e29b-41d4-a716-446655440000';
    final updatedAt = DateTime.utc(2026, 7, 8, 10, 15, 30);

    setUp(() {
      portalRepository = MockPortalConnectionRepository();
      api = MockPortalMonitorApi();
      syncAll = MockSyncAllGarageDataToPortalUseCase();
      getLatestUpdatedAt = MockGetLatestGarageUpdatedAtUseCase();
      useCase = VerifyPortalSyncUseCase(
        portalConnectionRepository: portalRepository,
        portalMonitorApi: api,
        portalUrlValidator: const PortalUrlValidator(),
        syncAllGarageDataToPortalUseCase: syncAll,
        getLatestGarageUpdatedAtUseCase: getLatestUpdatedAt,
      );
      when(() => getLatestUpdatedAt()).thenAnswer((_) async => updatedAt);
    });

    test('bulk syncs when checkin reports not synced', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(
        () => api.checkin(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          updatedAt: any(named: 'updatedAt'),
        ),
      ).thenAnswer(
        (_) async => const PortalCheckinResult(
          isDatabaseSync: false,
          users: {},
        ),
      );
      when(() => syncAll()).thenAnswer((_) async {});

      await useCase();

      verify(
        () => api.checkin(
          apiBaseUrl: '$portalUrl/api',
          updatedAt: updatedAt,
        ),
      ).called(1);
      verify(() => syncAll()).called(1);
    });

    test('skips bulk sync when checkin reports synced', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(
        () => api.checkin(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          updatedAt: any(named: 'updatedAt'),
        ),
      ).thenAnswer(
        (_) async => const PortalCheckinResult(
          isDatabaseSync: true,
          users: {},
        ),
      );

      await useCase();

      verifyNever(() => syncAll());
    });
  });

  group('VerifyPortalSyncOnAppStartUseCase', () {
    late MockVerifyPortalSyncUseCase verifyPortalSync;
    late VerifyPortalSyncOnAppStartUseCase useCase;

    setUp(() {
      verifyPortalSync = MockVerifyPortalSyncUseCase();
      useCase = VerifyPortalSyncOnAppStartUseCase(
        verifyPortalSyncUseCase: verifyPortalSync,
      );
    });

    test('delegates to verify portal sync use case', () async {
      when(() => verifyPortalSync()).thenAnswer((_) async {});

      await useCase();

      verify(() => verifyPortalSync()).called(1);
    });
  });

  group('SyncVehicleAttachmentIdsOnAppStartUseCase', () {
    late MockSyncVehicleAttachmentIdsToPortalUseCase syncAttachmentIds;
    late SyncVehicleAttachmentIdsOnAppStartUseCase useCase;

    setUp(() {
      syncAttachmentIds = MockSyncVehicleAttachmentIdsToPortalUseCase();
      useCase = SyncVehicleAttachmentIdsOnAppStartUseCase(
        syncVehicleAttachmentIdsToPortalUseCase: syncAttachmentIds,
      );
    });

    test('delegates to sync vehicle attachment IDs use case', () async {
      when(() => syncAttachmentIds()).thenAnswer((_) async {});

      await useCase();

      verify(() => syncAttachmentIds()).called(1);
    });
  });

  group('GetWebPortalUsersUseCase', () {
    late MockPortalConnectionRepository portalRepository;
    late MockPortalMonitorApi api;
    late MockGetLatestGarageUpdatedAtUseCase getLatestUpdatedAt;
    late GetWebPortalUsersUseCase useCase;

    const portalUrl = 'https://monitor.example.com';
    const mobileId = '550e8400-e29b-41d4-a716-446655440000';
    final updatedAt = DateTime.utc(2026, 7, 8, 10, 15, 30);

    setUp(() {
      portalRepository = MockPortalConnectionRepository();
      api = MockPortalMonitorApi();
      getLatestUpdatedAt = MockGetLatestGarageUpdatedAtUseCase();
      useCase = GetWebPortalUsersUseCase(
        portalConnectionRepository: portalRepository,
        portalMonitorApi: api,
        portalUrlValidator: const PortalUrlValidator(),
        getLatestGarageUpdatedAtUseCase: getLatestUpdatedAt,
      );
      when(() => getLatestUpdatedAt()).thenAnswer((_) async => updatedAt);
    });

    test('returns empty list when not connected', () async {
      when(() => portalRepository.getPortalBaseUrl()).thenAnswer((_) async => null);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => null);

      final users = await useCase();

      expect(users, isEmpty);
    });

    test('marks all users as having access when not customized', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(() => portalRepository.arePermissionsCustomized())
          .thenAnswer((_) async => false);
      when(
        () => api.checkin(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          updatedAt: any(named: 'updatedAt'),
        ),
      ).thenAnswer(
        (_) async => const PortalCheckinResult(
          isDatabaseSync: true,
          users: {1: 'Alex Morgan', 2: 'Jordan Lee'},
        ),
      );

      final users = await useCase();

      expect(users, [
        const WebPortalUser(id: 1, name: 'Alex Morgan', hasAccess: true),
        const WebPortalUser(id: 2, name: 'Jordan Lee', hasAccess: true),
      ]);
    });

    test('respects customized allowed ids', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(() => portalRepository.arePermissionsCustomized())
          .thenAnswer((_) async => true);
      when(() => portalRepository.getAllowedUserIds())
          .thenAnswer((_) async => [1]);
      when(
        () => api.checkin(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          updatedAt: any(named: 'updatedAt'),
        ),
      ).thenAnswer(
        (_) async => const PortalCheckinResult(
          isDatabaseSync: true,
          users: {1: 'Alex Morgan', 2: 'Jordan Lee'},
        ),
      );

      final users = await useCase();

      expect(users[0].hasAccess, isTrue);
      expect(users[1].hasAccess, isFalse);
    });
  });

  group('SetWebPortalUserAccessUseCase', () {
    late MockPortalConnectionRepository portalRepository;
    late MockPortalMonitorApi api;
    late MockGetWebPortalUsersUseCase getWebPortalUsers;
    late SetWebPortalUserAccessUseCase useCase;

    const portalUrl = 'https://monitor.example.com';
    const mobileId = '550e8400-e29b-41d4-a716-446655440000';

    setUp(() {
      portalRepository = MockPortalConnectionRepository();
      api = MockPortalMonitorApi();
      getWebPortalUsers = MockGetWebPortalUsersUseCase();
      useCase = SetWebPortalUserAccessUseCase(
        portalConnectionRepository: portalRepository,
        portalMonitorApi: api,
        portalUrlValidator: const PortalUrlValidator(),
        getWebPortalUsersUseCase: getWebPortalUsers,
      );
    });

    test('syncs permissions when revoking access from default-all state', () async {
      when(() => portalRepository.getPortalBaseUrl())
          .thenAnswer((_) async => portalUrl);
      when(() => portalRepository.getMobileId()).thenAnswer((_) async => mobileId);
      when(() => portalRepository.arePermissionsCustomized())
          .thenAnswer((_) async => false);
      when(() => getWebPortalUsers()).thenAnswer(
        (_) async => const [
          WebPortalUser(id: 1, name: 'Alex Morgan', hasAccess: true),
          WebPortalUser(id: 2, name: 'Jordan Lee', hasAccess: true),
        ],
      );
      when(() => portalRepository.setPermissionsCustomized(true))
          .thenAnswer((_) async {});
      when(() => portalRepository.setAllowedUserIds(any()))
          .thenAnswer((_) async {});
      when(
        () => api.syncPermissions(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          mobileId: any(named: 'mobileId'),
          userIds: any(named: 'userIds'),
        ),
      ).thenAnswer(
        (_) async => const PortalPermissionsSyncResult(
          synced: 1,
          userIds: [1],
        ),
      );

      await useCase(userId: 2, enabled: false);

      verify(() => portalRepository.setPermissionsCustomized(true)).called(1);
      verify(() => portalRepository.setAllowedUserIds([1])).called(1);
      verify(
        () => api.syncPermissions(
          apiBaseUrl: '$portalUrl/api',
          mobileId: mobileId,
          userIds: [1],
        ),
      ).called(1);
    });
  });
}
