import '../repositories/reminder_repository.dart';
import '../services/reminder_notification_scheduler.dart';

class DeleteReminderUseCase {
  DeleteReminderUseCase({
    required ReminderRepository reminderRepository,
    required ReminderNotificationScheduler notificationScheduler,
  })  : _reminderRepository = reminderRepository,
        _notificationScheduler = notificationScheduler;

  final ReminderRepository _reminderRepository;
  final ReminderNotificationScheduler _notificationScheduler;

  Future<void> call(String reminderId) async {
    await _notificationScheduler.cancel(reminderId);
    await _reminderRepository.delete(reminderId);
  }
}
