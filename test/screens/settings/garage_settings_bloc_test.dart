import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/settings/garage_settings_bloc.dart';
import 'package:carport/screens/settings/garage_settings_event.dart';
import 'package:carport/screens/settings/garage_settings_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

void main() {
  late MockGetDistanceUnitUseCase getUnit;
  late MockGetColorThemePresetUseCase getColorThemePreset;
  late MockGetPortalBaseUrlUseCase getPortalBaseUrl;
  late MockAppRouter router;

  setUp(() {
    getUnit = MockGetDistanceUnitUseCase();
    getColorThemePreset = MockGetColorThemePresetUseCase();
    getPortalBaseUrl = MockGetPortalBaseUrlUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
    when(() => getPortalBaseUrl()).thenAnswer((_) async => null);
    when(() => getColorThemePreset()).thenAnswer(
      (_) async => ColorThemePreset.legacy,
    );
  });

  GarageSettingsBloc build() => GarageSettingsBloc(
        getDistanceUnitUseCase: getUnit,
        getColorThemePresetUseCase: getColorThemePreset,
        getPortalBaseUrlUseCase: getPortalBaseUrl,
        router: router,
      );

  blocTest<GarageSettingsBloc, GarageSettingsState>(
    'started loads the distance unit',
    setUp: () =>
        when(() => getUnit()).thenAnswer((_) async => DistanceUnit.kilometres),
    build: build,
    act: (bloc) => bloc.add(const GarageSettingsEvent.started()),
    expect: () => [
      const GarageSettingsState(isLoading: true),
      const GarageSettingsState(
        isLoading: false,
        distanceUnit: DistanceUnit.kilometres,
        colorThemePreset: ColorThemePreset.legacy,
      ),
    ],
  );

  blocTest<GarageSettingsBloc, GarageSettingsState>(
    'permissionsTapped navigates to the permissions route',
    build: build,
    act: (bloc) => bloc.add(const GarageSettingsEvent.permissionsTapped()),
    verify: (_) =>
        verify(() => router.push(AppRoutes.settingsPermissions)).called(1),
  );

  blocTest<GarageSettingsBloc, GarageSettingsState>(
    'backTapped pops the router',
    build: build,
    act: (bloc) => bloc.add(const GarageSettingsEvent.backTapped()),
    verify: (_) => verify(() => router.pop()).called(1),
  );

  blocTest<GarageSettingsBloc, GarageSettingsState>(
    'unitsTapped pushes the units route then reloads the unit',
    setUp: () =>
        when(() => getUnit()).thenAnswer((_) async => DistanceUnit.miles),
    build: build,
    act: (bloc) => bloc.add(const GarageSettingsEvent.unitsTapped()),
    verify: (_) {
      verify(() => router.push(AppRoutes.settingsUnits)).called(1);
      verify(() => getUnit()).called(1);
    },
  );
}
