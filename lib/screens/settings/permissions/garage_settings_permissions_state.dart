import 'package:carport/domain/entities/notification_permission_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_permissions_state.freezed.dart';

@freezed
abstract class GarageSettingsPermissionsState
    with _$GarageSettingsPermissionsState {
  const factory GarageSettingsPermissionsState({
    @Default(true) bool isLoading,
    @Default(false) bool isRequesting,
    @Default(NotificationPermissionStatus.notDetermined)
    NotificationPermissionStatus permissionStatus,
    String? errorMessage,
  }) = _GarageSettingsPermissionsState;
}
