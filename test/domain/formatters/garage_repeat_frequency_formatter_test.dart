import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:carport/domain/formatters/garage_repeat_frequency_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 2026-03-14 09:30 is a Saturday.
  final dueAt = DateTime(2026, 3, 14, 9, 30);

  group('GarageRepeatFrequencyFormatter.format', () {
    test('daily', () {
      expect(
        GarageRepeatFrequencyFormatter.format(
          frequency: ReminderRepeatFrequency.daily,
          dueAt: dueAt,
        ),
        'Daily · 9:30 AM',
      );
    });

    test('weekly includes weekday', () {
      expect(
        GarageRepeatFrequencyFormatter.format(
          frequency: ReminderRepeatFrequency.weekly,
          dueAt: dueAt,
        ),
        'Weekly · Sat · 9:30 AM',
      );
    });

    test('monthly includes day-of-month', () {
      expect(
        GarageRepeatFrequencyFormatter.format(
          frequency: ReminderRepeatFrequency.monthly,
          dueAt: dueAt,
        ),
        'Monthly · day 14 · 9:30 AM',
      );
    });

    test('yearly includes month and day', () {
      expect(
        GarageRepeatFrequencyFormatter.format(
          frequency: ReminderRepeatFrequency.yearly,
          dueAt: dueAt,
        ),
        'Yearly · Mar 14 · 9:30 AM',
      );
    });
  });

  group('GarageRepeatFrequencyFormatter.label', () {
    test('maps each frequency to its capitalized label', () {
      expect(
        GarageRepeatFrequencyFormatter.label(ReminderRepeatFrequency.daily),
        'Daily',
      );
      expect(
        GarageRepeatFrequencyFormatter.label(ReminderRepeatFrequency.weekly),
        'Weekly',
      );
      expect(
        GarageRepeatFrequencyFormatter.label(ReminderRepeatFrequency.monthly),
        'Monthly',
      );
      expect(
        GarageRepeatFrequencyFormatter.label(ReminderRepeatFrequency.yearly),
        'Yearly',
      );
    });
  });
}
