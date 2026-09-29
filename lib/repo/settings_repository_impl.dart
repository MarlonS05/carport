import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/repositories/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._preferences);

  static const _distanceUnitKey = 'distance_unit';
  static const _colorThemePresetKey = 'color_theme_preset';

  final SharedPreferences _preferences;

  @override
  Future<DistanceUnit> getDistanceUnit() async {
    return DistanceUnit.fromStorage(_preferences.getString(_distanceUnitKey));
  }

  @override
  Future<void> setDistanceUnit(DistanceUnit unit) async {
    await _preferences.setString(_distanceUnitKey, unit.toStorage());
  }

  @override
  Future<ColorThemePreset> getColorThemePreset() async {
    return ColorThemePreset.fromStorage(
      _preferences.getString(_colorThemePresetKey),
    );
  }

  @override
  Future<void> setColorThemePreset(ColorThemePreset preset) async {
    await _preferences.setString(_colorThemePresetKey, preset.toStorage());
  }
}
