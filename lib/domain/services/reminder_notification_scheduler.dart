import '../entities/notification_permission_status.dart';
import '../entities/reminder.dart';

/// Outcome of attempting to schedule a local notification for a reminder.
class ReminderScheduleResult {
  const ReminderScheduleResult({
    required this.scheduled,
    this.permissionDenied = false,
  });

  final bool scheduled;
  final bool permissionDenied;

  static const skippedPastDue = ReminderScheduleResult(scheduled: false);
}

/// Platform port for scheduling OS local notifications for reminders.
abstract class ReminderNotificationScheduler {
  Future<void> initialize({
    void Function(String reminderId)? onReminderTapped,
  });

  Future<bool> requestPermissions();

  Future<NotificationPermissionStatus> getPermissionStatus();

  Future<void> openAppSettings();

  Future<ReminderScheduleResult> schedule(Reminder reminder);

  Future<void> cancel(String reminderId);

  Future<void> cancelAll();
}
