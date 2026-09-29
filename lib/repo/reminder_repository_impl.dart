import 'package:uuid/uuid.dart';

import '../db/database_helper.dart';
import '../domain/entities/reminder.dart';
import '../domain/models/reminder_model.dart';
import '../domain/repositories/reminder_repository.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  ReminderRepositoryImpl(this._dbHelper, [Uuid? uuid])
      : _uuid = uuid ?? const Uuid();

  final DatabaseHelper _dbHelper;
  final Uuid _uuid;

  @override
  Future<List<Reminder>> listAll() async {
    final models = await _dbHelper.getAllReminders();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Reminder?> getById(String id) async {
    final model = await _dbHelper.getReminderById(id);
    return model?.toEntity();
  }

  @override
  Future<String> create(Reminder reminder) async {
    final id = reminder.id.isEmpty ? _uuid.v4() : reminder.id;
    final model = ReminderModel.fromEntity(_copyWithId(reminder, id));
    await _dbHelper.insertReminder(model);
    return id;
  }

  @override
  Future<void> update(Reminder reminder) async {
    await _dbHelper.updateReminder(ReminderModel.fromEntity(reminder));
  }

  @override
  Future<void> delete(String id) async {
    await _dbHelper.deleteReminder(id);
  }

  Reminder _copyWithId(Reminder reminder, String id) {
    return Reminder(
      id: id,
      name: reminder.name,
      body: reminder.body,
      dueAt: reminder.dueAt,
      repeatFrequency: reminder.repeatFrequency,
    );
  }
}
