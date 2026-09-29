import 'package:carport/domain/formatters/portal_api_datetime_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('formats UTC datetime with second precision', () {
    final formatted = PortalApiDateTimeFormatter.formatUpdatedAt(
      DateTime.utc(2026, 7, 8, 10, 15, 30, 500),
    );

    expect(formatted, '2026-07-08T10:15:30Z');
  });

  test('converts local datetime to UTC before formatting', () {
    final formatted = PortalApiDateTimeFormatter.formatUpdatedAt(
      DateTime(2026, 7, 8, 12, 15, 30),
    );

    expect(formatted, endsWith('Z'));
    expect(formatted.contains('.'), isFalse);
  });

  test('epochUtc is UTC zero', () {
    expect(
      PortalApiDateTimeFormatter.epochUtc,
      DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
    );
  });
}
