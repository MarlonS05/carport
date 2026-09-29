import 'package:carport/logger/logger.dart';

import '../entities/reminder.dart';
import '../entities/reminder_repeat_frequency.dart';
import '../formatters/wall_clock_datetime.dart';

class ReminderModel {
  final String id;
  final String name;
  final String body;
  final DateTime dueAt;
  final ReminderRepeatFrequency? repeatFrequency;

  const ReminderModel({
    required this.id,
    required this.name,
    required this.body,
    required this.dueAt,
    this.repeatFrequency,
  });

  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      id: map['id'] as String,
      name: map['name'] as String,
      body: map['body'] as String,
      dueAt: WallClockDateTime.parseFromStorage(map['due_at'] as String),
      repeatFrequency: _decodeFrequency(map['repeat_frequency'] as String?),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id.isNotEmpty) 'id': id,
      'name': name,
      'body': body,
      'due_at': WallClockDateTime.formatForStorage(dueAt),
      'repeat_frequency': repeatFrequency?.name,
    };
  }

  Reminder toEntity() {
    return Reminder(
      id: id,
      name: name,
      body: body,
      dueAt: dueAt,
      repeatFrequency: repeatFrequency,
    );
  }

  factory ReminderModel.fromEntity(Reminder reminder) {
    return ReminderModel(
      id: reminder.id,
      name: reminder.name,
      body: reminder.body,
      dueAt: reminder.dueAt,
      repeatFrequency: reminder.repeatFrequency,
    );
  }

  static ReminderRepeatFrequency? _decodeFrequency(String? value) {
    if (value == null) return null;
    for (final frequency in ReminderRepeatFrequency.values) {
      if (frequency.name == value) return frequency;
    }
    logger.w(
      'Unknown reminder repeat_frequency "$value"; treating as one-time.',
    );
    return null;
  }
}
