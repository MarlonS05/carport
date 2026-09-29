import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/repositories/settings_repository.dart';

class GetColorThemePresetUseCase {
  const GetColorThemePresetUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  final SettingsRepository _settingsRepository;

  Future<ColorThemePreset> call() => _settingsRepository.getColorThemePreset();
}
