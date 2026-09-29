import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_web_access_event.freezed.dart';

@freezed
abstract class GarageSettingsWebAccessEvent
    with _$GarageSettingsWebAccessEvent {
  const factory GarageSettingsWebAccessEvent.started() = _Started;

  const factory GarageSettingsWebAccessEvent.userAccessToggled({
    required int userId,
    required bool enabled,
  }) = _UserAccessToggled;

  const factory GarageSettingsWebAccessEvent.backTapped() = _BackTapped;
}
