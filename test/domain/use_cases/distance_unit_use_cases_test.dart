import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/use_cases/get_distance_unit_use_case.dart';
import 'package:carport/domain/use_cases/set_distance_unit_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late MockSettingsRepository settingsRepository;

  setUp(() {
    settingsRepository = MockSettingsRepository();
  });

  test('GetDistanceUnitUseCase reads from settings repository', () async {
    when(() => settingsRepository.getDistanceUnit())
        .thenAnswer((_) async => DistanceUnit.kilometres);
    final useCase =
        GetDistanceUnitUseCase(settingsRepository: settingsRepository);

    expect(await useCase(), DistanceUnit.kilometres);
  });

  test('SetDistanceUnitUseCase writes to settings repository', () async {
    when(() => settingsRepository.setDistanceUnit(any()))
        .thenAnswer((_) async {});
    final useCase =
        SetDistanceUnitUseCase(settingsRepository: settingsRepository);

    await useCase(DistanceUnit.kilometres);

    verify(() => settingsRepository.setDistanceUnit(DistanceUnit.kilometres))
        .called(1);
  });
}
