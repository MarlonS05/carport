import 'package:carport/domain/entities/notification_permission_status.dart';
import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/domain/repositories/reminder_repository.dart';
import 'package:carport/domain/services/reminder_notification_scheduler.dart';

/// Simple in-memory [ReminderRepository] for use cases/BLoCs that need real
/// read-back behavior (e.g. create-then-getById) without mock stubbing.
class InMemoryReminderRepository implements ReminderRepository {
  InMemoryReminderRepository([List<Reminder>? initial]) {
    if (initial != null) {
      for (final reminder in initial) {
        _store[reminder.id] = reminder;
      }
    }
  }

  final Map<String, Reminder> _store = {};
  int _autoId = 0;

  @override
  Future<List<Reminder>> listAll() async => _store.values.toList();

  @override
  Future<Reminder?> getById(String id) async => _store[id];

  @override
  Future<String> create(Reminder reminder) async {
    final id = reminder.id.isEmpty ? 'generated-${++_autoId}' : reminder.id;
    _store[id] = Reminder(
      id: id,
      name: reminder.name,
      body: reminder.body,
      dueAt: reminder.dueAt,
      repeatFrequency: reminder.repeatFrequency,
    );
    return id;
  }

  @override
  Future<void> update(Reminder reminder) async {
    _store[reminder.id] = reminder;
  }

  @override
  Future<void> delete(String id) async {
    _store.remove(id);
  }
}

/// Records scheduler interactions so tests can assert without a real plugin.
class RecordingReminderNotificationScheduler
    implements ReminderNotificationScheduler {
  RecordingReminderNotificationScheduler({
    this.scheduleResult = const ReminderScheduleResult(scheduled: true),
    this.permissionStatus = NotificationPermissionStatus.granted,
    this.permissionsGranted = true,
  });

  ReminderScheduleResult scheduleResult;
  NotificationPermissionStatus permissionStatus;
  bool permissionsGranted;

  final List<String> scheduledIds = [];
  final List<String> cancelledIds = [];
  int cancelAllCount = 0;
  int openAppSettingsCount = 0;

  @override
  Future<void> initialize({
    void Function(String reminderId)? onReminderTapped,
  }) async {}

  @override
  Future<bool> requestPermissions() async => permissionsGranted;

  @override
  Future<NotificationPermissionStatus> getPermissionStatus() async =>
      permissionStatus;

  @override
  Future<void> openAppSettings() async => openAppSettingsCount++;

  @override
  Future<ReminderScheduleResult> schedule(Reminder reminder) async {
    scheduledIds.add(reminder.id);
    return scheduleResult;
  }

  @override
  Future<void> cancel(String reminderId) async => cancelledIds.add(reminderId);

  @override
  Future<void> cancelAll() async => cancelAllCount++;
}
