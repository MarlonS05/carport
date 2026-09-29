import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/use_cases/create_or_update_vehicle_use_case.dart';
import 'package:carport/domain/use_cases/sync_vehicle_to_portal_use_case.dart';
import 'package:carport/domain/use_cases/verify_portal_sync_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/builders.dart';
import '../../support/mocks.dart';

class MockSyncVehicleToPortalUseCase extends Mock
    implements SyncVehicleToPortalUseCase {}

class MockVerifyPortalSyncUseCase extends Mock implements VerifyPortalSyncUseCase {}

void main() {
  setUpAll(() {
    registerCommonFallbacks();
    registerFallbackValue(<Vehicle>[]);
  });

  late MockVehicleRepository vehicleRepository;
  late MockServiceItemRepository serviceItemRepository;
  late MockSyncVehicleToPortalUseCase syncVehicleToPortal;
  late MockVerifyPortalSyncUseCase verifyPortalSync;
  late CreateOrUpdateVehicleUseCase useCase;

  setUp(() {
    vehicleRepository = MockVehicleRepository();
    serviceItemRepository = MockServiceItemRepository();
    syncVehicleToPortal = MockSyncVehicleToPortalUseCase();
    verifyPortalSync = MockVerifyPortalSyncUseCase();
    useCase = CreateOrUpdateVehicleUseCase(
      vehicleRepository: vehicleRepository,
      serviceItemRepository: serviceItemRepository,
      syncVehicleToPortalUseCase: syncVehicleToPortal,
      verifyPortalSyncUseCase: verifyPortalSync,
    );
    when(() => syncVehicleToPortal(any())).thenAnswer((_) async {});
    when(() => verifyPortalSync()).thenAnswer((_) async {});
  });

  test('create path assigns returned id and skips mileage floor', () async {
    final input = buildVehicle(id: '', mileage: 500);
    when(() => vehicleRepository.create(any())).thenAnswer((_) async => 'v-new');

    final result = await useCase(input);

    expect(result.id, 'v-new');
    expect(result.mileage, 500);
    verifyNever(() => serviceItemRepository.getByVehicleId(any()));
    verify(() => syncVehicleToPortal(any(that: predicate<List<Vehicle>>(
      (vehicles) => vehicles.single.id == 'v-new',
    )))).called(1);
    verify(() => verifyPortalSync()).called(1);
  });

  test('update floors mileage up to the highest service item mileage',
      () async {
    final input = buildVehicle(id: 'v1', mileage: 1000);
    when(() => serviceItemRepository.getByVehicleId('v1')).thenAnswer(
      (_) async => [
        buildServiceItem(id: 's1', mileage: 1500),
        buildServiceItem(id: 's2', mileage: 3000),
        buildServiceItem(id: 's3', mileage: 2000),
      ],
    );
    when(() => vehicleRepository.update(any())).thenAnswer((_) async {});

    final result = await useCase(input);

    expect(result.mileage, 3000);
    final saved =
        verify(() => vehicleRepository.update(captureAny())).captured.single
            as Vehicle;
    expect(saved.mileage, 3000);
    verify(() => verifyPortalSync()).called(1);
  });

  test('update keeps mileage when already at or above max', () async {
    final input = buildVehicle(id: 'v1', mileage: 5000);
    when(() => serviceItemRepository.getByVehicleId('v1')).thenAnswer(
      (_) async => [buildServiceItem(id: 's1', mileage: 3000)],
    );
    when(() => vehicleRepository.update(any())).thenAnswer((_) async {});

    final result = await useCase(input);

    expect(result.mileage, 5000);
  });

  test('update keeps mileage when there are no service items', () async {
    final input = buildVehicle(id: 'v1', mileage: 100);
    when(() => serviceItemRepository.getByVehicleId('v1'))
        .thenAnswer((_) async => []);
    when(() => vehicleRepository.update(any())).thenAnswer((_) async {});

    final result = await useCase(input);

    expect(result.mileage, 100);
  });

  test('local save succeeds when portal sync fails', () async {
    final input = buildVehicle(id: '', mileage: 500);
    when(() => vehicleRepository.create(any())).thenAnswer((_) async => 'v-new');
    when(() => syncVehicleToPortal(any()))
        .thenThrow(Exception('sync failed'));

    final result = await useCase(input);

    expect(result.id, 'v-new');
  });
}
