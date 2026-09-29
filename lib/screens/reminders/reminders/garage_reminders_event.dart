import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_reminders_event.freezed.dart';

@freezed
abstract class GarageRemindersEvent with _$GarageRemindersEvent {
  const factory GarageRemindersEvent.started() = _Started;

  const factory GarageRemindersEvent.refreshed() = _Refreshed;

  const factory GarageRemindersEvent.backTapped() = _BackTapped;

  const factory GarageRemindersEvent.addTapped() = _AddTapped;

  const factory GarageRemindersEvent.editTapped({
    required String reminderId,
  }) = _EditTapped;
}
