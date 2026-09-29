import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:carport/platform/wall_clock_notification_time.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WallClockNotificationTime.nextOccurrence', () {
    final past = DateTime(2000, 1, 1, 9, 30);

    test('daily rolls a past anchor to a future time-of-day', () {
      final next =
          WallClockNotificationTime.nextOccurrence(
        past,
        ReminderRepeatFrequency.daily,
      );

      expect(next.isAfter(DateTime.now()), isTrue);
      expect(next.hour, 9);
      expect(next.minute, 30);
      expect(
        next.difference(DateTime.now()).inHours < 24,
        isTrue,
        reason: 'daily occurrence should be within the next day',
      );
    });

    test('weekly keeps the anchor weekday and is in the future', () {
      final next = WallClockNotificationTime.nextOccurrence(
        past,
        ReminderRepeatFrequency.weekly,
      );

      expect(next.isAfter(DateTime.now()), isTrue);
      expect(next.weekday, past.weekday);
      expect(next.hour, 9);
      expect(next.minute, 30);
    });

    test('monthly keeps the day of month and is in the future', () {
      final anchor = DateTime(2000, 1, 15, 9, 30);
      final next = WallClockNotificationTime.nextOccurrence(
        anchor,
        ReminderRepeatFrequency.monthly,
      );

      expect(next.isAfter(DateTime.now()), isTrue);
      expect(next.day, 15);
    });

    test('monthly on the 31st only lands on months with 31 days', () {
      final anchor = DateTime(2000, 1, 31, 9, 30);
      final next = WallClockNotificationTime.nextOccurrence(
        anchor,
        ReminderRepeatFrequency.monthly,
      );

      expect(next.isAfter(DateTime.now()), isTrue);
      expect(next.day, 31);
      // A month that actually has 31 days.
      expect(DateTime(next.year, next.month + 1, 0).day, 31);
    });

    test('yearly on Feb 29 lands on a leap year', () {
      final anchor = DateTime(2024, 2, 29, 9, 30);
      final next = WallClockNotificationTime.nextOccurrence(
        anchor,
        ReminderRepeatFrequency.yearly,
      );

      expect(next.isAfter(DateTime.now()), isTrue);
      expect(next.month, 2);
      expect(next.day, 29);
      // Feb has 29 days => leap year.
      expect(DateTime(next.year, 3, 0).day, 29);
    });
  });
}
