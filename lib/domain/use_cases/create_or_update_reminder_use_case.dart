import '../entities/reminder.dart';
import '../repositories/reminder_repository.dart';
import '../services/reminder_notification_scheduler.dart';
import 'use_case_validation_exception.dart';

class ReminderSaveOutcome {
  const ReminderSaveOutcome({
    required this.id,
    this.notificationPermissionDenied = false,
  });

  final String id;
  final bool notificationPermissionDenied;
}

class CreateOrUpdateReminderUseCase {
  CreateOrUpdateReminderUseCase({
    required ReminderRepository reminderRepository,
    required ReminderNotificationScheduler notificationScheduler,
  })  : _reminderRepository = reminderRepository,
        _notificationScheduler = notificationScheduler;

  final ReminderRepository _reminderRepository;
  final ReminderNotificationScheduler _notificationScheduler;

  Future<ReminderSaveOutcome> call(Reminder reminder) async {
    if (reminder.name.trim().isEmpty) {
      throw const UseCaseValidationException({'name': 'Name is required'});
    }

    final saved = _normalize(reminder);
    final String id;
    if (saved.id.isEmpty) {
      id = await _reminderRepository.create(saved);
    } else {
      await _notificationScheduler.cancel(saved.id);
      await _reminderRepository.update(saved);
      id = saved.id;
    }

    final persisted = await _reminderRepository.getById(id);
    if (persisted == null) {
      throw StateError('Reminder $id not found after save');
    }

    final scheduleResult = await _notificationScheduler.schedule(persisted);
    return ReminderSaveOutcome(
      id: id,
      notificationPermissionDenied: scheduleResult.permissionDenied,
    );
  }

  Reminder _normalize(Reminder reminder) {
    return Reminder(
      id: reminder.id,
      name: reminder.name.trim(),
      body: reminder.body.trim(),
      dueAt: reminder.dueAt,
      repeatFrequency: reminder.repeatFrequency,
    );
  }
}
