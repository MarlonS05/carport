import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/use_cases/get_color_theme_preset_use_case.dart';
import 'package:carport/domain/use_cases/set_color_theme_preset_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

void main() {
  late MockSettingsRepository settingsRepository;

  setUpAll(registerCommonFallbacks);

  setUp(() {
    settingsRepository = MockSettingsRepository();
  });

  test('GetColorThemePresetUseCase reads from settings repository', () async {
    when(() => settingsRepository.getColorThemePreset())
        .thenAnswer((_) async => ColorThemePreset.subZero);
    final useCase =
        GetColorThemePresetUseCase(settingsRepository: settingsRepository);

    expect(await useCase(), ColorThemePreset.subZero);
  });

  test('SetColorThemePresetUseCase writes to settings repository', () async {
    when(() => settingsRepository.setColorThemePreset(any()))
        .thenAnswer((_) async {});
    final useCase =
        SetColorThemePresetUseCase(settingsRepository: settingsRepository);

    await useCase(ColorThemePreset.swampFog);

    verify(
      () => settingsRepository.setColorThemePreset(ColorThemePreset.swampFog),
    ).called(1);
  });
}
