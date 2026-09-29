import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_home_event.freezed.dart';

@freezed
abstract class GarageHomeEvent with _$GarageHomeEvent {
  const factory GarageHomeEvent.started() = _Started;

  const factory GarageHomeEvent.quickEntryTapped() = _QuickEntryTapped;

  const factory GarageHomeEvent.vehiclesTapped() = _VehiclesTapped;

  const factory GarageHomeEvent.remindersTapped() = _RemindersTapped;

  const factory GarageHomeEvent.settingsTapped() = _SettingsTapped;
}
