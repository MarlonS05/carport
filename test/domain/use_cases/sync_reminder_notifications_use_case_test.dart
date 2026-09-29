import 'package:carport/domain/entities/notification_permission_status.dart';
import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:carport/domain/repositories/reminder_repository.dart';
import 'package:carport/domain/services/reminder_notification_scheduler.dart';
import 'package:carport/domain/use_cases/sync_reminder_notifications_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SyncReminderNotificationsUseCase', () {
    late _FakeReminderRepository repository;
    late _RecordingScheduler scheduler;
    late SyncReminderNotificationsUseCase useCase;

    setUp(() {
      repository = _FakeReminderRepository();
      scheduler = _RecordingScheduler();
      useCase = SyncReminderNotificationsUseCase(
        reminderRepository: repository,
        notificationScheduler: scheduler,
      );
    });

    test('clears existing notifications before rescheduling', () async {
      await useCase();
      expect(scheduler.cancelAllCount, 1);
    });

    test('reschedules future one-time and all repeating, skips past one-time',
        () async {
      final now = DateTime.now();
      repository.reminders = [
        _reminder('future-one-time', now.add(const Duration(days: 1)), null),
        _reminder('past-one-time', now.subtract(const Duration(days: 1)), null),
        _reminder(
          'past-repeating',
          now.subtract(const Duration(days: 400)),
          ReminderRepeatFrequency.yearly,
        ),
        _reminder(
          'future-repeating',
          now.add(const Duration(days: 2)),
          ReminderRepeatFrequency.daily,
        ),
      ];

      await useCase();

      expect(
        scheduler.scheduledIds,
        containsAll(<String>[
          'future-one-time',
          'past-repeating',
          'future-repeating',
        ]),
      );
      expect(scheduler.scheduledIds, isNot(contains('past-one-time')));
    });
  });
}

Reminder _reminder(String id, DateTime dueAt, ReminderRepeatFrequency? freq) {
  return Reminder(
    id: id,
    name: id,
    body: '',
    dueAt: dueAt,
    repeatFrequency: freq,
  );
}

class _FakeReminderRepository implements ReminderRepository {
  List<Reminder> reminders = [];

  @override
  Future<List<Reminder>> listAll() async => reminders;

  @override
  Future<Reminder?> getById(String id) async {
    for (final reminder in reminders) {
      if (reminder.id == id) return reminder;
    }
    return null;
  }

  @override
  Future<String> create(Reminder reminder) async => reminder.id;

  @override
  Future<void> update(Reminder reminder) async {}

  @override
  Future<void> delete(String id) async {}
}

class _RecordingScheduler implements ReminderNotificationScheduler {
  final List<String> scheduledIds = [];
  int cancelAllCount = 0;

  @override
  Future<ReminderScheduleResult> schedule(Reminder reminder) async {
    scheduledIds.add(reminder.id);
    return const ReminderScheduleResult(scheduled: true);
  }

  @override
  Future<void> cancelAll() async => cancelAllCount++;

  @override
  Future<void> cancel(String reminderId) async {}

  @override
  Future<void> initialize({
    void Function(String reminderId)? onReminderTapped,
  }) async {}

  @override
  Future<NotificationPermissionStatus> getPermissionStatus() async =>
      NotificationPermissionStatus.granted;

  @override
  Future<void> openAppSettings() async {}

  @override
  Future<bool> requestPermissions() async => true;
}
