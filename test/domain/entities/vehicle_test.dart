import 'package:carport/domain/entities/vehicle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Vehicle', () {
    test('empty() has blank fields and zero mileage', () {
      final vehicle = Vehicle.empty();
      expect(vehicle.id, '');
      expect(vehicle.name, '');
      expect(vehicle.description, '');
      expect(vehicle.maintenancePlanImage, isNull);
      expect(vehicle.documentsImage, isNull);
      expect(vehicle.userManualLink, isNull);
      expect(vehicle.maintenanceManualLink, isNull);
      expect(vehicle.mileage, 0);
    });
  });
}
