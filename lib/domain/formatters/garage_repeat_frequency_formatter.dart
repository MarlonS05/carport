import 'package:intl/intl.dart';

import '../entities/reminder_repeat_frequency.dart';

/// Display labels for repeating reminder schedules in Garage views.
abstract final class GarageRepeatFrequencyFormatter {
  GarageRepeatFrequencyFormatter._();

  static final DateFormat _timeFormat = DateFormat('h:mm a');
  static final DateFormat _weekdayFormat = DateFormat('EEE');
  static final DateFormat _monthDayFormat = DateFormat('MMM d');

  static String format({
    required ReminderRepeatFrequency frequency,
    required DateTime dueAt,
  }) {
    final time = _timeFormat.format(dueAt);

    return switch (frequency) {
      ReminderRepeatFrequency.daily => 'Daily · $time',
      ReminderRepeatFrequency.weekly =>
        'Weekly · ${_weekdayFormat.format(dueAt)} · $time',
      ReminderRepeatFrequency.monthly =>
        'Monthly · day ${dueAt.day} · $time',
      ReminderRepeatFrequency.yearly =>
        'Yearly · ${_monthDayFormat.format(dueAt)} · $time',
    };
  }

  static String label(ReminderRepeatFrequency frequency) {
    return switch (frequency) {
      ReminderRepeatFrequency.daily => 'Daily',
      ReminderRepeatFrequency.weekly => 'Weekly',
      ReminderRepeatFrequency.monthly => 'Monthly',
      ReminderRepeatFrequency.yearly => 'Yearly',
    };
  }
}
