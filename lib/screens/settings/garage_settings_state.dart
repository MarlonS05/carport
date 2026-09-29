import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_state.freezed.dart';

@freezed
abstract class GarageSettingsState with _$GarageSettingsState {
  const factory GarageSettingsState({
    @Default(true) bool isLoading,
    @Default(DistanceUnit.miles) DistanceUnit distanceUnit,
    @Default(ColorThemePreset.legacy) ColorThemePreset colorThemePreset,
    String? portalBaseUrl,
    String? errorMessage,
  }) = _GarageSettingsState;
}
