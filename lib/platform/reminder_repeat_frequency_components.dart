import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

DateTimeComponents? toDateTimeComponents(ReminderRepeatFrequency? frequency) {
  return switch (frequency) {
    ReminderRepeatFrequency.daily => DateTimeComponents.time,
    ReminderRepeatFrequency.weekly => DateTimeComponents.dayOfWeekAndTime,
    ReminderRepeatFrequency.monthly => DateTimeComponents.dayOfMonthAndTime,
    ReminderRepeatFrequency.yearly => DateTimeComponents.dateAndTime,
    null => null,
  };
}
