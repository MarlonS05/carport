import 'package:carport/domain/entities/distance_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_units_event.freezed.dart';

@freezed
abstract class GarageSettingsUnitsEvent with _$GarageSettingsUnitsEvent {
  const factory GarageSettingsUnitsEvent.started() = _Started;

  const factory GarageSettingsUnitsEvent.unitSelected(DistanceUnit unit) =
      _UnitSelected;

  const factory GarageSettingsUnitsEvent.backTapped() = _BackTapped;
}
