import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_bloc.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_event.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/builders.dart';
import '../../../support/mocks.dart';

void main() {
  late MockVehicleRepository repository;
  late MockGetDistanceUnitUseCase getUnit;
  late MockAppRouter router;

  setUp(() {
    repository = MockVehicleRepository();
    getUnit = MockGetDistanceUnitUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
  });

  VehicleListBloc build() => VehicleListBloc(
        vehicleRepository: repository,
        getDistanceUnitUseCase: getUnit,
        router: router,
      );

  final vehicles = [buildVehicle(id: 'v1'), buildVehicle(id: 'v2')];

  blocTest<VehicleListBloc, VehicleListState>(
    'started loads vehicles and the distance unit',
    setUp: () {
      when(() => repository.getAll()).thenAnswer((_) async => vehicles);
      when(() => getUnit()).thenAnswer((_) async => DistanceUnit.kilometres);
    },
    build: build,
    act: (bloc) => bloc.add(const VehicleListEvent.started()),
    expect: () => [
      const VehicleListState(isLoading: true),
      VehicleListState(
        vehicles: vehicles,
        isLoading: false,
        distanceUnit: DistanceUnit.kilometres,
      ),
    ],
  );

  blocTest<VehicleListBloc, VehicleListState>(
    'started surfaces an error message on failure',
    setUp: () {
      when(() => repository.getAll()).thenThrow(Exception('x'));
      when(() => getUnit()).thenAnswer((_) async => DistanceUnit.miles);
    },
    build: build,
    act: (bloc) => bloc.add(const VehicleListEvent.started()),
    expect: () => [
      const VehicleListState(isLoading: true),
      const VehicleListState(
        isLoading: false,
        errorMessage: 'Could not load vehicles',
      ),
    ],
  );

  blocTest<VehicleListBloc, VehicleListState>(
    'backTapped navigates home',
    build: build,
    act: (bloc) => bloc.add(const VehicleListEvent.backTapped()),
    verify: (_) => verify(() => router.goHome()).called(1),
  );

  blocTest<VehicleListBloc, VehicleListState>(
    'addVehicleTapped pushes the add route then reloads',
    setUp: () {
      when(() => repository.getAll()).thenAnswer((_) async => <Vehicle>[]);
      when(() => getUnit()).thenAnswer((_) async => DistanceUnit.miles);
    },
    build: build,
    act: (bloc) => bloc.add(const VehicleListEvent.addVehicleTapped()),
    verify: (_) {
      verify(() => router.push('/garage/vehicles/add')).called(1);
      verify(() => repository.getAll()).called(1);
    },
  );

  blocTest<VehicleListBloc, VehicleListState>(
    'vehicleTapped pushes the detail route',
    setUp: () {
      when(() => repository.getAll()).thenAnswer((_) async => <Vehicle>[]);
      when(() => getUnit()).thenAnswer((_) async => DistanceUnit.miles);
    },
    build: build,
    act: (bloc) =>
        bloc.add(const VehicleListEvent.vehicleTapped(vehicleId: 'v1')),
    verify: (_) =>
        verify(() => router.push('/garage/vehicles/v1')).called(1),
  );
}
