import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_reminder_form_state.freezed.dart';

enum GarageReminderFormMode { add, edit }

@freezed
abstract class GarageReminderFormState with _$GarageReminderFormState {
  const factory GarageReminderFormState({
    @Default(GarageReminderFormMode.add) GarageReminderFormMode mode,
    @Default('') String reminderId,
    Reminder? reminder,
    @Default(false) bool repeating,
    @Default(ReminderRepeatFrequency.daily)
    ReminderRepeatFrequency repeatFrequency,
    @Default(true) bool isLoading,
    @Default(false) bool isSubmitting,
    @Default({}) Map<String, String> fieldErrors,
    String? errorMessage,
    String? warningMessage,
  }) = _GarageReminderFormState;
}
