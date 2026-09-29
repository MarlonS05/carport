import '../repositories/reminder_repository.dart';
import '../services/reminder_notification_scheduler.dart';

class SyncReminderNotificationsUseCase {
  SyncReminderNotificationsUseCase({
    required ReminderRepository reminderRepository,
    required ReminderNotificationScheduler notificationScheduler,
  })  : _reminderRepository = reminderRepository,
        _notificationScheduler = notificationScheduler;

  final ReminderRepository _reminderRepository;
  final ReminderNotificationScheduler _notificationScheduler;

  Future<void> call() async {
    await _notificationScheduler.cancelAll();
    final reminders = await _reminderRepository.listAll();
    final now = DateTime.now();
    for (final reminder in reminders) {
      // Repeating reminders always reschedule (the scheduler rolls forward to
      // the next matching occurrence). One-time reminders only if still future.
      if (reminder.isRepeating || reminder.dueAt.isAfter(now)) {
        await _notificationScheduler.schedule(reminder);
      }
    }
  }
}
