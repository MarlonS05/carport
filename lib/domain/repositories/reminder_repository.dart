import '../entities/reminder.dart';

abstract class ReminderRepository {
  Future<List<Reminder>> listAll();

  Future<Reminder?> getById(String id);

  Future<String> create(Reminder reminder);

  Future<void> update(Reminder reminder);

  Future<void> delete(String id);
}
