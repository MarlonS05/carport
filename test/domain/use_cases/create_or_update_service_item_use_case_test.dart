import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/use_cases/create_or_update_service_item_use_case.dart';
import 'package:carport/domain/use_cases/sync_service_item_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/verify_portal_sync_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/builders.dart';
import '../../support/mocks.dart';

class MockSyncVehicleToPortalUseCase extends Mock
    implements SyncVehicleToPortalUseCase {}

class MockSyncServiceItemToPortalUseCase extends Mock
    implements SyncServiceItemToPortalUseCase {}

class MockVerifyPortalSyncUseCase extends Mock implements VerifyPortalSyncUseCase {}

void main() {
  setUpAll(() {
    registerCommonFallbacks();
    registerFallbackValue(<Vehicle>[]);
    registerFallbackValue(<ServiceItem>[]);
  });

  late MockServiceItemRepository serviceItemRepository;
  late MockVehicleRepository vehicleRepository;
  late MockSyncVehicleToPortalUseCase syncVehicleToPortal;
  late MockSyncServiceItemToPortalUseCase syncServiceItemToPortal;
  late MockVerifyPortalSyncUseCase verifyPortalSync;
  late CreateOrUpdateServiceItemUseCase useCase;

  setUp(() {
    serviceItemRepository = MockServiceItemRepository();
    vehicleRepository = MockVehicleRepository();
    syncVehicleToPortal = MockSyncVehicleToPortalUseCase();
    syncServiceItemToPortal = MockSyncServiceItemToPortalUseCase();
    verifyPortalSync = MockVerifyPortalSyncUseCase();
    useCase = CreateOrUpdateServiceItemUseCase(
      serviceItemRepository: serviceItemRepository,
      vehicleRepository: vehicleRepository,
      syncVehicleToPortalUseCase: syncVehicleToPortal,
      syncServiceItemToPortalUseCase: syncServiceItemToPortal,
      verifyPortalSyncUseCase: verifyPortalSync,
    );
    when(() => syncVehicleToPortal(any())).thenAnswer((_) async {});
    when(() => syncServiceItemToPortal(any())).thenAnswer((_) async {});
    when(() => verifyPortalSync()).thenAnswer((_) async {});
  });

  test('create path returns generated id and bumps vehicle mileage', () async {
    final input = buildServiceItem(id: '', vehicleId: 'v1', mileage: 5000);
    when(() => serviceItemRepository.create(any()))
        .thenAnswer((_) async => 's-new');
    when(() => vehicleRepository.getById('v1'))
        .thenAnswer((_) async => buildVehicle(id: 'v1', mileage: 1000));
    when(() => vehicleRepository.update(any())).thenAnswer((_) async {});

    final id = await useCase(input);

    expect(id, 's-new');
    final saved =
        verify(() => vehicleRepository.update(captureAny())).captured.single
            as Vehicle;
    expect(saved.mileage, 5000);
    verify(() => syncVehicleToPortal(any())).called(1);
    verify(() => syncServiceItemToPortal(any())).called(1);
    verify(() => verifyPortalSync()).called(1);
  });

  test('update path persists item and leaves higher vehicle mileage', () async {
    final input = buildServiceItem(id: 's1', vehicleId: 'v1', mileage: 2000);
    when(() => serviceItemRepository.update(any())).thenAnswer((_) async {});
    when(() => vehicleRepository.getById('v1'))
        .thenAnswer((_) async => buildVehicle(id: 'v1', mileage: 9000));

    final id = await useCase(input);

    expect(id, 's1');
    verify(() => serviceItemRepository.update(any())).called(1);
    verifyNever(() => vehicleRepository.update(any()));
    verify(() => syncVehicleToPortal(any())).called(1);
    verify(() => verifyPortalSync()).called(1);
  });

  test('does not sync vehicle mileage when vehicle is missing', () async {
    final input = buildServiceItem(id: 's1', vehicleId: 'v1', mileage: 2000);
    when(() => serviceItemRepository.update(any())).thenAnswer((_) async {});
    when(() => vehicleRepository.getById('v1')).thenAnswer((_) async => null);

    await useCase(input);

    verifyNever(() => vehicleRepository.update(any()));
    verifyNever(() => syncVehicleToPortal(any()));
    verify(() => syncServiceItemToPortal(any())).called(1);
  });
}
