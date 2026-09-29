import 'package:carport/domain/formatters/garage_date_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GarageDateFormatter', () {
    test('format renders month, day, year', () {
      expect(GarageDateFormatter.format(DateTime(2026, 3, 14)), 'Mar 14, 2026');
    });

    test('formatNullable renders em dash for null', () {
      expect(GarageDateFormatter.formatNullable(null), '—');
      expect(
        GarageDateFormatter.formatNullable(DateTime(2026, 3, 14)),
        'Mar 14, 2026',
      );
    });
  });
}
