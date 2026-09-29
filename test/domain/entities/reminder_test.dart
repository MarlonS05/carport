import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Reminder', () {
    test('isRepeating reflects repeatFrequency', () {
      final oneTime = Reminder(
        id: '1',
        name: 'n',
        body: '',
        dueAt: DateTime(2026),
      );
      expect(oneTime.isRepeating, isFalse);

      final repeating = Reminder(
        id: '1',
        name: 'n',
        body: '',
        dueAt: DateTime(2026),
        repeatFrequency: ReminderRepeatFrequency.weekly,
      );
      expect(repeating.isRepeating, isTrue);
    });

    test('empty() is a one-time reminder with epoch dueAt', () {
      final empty = Reminder.empty();
      expect(empty.id, '');
      expect(empty.name, '');
      expect(empty.repeatFrequency, isNull);
      expect(empty.isRepeating, isFalse);
      expect(empty.dueAt, DateTime.fromMillisecondsSinceEpoch(0));
    });
  });
}
