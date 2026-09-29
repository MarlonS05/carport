import 'package:intl/intl.dart';

/// Display formatting for dates shown in Garage views.
abstract final class GarageDateFormatter {
  GarageDateFormatter._();

  static final DateFormat _format = DateFormat('MMM d, y');

  static String format(DateTime date) => _format.format(date);

  static String formatNullable(DateTime? date) =>
      date == null ? '—' : format(date);
}
