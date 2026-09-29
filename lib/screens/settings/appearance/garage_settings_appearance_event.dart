import 'package:carport/domain/entities/color_theme_preset.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_appearance_event.freezed.dart';

@freezed
abstract class GarageSettingsAppearanceEvent with _$GarageSettingsAppearanceEvent {
  const factory GarageSettingsAppearanceEvent.started() = _Started;

  const factory GarageSettingsAppearanceEvent.presetSelected(
    ColorThemePreset preset,
  ) = _PresetSelected;

  const factory GarageSettingsAppearanceEvent.saveTapped() = _SaveTapped;

  const factory GarageSettingsAppearanceEvent.backTapped() = _BackTapped;
}
