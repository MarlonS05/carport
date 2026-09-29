import 'package:carport/domain/entities/distance_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_units_state.freezed.dart';

@freezed
abstract class GarageSettingsUnitsState with _$GarageSettingsUnitsState {
  const factory GarageSettingsUnitsState({
    @Default(true) bool isLoading,
    @Default(DistanceUnit.miles) DistanceUnit selectedUnit,
    @Default(false) bool isSaving,
    String? errorMessage,
  }) = _GarageSettingsUnitsState;
}
