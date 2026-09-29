import 'dart:io';

import 'package:carport/domain/entities/notification_permission_status.dart';
import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/platform/reminder_repeat_frequency_components.dart';
import 'package:carport/platform/wall_clock_notification_time.dart';
import 'package:carport/domain/services/reminder_notification_scheduler.dart';
import 'package:carport/logger/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalReminderNotificationScheduler
    implements ReminderNotificationScheduler {
  LocalReminderNotificationScheduler();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  void Function(String reminderId)? _onReminderTapped;
  bool _initialized = false;
  String? _pendingLaunchReminderId;

  static const _appSettingsChannel =
      MethodChannel('com.carport.carport/app_settings');

  static const _androidChannelId = 'carport_reminders';
  static const _androidChannelName = 'Reminders';
  static const _androidChannelDescription = 'Maintenance reminder alerts';

  static const _notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      _androidChannelId,
      _androidChannelName,
      channelDescription: _androidChannelDescription,
      importance: Importance.max,
      priority: Priority.high,
    ),
    iOS: DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    ),
  );

  @override
  Future<void> initialize({
    void Function(String reminderId)? onReminderTapped,
  }) async {
    if (kIsWeb || (!_isMobile)) {
      return;
    }

    _onReminderTapped = onReminderTapped;

    WallClockNotificationTime.ensureTimeZonesInitialized();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      defaultPresentAlert: true,
      defaultPresentSound: true,
      defaultPresentBadge: true,
    );

    await _plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
      onDidReceiveNotificationResponse: _handleNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    final androidPlugin = _androidImplementation;
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        _androidChannelId,
        _androidChannelName,
        description: _androidChannelDescription,
        importance: Importance.max,
      ),
    );

    final launchDetails = await _plugin.getNotificationAppLaunchDetails();
    if (launchDetails?.didNotificationLaunchApp ?? false) {
      final payload = launchDetails?.notificationResponse?.payload;
      if (payload != null && payload.isNotEmpty) {
        _pendingLaunchReminderId = payload;
      }
    }

    _initialized = true;
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(NotificationResponse response) {
    // Background isolate entry point required by the plugin; navigation is
    // handled via [getNotificationAppLaunchDetails] or the foreground callback.
  }

  void _handleNotificationResponse(NotificationResponse response) {
    final payload = response.payload;
    if (payload == null || payload.isEmpty) return;
    _onReminderTapped?.call(payload);
  }

  String? takeLaunchReminderId() {
    final id = _pendingLaunchReminderId;
    _pendingLaunchReminderId = null;
    return id;
  }

  bool get _isMobile => Platform.isIOS || Platform.isAndroid;

  AndroidFlutterLocalNotificationsPlugin? get _androidImplementation =>
      _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  IOSFlutterLocalNotificationsPlugin? get _iosImplementation =>
      _plugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();

  @override
  Future<NotificationPermissionStatus> getPermissionStatus() async {
    if (kIsWeb || !_isMobile) {
      return NotificationPermissionStatus.unsupported;
    }

    if (!_initialized) {
      await initialize();
    }

    if (Platform.isAndroid) {
      final enabled =
          await _androidImplementation?.areNotificationsEnabled() ?? false;
      return enabled
          ? NotificationPermissionStatus.granted
          : NotificationPermissionStatus.denied;
    }

    if (Platform.isIOS) {
      final settings = await _iosImplementation?.checkPermissions();
      if (settings == null) {
        return NotificationPermissionStatus.unsupported;
      }
      if (settings.isEnabled) {
        return NotificationPermissionStatus.granted;
      }
      return NotificationPermissionStatus.notDetermined;
    }

    return NotificationPermissionStatus.unsupported;
  }

  @override
  Future<void> openAppSettings() async {
    if (kIsWeb || !_isMobile) return;
    try {
      await _appSettingsChannel.invokeMethod<void>('openNotificationSettings');
    } on PlatformException catch (e, st) {
      logger.e(
        'Failed to open notification settings',
        error: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<bool> requestPermissions() async {
    if (kIsWeb || !_isMobile) return false;

    if (!_initialized) {
      await initialize();
    }

    if (Platform.isAndroid) {
      final notificationsGranted =
          await _androidImplementation?.requestNotificationsPermission() ??
              false;
      final exactAlarmsGranted =
          await _androidImplementation?.requestExactAlarmsPermission() ?? true;
      return notificationsGranted && exactAlarmsGranted;
    }

    if (Platform.isIOS) {
      final granted = await _iosImplementation?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          ) ??
          false;
      return granted;
    }

    return false;
  }

  @override
  Future<ReminderScheduleResult> schedule(Reminder reminder) async {
    if (kIsWeb || !_isMobile) {
      return ReminderScheduleResult.skippedPastDue;
    }

    if (!_initialized) {
      await initialize();
    }

    // Repeating reminders anchor on [dueAt] but the plugin rolls forward to the
    // next matching occurrence via [matchDateTimeComponents], so a past anchor
    // is fine. One-time reminders must be in the future.
    final matchComponents = toDateTimeComponents(reminder.repeatFrequency);
    if (matchComponents == null &&
        !WallClockNotificationTime.isFutureWallClock(reminder.dueAt)) {
      return ReminderScheduleResult.skippedPastDue;
    }

    final permissionGranted = await requestPermissions();
    if (!permissionGranted) {
      return const ReminderScheduleResult(
        scheduled: false,
        permissionDenied: true,
      );
    }

    final notificationId = _notificationId(reminder.id);
    await cancel(reminder.id);

    final repeatFrequency = reminder.repeatFrequency;
    final scheduledTime = repeatFrequency == null
        ? WallClockNotificationTime.toScheduledTime(reminder.dueAt)
        : WallClockNotificationTime.nextOccurrence(
            reminder.dueAt,
            repeatFrequency,
          );
    final body = reminder.body.trim().isEmpty
        ? 'Maintenance reminder'
        : reminder.body.trim();

    try {
      await _plugin.zonedSchedule(
        notificationId,
        reminder.name,
        body,
        scheduledTime,
        _notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: matchComponents,
        payload: reminder.id,
      );
      return const ReminderScheduleResult(scheduled: true);
    } catch (e, st) {
      logger.e(
        'Failed to schedule reminder notification ${reminder.id}',
        error: e,
        stackTrace: st,
      );
      return ReminderScheduleResult.skippedPastDue;
    }
  }

  @override
  Future<void> cancel(String reminderId) async {
    if (kIsWeb || !_isMobile || !_initialized) return;
    await _plugin.cancel(_notificationId(reminderId));
  }

  @override
  Future<void> cancelAll() async {
    if (kIsWeb || !_isMobile || !_initialized) return;
    await _plugin.cancelAll();
  }

  int _notificationId(String reminderId) => reminderId.hashCode & 0x7FFFFFFF;
}
