import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:carport/platform/reminder_repeat_frequency_components.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('toDateTimeComponents', () {
    test('maps each frequency to the plugin recurrence component', () {
      expect(
        toDateTimeComponents(ReminderRepeatFrequency.daily),
        DateTimeComponents.time,
      );
      expect(
        toDateTimeComponents(ReminderRepeatFrequency.weekly),
        DateTimeComponents.dayOfWeekAndTime,
      );
      expect(
        toDateTimeComponents(ReminderRepeatFrequency.monthly),
        DateTimeComponents.dayOfMonthAndTime,
      );
      expect(
        toDateTimeComponents(ReminderRepeatFrequency.yearly),
        DateTimeComponents.dateAndTime,
      );
    });

    test('one-time reminders have no recurrence component', () {
      expect(toDateTimeComponents(null), isNull);
    });
  });
}
