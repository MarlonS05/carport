import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/use_cases/get_garage_home_stats_use_case.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/home/garage_home_bloc.dart';
import 'package:carport/screens/garage/home/garage_home_event.dart';
import 'package:carport/screens/garage/home/garage_home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/mocks.dart';

void main() {
  late MockGetGarageHomeStatsUseCase getStats;
  late MockAppRouter router;

  setUp(() {
    getStats = MockGetGarageHomeStatsUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
  });

  GarageHomeBloc build() => GarageHomeBloc(
        getGarageHomeStatsUseCase: getStats,
        router: router,
      );

  blocTest<GarageHomeBloc, GarageHomeState>(
    'started emits loading then stats',
    setUp: () => when(() => getStats()).thenAnswer(
      (_) async => const GarageHomeStats(vehicleCount: 2, entryCount: 5),
    ),
    build: build,
    act: (bloc) => bloc.add(const GarageHomeEvent.started()),
    expect: () => [
      const GarageHomeState(isLoading: true),
      const GarageHomeState(vehicleCount: 2, entryCount: 5),
    ],
  );

  blocTest<GarageHomeBloc, GarageHomeState>(
    'started emits error message on failure',
    setUp: () => when(() => getStats()).thenThrow(Exception('boom')),
    build: build,
    act: (bloc) => bloc.add(const GarageHomeEvent.started()),
    expect: () => [
      const GarageHomeState(isLoading: true),
      const GarageHomeState(errorMessage: 'Could not load stats'),
    ],
  );

  blocTest<GarageHomeBloc, GarageHomeState>(
    'vehiclesTapped navigates to the vehicles route',
    build: build,
    act: (bloc) => bloc.add(const GarageHomeEvent.vehiclesTapped()),
    verify: (_) => verify(() => router.push(AppRoutes.vehicles)).called(1),
  );

  blocTest<GarageHomeBloc, GarageHomeState>(
    'settingsTapped navigates to the settings route',
    build: build,
    act: (bloc) => bloc.add(const GarageHomeEvent.settingsTapped()),
    verify: (_) => verify(() => router.push(AppRoutes.settings)).called(1),
  );
}
