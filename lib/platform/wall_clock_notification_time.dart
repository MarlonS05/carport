import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Schedules notifications from wall-clock date/time values, using the device's
/// current UTC offset (not a named IANA timezone).
abstract final class WallClockNotificationTime {
  WallClockNotificationTime._();

  static bool _timeZonesInitialized = false;

  static void ensureTimeZonesInitialized() {
    if (_timeZonesInitialized) {
      return;
    }
    tz_data.initializeTimeZones();
    _timeZonesInitialized = true;
  }

  /// Refreshes [tz.local] from the device's current offset before scheduling.
  static void refreshDeviceOffsetLocation() {
    ensureTimeZonesInitialized();
    tz.setLocalLocation(_locationForOffset(DateTime.now().timeZoneOffset));
  }

  /// Builds a [tz.TZDateTime] from calendar fields only (hour/minute preserved).
  static tz.TZDateTime toScheduledTime(DateTime dueAt) {
    refreshDeviceOffsetLocation();
    final wallClock = toWallClockDateTime(dueAt);
    return tz.TZDateTime(
      tz.local,
      wallClock.year,
      wallClock.month,
      wallClock.day,
      wallClock.hour,
      wallClock.minute,
      wallClock.second,
    );
  }

  /// Builds the next future [tz.TZDateTime] occurrence for a repeating reminder.
  ///
  /// The plugin's `matchDateTimeComponents` only rolls forward *after* the first
  /// fire, and on Android a past `scheduledDate` fires immediately. So we anchor
  /// the first notification on the next occurrence strictly after "now" while
  /// preserving the due time-of-day (and weekday / day-of-month / month+day).
  /// Invalid calendar dates (e.g. the 31st in short months, Feb 29 in common
  /// years) are skipped, matching the OS recurrence behavior.
  static tz.TZDateTime nextOccurrence(
    DateTime dueAt,
    ReminderRepeatFrequency frequency,
  ) {
    refreshDeviceOffsetLocation();
    final wall = toWallClockDateTime(dueAt);
    final now = tz.TZDateTime.now(tz.local);

    return switch (frequency) {
      ReminderRepeatFrequency.daily => _nextDaily(wall, now),
      ReminderRepeatFrequency.weekly => _nextWeekly(wall, now),
      ReminderRepeatFrequency.monthly => _nextMonthly(wall, now),
      ReminderRepeatFrequency.yearly => _nextYearly(wall, now),
    };
  }

  static tz.TZDateTime _at(DateTime wall, int year, int month, int day) {
    return tz.TZDateTime(
      tz.local,
      year,
      month,
      day,
      wall.hour,
      wall.minute,
      wall.second,
    );
  }

  static tz.TZDateTime _nextDaily(DateTime wall, tz.TZDateTime now) {
    final today = _at(wall, now.year, now.month, now.day);
    if (today.isAfter(now)) return today;
    final tomorrow = DateTime(now.year, now.month, now.day)
        .add(const Duration(days: 1));
    return _at(wall, tomorrow.year, tomorrow.month, tomorrow.day);
  }

  static tz.TZDateTime _nextWeekly(DateTime wall, tz.TZDateTime now) {
    // Scan up to 8 days so the same weekday next week is reachable when today's
    // occurrence has already passed.
    for (var offset = 0; offset <= 7; offset++) {
      final date =
          DateTime(now.year, now.month, now.day).add(Duration(days: offset));
      if (date.weekday != wall.weekday) continue;
      final candidate = _at(wall, date.year, date.month, date.day);
      if (candidate.isAfter(now)) return candidate;
    }
    // Unreachable, but keeps the return type non-null.
    return _at(wall, now.year, now.month, now.day).add(const Duration(days: 7));
  }

  static tz.TZDateTime _nextMonthly(DateTime wall, tz.TZDateTime now) {
    var year = now.year;
    var month = now.month;
    for (var i = 0; i < 120; i++) {
      if (wall.day <= _daysInMonth(year, month)) {
        final candidate = _at(wall, year, month, wall.day);
        if (candidate.isAfter(now)) return candidate;
      }
      month++;
      if (month > 12) {
        month = 1;
        year++;
      }
    }
    return _at(wall, year, month, 1);
  }

  static tz.TZDateTime _nextYearly(DateTime wall, tz.TZDateTime now) {
    for (var year = now.year; year < now.year + 12; year++) {
      if (wall.day <= _daysInMonth(year, wall.month)) {
        final candidate = _at(wall, year, wall.month, wall.day);
        if (candidate.isAfter(now)) return candidate;
      }
    }
    return _at(wall, now.year + 1, wall.month, 1);
  }

  static int _daysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  /// Normalizes a [DateTime] to local wall-clock fields (no timezone conversion).
  static DateTime toWallClockDateTime(DateTime dueAt) {
    final local = dueAt.isUtc ? dueAt.toLocal() : dueAt;
    return DateTime(
      local.year,
      local.month,
      local.day,
      local.hour,
      local.minute,
      local.second,
      local.millisecond,
      local.microsecond,
    );
  }

  static bool isFutureWallClock(DateTime dueAt) {
    return toWallClockDateTime(dueAt).isAfter(DateTime.now());
  }

  static tz.Location _locationForOffset(Duration offset) {
    final hours = offset.inHours;
    if (hours == 0) {
      return tz.UTC;
    }

    // Etc/GMT signs are inverted: Etc/GMT-5 is UTC+5.
    final name = hours > 0 ? 'Etc/GMT-${hours}' : 'Etc/GMT+${hours.abs()}';
    try {
      return tz.getLocation(name);
    } catch (_) {
      return tz.UTC;
    }
  }
}
