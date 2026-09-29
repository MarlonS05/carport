import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_reminder_form_event.freezed.dart';

@freezed
abstract class GarageReminderFormEvent with _$GarageReminderFormEvent {
  const factory GarageReminderFormEvent.started({
    String? reminderId,
  }) = _Started;

  const factory GarageReminderFormEvent.repeatingChanged({
    required bool repeating,
  }) = _RepeatingChanged;

  const factory GarageReminderFormEvent.repeatFrequencyChanged({
    required ReminderRepeatFrequency frequency,
  }) = _RepeatFrequencyChanged;

  const factory GarageReminderFormEvent.backTapped() = _BackTapped;

  const factory GarageReminderFormEvent.saveTapped({
    required String name,
    required String body,
    required DateTime dueAt,
  }) = _SaveTapped;
}
