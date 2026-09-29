import 'reminder_repeat_frequency.dart';

class Reminder {
  final String id;
  final String name;
  final String body;
  final DateTime dueAt;

  /// `null` means a one-time reminder; otherwise the OS recurrence cadence.
  final ReminderRepeatFrequency? repeatFrequency;

  const Reminder({
    required this.id,
    required this.name,
    required this.body,
    required this.dueAt,
    this.repeatFrequency,
  });

  bool get isRepeating => repeatFrequency != null;

  factory Reminder.empty() {
    return Reminder(
      id: '',
      name: '',
      body: '',
      dueAt: DateTime.fromMillisecondsSinceEpoch(0),
      repeatFrequency: null,
    );
  }
}
