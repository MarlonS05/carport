import 'package:carport/domain/formatters/wall_clock_datetime.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WallClockDateTime', () {
    test('formatForStorage emits naive seconds-precision string', () {
      expect(
        WallClockDateTime.formatForStorage(DateTime(2026, 3, 14, 9, 30, 15)),
        '2026-03-14T09:30:15',
      );
    });

    test('formatForStorage zero-pads single-digit fields', () {
      expect(
        WallClockDateTime.formatForStorage(DateTime(2026, 1, 2, 3, 4, 5)),
        '2026-01-02T03:04:05',
      );
    });

    test('parseFromStorage preserves naive wall-clock fields', () {
      final parsed = WallClockDateTime.parseFromStorage('2026-03-14T09:30:15');
      expect(parsed.year, 2026);
      expect(parsed.month, 3);
      expect(parsed.day, 14);
      expect(parsed.hour, 9);
      expect(parsed.minute, 30);
      expect(parsed.second, 15);
      expect(parsed.isUtc, isFalse);
    });

    test('naive format/parse is a lossless round-trip', () {
      final original = DateTime(2026, 7, 1, 18, 45, 30);
      final roundTripped = WallClockDateTime.parseFromStorage(
        WallClockDateTime.formatForStorage(original),
      );
      expect(roundTripped, original);
    });

    test('toLocalFields returns a non-UTC datetime', () {
      final result = WallClockDateTime.toLocalFields(
        DateTime.utc(2026, 3, 14, 9, 30),
      );
      expect(result.isUtc, isFalse);
    });

    test('isFuture reflects comparison to now', () {
      expect(
        WallClockDateTime.isFuture(
          DateTime.now().add(const Duration(days: 5)),
        ),
        isTrue,
      );
      expect(
        WallClockDateTime.isFuture(
          DateTime.now().subtract(const Duration(days: 5)),
        ),
        isFalse,
      );
    });
  });
}
