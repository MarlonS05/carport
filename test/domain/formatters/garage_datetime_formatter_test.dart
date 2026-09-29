import 'package:carport/domain/formatters/garage_datetime_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GarageDateTimeFormatter', () {
    test('format renders date and time', () {
      expect(
        GarageDateTimeFormatter.format(DateTime(2026, 3, 14, 9, 30)),
        'Mar 14, 2026 · 9:30 AM',
      );
    });

    test('formatNullable renders em dash for null', () {
      expect(GarageDateTimeFormatter.formatNullable(null), '—');
      expect(
        GarageDateTimeFormatter.formatNullable(DateTime(2026, 3, 14, 13, 5)),
        'Mar 14, 2026 · 1:05 PM',
      );
    });
  });
}
