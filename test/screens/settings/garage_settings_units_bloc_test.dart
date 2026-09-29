import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/screens/settings/units/garage_settings_units_bloc.dart';
import 'package:carport/screens/settings/units/garage_settings_units_event.dart';
import 'package:carport/screens/settings/units/garage_settings_units_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late MockGetDistanceUnitUseCase getUnit;
  late MockSetDistanceUnitUseCase setUnit;
  late MockAppRouter router;

  setUp(() {
    getUnit = MockGetDistanceUnitUseCase();
    setUnit = MockSetDistanceUnitUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
  });

  GarageSettingsUnitsBloc build() => GarageSettingsUnitsBloc(
        getDistanceUnitUseCase: getUnit,
        setDistanceUnitUseCase: setUnit,
        router: router,
      );

  blocTest<GarageSettingsUnitsBloc, GarageSettingsUnitsState>(
    'started loads the selected unit',
    setUp: () =>
        when(() => getUnit()).thenAnswer((_) async => DistanceUnit.kilometres),
    build: build,
    act: (bloc) => bloc.add(const GarageSettingsUnitsEvent.started()),
    expect: () => [
      const GarageSettingsUnitsState(isLoading: true),
      const GarageSettingsUnitsState(
        isLoading: false,
        selectedUnit: DistanceUnit.kilometres,
      ),
    ],
  );

  blocTest<GarageSettingsUnitsBloc, GarageSettingsUnitsState>(
    'selecting a new unit saves it and pops',
    setUp: () => when(() => setUnit(any())).thenAnswer((_) async {}),
    build: build,
    seed: () => const GarageSettingsUnitsState(
      isLoading: false,
      selectedUnit: DistanceUnit.miles,
    ),
    act: (bloc) => bloc.add(
      const GarageSettingsUnitsEvent.unitSelected(DistanceUnit.kilometres),
    ),
    expect: () => [
      const GarageSettingsUnitsState(
        isLoading: false,
        isSaving: true,
        selectedUnit: DistanceUnit.miles,
      ),
    ],
    verify: (_) {
      verify(() => setUnit(DistanceUnit.kilometres)).called(1);
      verify(() => router.pop()).called(1);
    },
  );

  blocTest<GarageSettingsUnitsBloc, GarageSettingsUnitsState>(
    'selecting the already-selected unit is a no-op',
    build: build,
    seed: () => const GarageSettingsUnitsState(
      isLoading: false,
      selectedUnit: DistanceUnit.miles,
    ),
    act: (bloc) => bloc
        .add(const GarageSettingsUnitsEvent.unitSelected(DistanceUnit.miles)),
    expect: () => const <GarageSettingsUnitsState>[],
    verify: (_) => verifyNever(() => setUnit(any())),
  );
}
