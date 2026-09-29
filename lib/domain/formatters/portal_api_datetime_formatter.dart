/// Formats datetimes for the Carport monitor mobile API.
abstract final class PortalApiDateTimeFormatter {
  PortalApiDateTimeFormatter._();

  /// UTC ISO 8601 with second precision, e.g. `2026-07-08T10:15:30Z`.
  static String formatUpdatedAt(DateTime dateTime) {
    final utc = dateTime.toUtc();
    final year = utc.year.toString().padLeft(4, '0');
    final month = utc.month.toString().padLeft(2, '0');
    final day = utc.day.toString().padLeft(2, '0');
    final hour = utc.hour.toString().padLeft(2, '0');
    final minute = utc.minute.toString().padLeft(2, '0');
    final second = utc.second.toString().padLeft(2, '0');
    return '$year-$month-${day}T$hour:$minute:${second}Z';
  }

  /// Sentinel used when the garage has no records.
  static DateTime get epochUtc => DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
}
