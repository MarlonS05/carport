import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_bloc.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_event.dart';
import 'package:carport/screens/garage/quick_entry_form/quick_entry_form_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/builders.dart';
import '../../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late MockVehicleRepository repository;
  late MockCreateOrUpdateServiceItemUseCase saveItem;
  late MockGetDistanceUnitUseCase getUnit;
  late MockAppRouter router;

  setUp(() {
    repository = MockVehicleRepository();
    saveItem = MockCreateOrUpdateServiceItemUseCase();
    getUnit = MockGetDistanceUnitUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
    when(() => getUnit()).thenAnswer((_) async => DistanceUnit.miles);
  });

  QuickEntryFormBloc build() => QuickEntryFormBloc(
        vehicleRepository: repository,
        createOrUpdateServiceItemUseCase: saveItem,
        getDistanceUnitUseCase: getUnit,
        router: router,
      );

  final vehicle = buildVehicle(id: 'v1');

  blocTest<QuickEntryFormBloc, QuickEntryFormState>(
    'started loads the vehicle',
    setUp: () =>
        when(() => repository.getById('v1')).thenAnswer((_) async => vehicle),
    build: build,
    act: (bloc) =>
        bloc.add(const QuickEntryFormEvent.started(vehicleId: 'v1')),
    expect: () => [
      isA<QuickEntryFormState>()
          .having((s) => s.vehicleId, 'vehicleId', 'v1')
          .having((s) => s.isLoading, 'isLoading', true),
      isA<QuickEntryFormState>()
          .having((s) => s.vehicle, 'vehicle', vehicle)
          .having((s) => s.isLoading, 'isLoading', false),
    ],
  );

  blocTest<QuickEntryFormBloc, QuickEntryFormState>(
    'started with empty vehicleId reports an error',
    build: build,
    act: (bloc) => bloc.add(const QuickEntryFormEvent.started(vehicleId: '')),
    expect: () => [
      isA<QuickEntryFormState>()
          .having((s) => s.errorMessage, 'errorMessage', contains('vehicleId')),
    ],
  );

  final seeded = QuickEntryFormState(
    vehicleId: 'v1',
    vehicle: vehicle,
    date: DateTime(2026, 1, 1),
    isLoading: false,
  );

  blocTest<QuickEntryFormBloc, QuickEntryFormState>(
    'submitted with a blank title reports a title error',
    build: build,
    seed: () => seeded,
    act: (bloc) => bloc.add(const QuickEntryFormEvent.submitted()),
    expect: () => [seeded.copyWith(titleError: 'Title is required')],
    verify: (_) => verifyNever(() => saveItem(any())),
  );

  blocTest<QuickEntryFormBloc, QuickEntryFormState>(
    'submitted with a valid entry saves and navigates home',
    setUp: () =>
        when(() => saveItem(any())).thenAnswer((_) async => 'new-id'),
    build: build,
    seed: () => seeded.copyWith(title: 'Oil change', mileage: '1500'),
    act: (bloc) => bloc.add(const QuickEntryFormEvent.submitted()),
    expect: () => [
      seeded.copyWith(
        title: 'Oil change',
        mileage: '1500',
        isSubmitting: true,
      ),
    ],
    verify: (_) {
      verify(() => saveItem(any())).called(1);
      verify(() => router.goHome()).called(1);
    },
  );
}
