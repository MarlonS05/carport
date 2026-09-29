import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_permissions_event.freezed.dart';

@freezed
abstract class GarageSettingsPermissionsEvent with _$GarageSettingsPermissionsEvent {
  const factory GarageSettingsPermissionsEvent.started() = _Started;

  const factory GarageSettingsPermissionsEvent.permissionTapped() =
      _PermissionTapped;

  const factory GarageSettingsPermissionsEvent.backTapped() = _BackTapped;
}
