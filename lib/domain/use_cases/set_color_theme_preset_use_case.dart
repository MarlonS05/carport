import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/repositories/settings_repository.dart';

class SetColorThemePresetUseCase {
  const SetColorThemePresetUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  final SettingsRepository _settingsRepository;

  Future<void> call(ColorThemePreset preset) =>
      _settingsRepository.setColorThemePreset(preset);
}
