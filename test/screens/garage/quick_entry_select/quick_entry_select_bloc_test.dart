import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/screens/garage/quick_entry_select/quick_entry_select_bloc.dart';
import 'package:carport/screens/garage/quick_entry_select/quick_entry_select_event.dart';
import 'package:carport/screens/garage/quick_entry_select/quick_entry_select_state.dart';
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

  QuickEntrySelectBloc build() => QuickEntrySelectBloc(
        vehicleRepository: repository,
        getDistanceUnitUseCase: getUnit,
        router: router,
      );

  final vehicles = [buildVehicle(id: 'v1')];

  blocTest<QuickEntrySelectBloc, QuickEntrySelectState>(
    'started loads vehicles and the distance unit',
    setUp: () {
      when(() => repository.getAll()).thenAnswer((_) async => vehicles);
      when(() => getUnit()).thenAnswer((_) async => DistanceUnit.miles);
    },
    build: build,
    act: (bloc) => bloc.add(const QuickEntrySelectEvent.started()),
    expect: () => [
      const QuickEntrySelectState(isLoading: true),
      QuickEntrySelectState(vehicles: vehicles, isLoading: false),
    ],
  );

  blocTest<QuickEntrySelectBloc, QuickEntrySelectState>(
    'vehicleTapped pushes the quick entry form route',
    build: build,
    act: (bloc) =>
        bloc.add(const QuickEntrySelectEvent.vehicleTapped(vehicleId: 'v1')),
    verify: (_) => verify(
      () => router.push('/garage/quick-entry/v1/form'),
    ).called(1),
  );

  blocTest<QuickEntrySelectBloc, QuickEntrySelectState>(
    'backTapped pops the router',
    build: build,
    act: (bloc) => bloc.add(const QuickEntrySelectEvent.backTapped()),
    verify: (_) => verify(() => router.pop()).called(1),
  );
}
