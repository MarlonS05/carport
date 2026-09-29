import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_bloc.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_event.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/builders.dart';
import '../../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late MockCreateOrUpdateVehicleUseCase createOrUpdateVehicle;
  late MockGetDistanceUnitUseCase getUnit;
  late MockAppRouter router;

  setUp(() {
    createOrUpdateVehicle = MockCreateOrUpdateVehicleUseCase();
    getUnit = MockGetDistanceUnitUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
  });

  AddVehicleBloc build() => AddVehicleBloc(
        createOrUpdateVehicleUseCase: createOrUpdateVehicle,
        getDistanceUnitUseCase: getUnit,
        router: router,
      );

  blocTest<AddVehicleBloc, AddVehicleState>(
    'started loads the distance unit',
    setUp: () =>
        when(() => getUnit()).thenAnswer((_) async => DistanceUnit.kilometres),
    build: build,
    act: (bloc) => bloc.add(const AddVehicleEvent.started()),
    expect: () => [
      const AddVehicleState(distanceUnit: DistanceUnit.kilometres),
    ],
  );

  blocTest<AddVehicleBloc, AddVehicleState>(
    'nameChanged updates the name and clears errors',
    build: build,
    seed: () => const AddVehicleState(nameError: 'Name is required'),
    act: (bloc) => bloc.add(const AddVehicleEvent.nameChanged('Civic')),
    expect: () => [const AddVehicleState(name: 'Civic')],
  );

  blocTest<AddVehicleBloc, AddVehicleState>(
    'submitted with a blank name sets a name error',
    build: build,
    act: (bloc) => bloc.add(const AddVehicleEvent.submitted()),
    expect: () => [const AddVehicleState(nameError: 'Name is required')],
    verify: (_) => verifyNever(() => createOrUpdateVehicle(any())),
  );

  blocTest<AddVehicleBloc, AddVehicleState>(
    'submitted with invalid mileage sets an error message',
    build: build,
    seed: () => const AddVehicleState(name: 'Civic', mileage: 'abc'),
    act: (bloc) => bloc.add(const AddVehicleEvent.submitted()),
    expect: () => [
      const AddVehicleState(
        name: 'Civic',
        mileage: 'abc',
        errorMessage: 'Enter a valid mileage',
      ),
    ],
    verify: (_) => verifyNever(() => createOrUpdateVehicle(any())),
  );

  blocTest<AddVehicleBloc, AddVehicleState>(
    'submitted with a valid name creates the vehicle and navigates',
    setUp: () => when(() => createOrUpdateVehicle(any())).thenAnswer(
      (_) async => buildVehicle(id: 'new-id', name: 'Civic', mileage: 1000),
    ),
    build: build,
    seed: () => const AddVehicleState(name: 'Civic', mileage: '1,000'),
    act: (bloc) => bloc.add(const AddVehicleEvent.submitted()),
    expect: () => [
      const AddVehicleState(
        name: 'Civic',
        mileage: '1,000',
        isSubmitting: true,
      ),
    ],
    verify: (_) {
      final saved = verify(() => createOrUpdateVehicle(captureAny())).captured
          .single as Vehicle;
      expect(saved.name, 'Civic');
      expect(saved.mileage, 1000);
      verify(() => router.go('/garage/vehicles')).called(1);
    },
  );
}
