import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:carport/theme/app_themes/app_themes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_appearance_state.freezed.dart';

@freezed
abstract class GarageSettingsAppearanceState with _$GarageSettingsAppearanceState {
  const GarageSettingsAppearanceState._();

  const factory GarageSettingsAppearanceState({
    @Default(true) bool isLoading,
    @Default(AppThemes.defaultPreset) ColorThemePreset savedPreset,
    @Default(AppThemes.defaultPreset) ColorThemePreset selectedPreset,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = _GarageSettingsAppearanceState;

  bool get hasChanges => savedPreset != selectedPreset;
}
