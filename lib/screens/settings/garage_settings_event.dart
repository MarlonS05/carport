import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_event.freezed.dart';

@freezed
abstract class GarageSettingsEvent with _$GarageSettingsEvent {
  const factory GarageSettingsEvent.started() = _Started;

  const factory GarageSettingsEvent.unitsTapped() = _UnitsTapped;

  const factory GarageSettingsEvent.permissionsTapped() = _PermissionsTapped;

  const factory GarageSettingsEvent.connectivityTapped() = _ConnectivityTapped;

  const factory GarageSettingsEvent.appearanceTapped() = _AppearanceTapped;

  const factory GarageSettingsEvent.backTapped() = _BackTapped;
}
