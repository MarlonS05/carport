import 'package:carport/domain/models/maintenance_entry_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/builders.dart';

void main() {
  group('MaintenanceEntryModel', () {
    test('round-trips date-only through toMap/fromMap', () {
      final model = MaintenanceEntryModel(
        id: 'e1',
        vehicleId: 'v1',
        title: 'Inspection',
        description: 'notes',
        date: DateTime(2026, 3, 14),
        mileage: '1200',
        imagePath: 'img.png',
      );

      final map = model.toMap();
      expect(map['date'], '2026-03-14');

      final decoded = MaintenanceEntryModel.fromMap(map);
      expect(decoded.id, 'e1');
      expect(decoded.vehicleId, 'v1');
      expect(decoded.title, 'Inspection');
      expect(decoded.description, 'notes');
      expect(decoded.date, DateTime(2026, 3, 14));
      expect(decoded.mileage, '1200');
      expect(decoded.imagePath, 'img.png');
    });

    test('toMap always includes id (even when empty)', () {
      final model = MaintenanceEntryModel.fromEntity(
        buildMaintenanceEntry(id: ''),
      );
      expect(model.toMap().containsKey('id'), isTrue);
      expect(model.toMap()['id'], '');
    });

    test('fromMap tolerates missing description and mileage', () {
      final decoded = MaintenanceEntryModel.fromMap({
        'id': 'e1',
        'vehicle_id': 'v1',
        'title': 't',
        'date': '2026-01-01',
      });
      expect(decoded.description, '');
      expect(decoded.mileage, '');
      expect(decoded.imagePath, isNull);
    });

    test('fromEntity/toEntity preserve fields', () {
      final entry = buildMaintenanceEntry(id: 'e1', imagePath: 'p.png');
      final roundTripped = MaintenanceEntryModel.fromEntity(entry).toEntity();
      expect(roundTripped.id, 'e1');
      expect(roundTripped.imagePath, 'p.png');
      expect(roundTripped.mileage, entry.mileage);
    });
  });
}
