/// Wall-clock datetime helpers (calendar fields only, no named timezone).
abstract final class WallClockDateTime {
  WallClockDateTime._();

  /// Normalizes a [DateTime] to local wall-clock fields.
  static DateTime toLocalFields(DateTime value) {
    final local = value.isUtc ? value.toLocal() : value;
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

  /// Persists wall-clock fields only (no timezone suffix).
  static String formatForStorage(DateTime value) {
    final wallClock = toLocalFields(value);
    final y = wallClock.year.toString().padLeft(4, '0');
    final m = wallClock.month.toString().padLeft(2, '0');
    final d = wallClock.day.toString().padLeft(2, '0');
    final h = wallClock.hour.toString().padLeft(2, '0');
    final min = wallClock.minute.toString().padLeft(2, '0');
    final s = wallClock.second.toString().padLeft(2, '0');
    return '$y-$m-${d}T$h:$min:$s';
  }

  /// Parses stored wall-clock datetime as local device time.
  static DateTime parseFromStorage(String value) {
    final parsed = DateTime.parse(value);
    if (value.endsWith('Z') || value.contains(RegExp(r'[+-]\d{2}:\d{2}$'))) {
      return toLocalFields(parsed);
    }
    return DateTime(
      parsed.year,
      parsed.month,
      parsed.day,
      parsed.hour,
      parsed.minute,
      parsed.second,
      parsed.millisecond,
      parsed.microsecond,
    );
  }

  static bool isFuture(DateTime value) {
    return toLocalFields(value).isAfter(DateTime.now());
  }
}
