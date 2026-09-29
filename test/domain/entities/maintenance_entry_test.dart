import 'package:carport/domain/entities/maintenance_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MaintenanceEntry', () {
    test('empty() has blank fields and null image', () {
      final entry = MaintenanceEntry.empty();
      expect(entry.id, '');
      expect(entry.vehicleId, '');
      expect(entry.title, '');
      expect(entry.description, '');
      expect(entry.mileage, '');
      expect(entry.imagePath, isNull);
      expect(entry.date, DateTime.fromMillisecondsSinceEpoch(0));
    });
  });
}
