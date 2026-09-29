import 'package:intl/intl.dart';

/// Display formatting for reminder due datetimes in Garage views.
abstract final class GarageDateTimeFormatter {
  GarageDateTimeFormatter._();

  static final DateFormat _format = DateFormat('MMM d, y · h:mm a');

  static String format(DateTime dateTime) => _format.format(dateTime);

  static String formatNullable(DateTime? dateTime) =>
      dateTime == null ? '—' : format(dateTime);
}
