import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/entities/distance_unit.dart';

abstract class SettingsRepository {
  Future<DistanceUnit> getDistanceUnit();

  Future<void> setDistanceUnit(DistanceUnit unit);

  Future<ColorThemePreset> getColorThemePreset();

  Future<void> setColorThemePreset(ColorThemePreset preset);
}
