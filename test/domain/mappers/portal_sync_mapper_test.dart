import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/mappers/portal_sync_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/builders.dart';

void main() {
  final updatedAt = DateTime.utc(2026, 7, 8, 10, 15, 30, 500);

  test('maps vehicle fields to API payload', () {
    final vehicle = buildVehicle(
      id: 'v1',
      name: '2019 Mazda CX-5',
      description: 'Soul Red',
      mileage: 42350.7,
      userManualLink: 'https://example.com/manual',
      maintenanceManualLink: 'https://example.com/service',
      maintenancePlanImage: 'aGVsbG8=',
      documentsImage: 'ZG9jcw==',
    );

    final json = PortalSyncMapper.vehicleToJson(
      vehicle,
      DistanceUnit.kilometres,
      updatedAt,
    );

    expect(json, {
      'id': 'v1',
      'name': '2019 Mazda CX-5',
      'description': 'Soul Red',
      'mileage': 42351,
      'mileage_unit': 'km',
      'updated_at': '2026-07-08T10:15:30Z',
      'user_manual_url': 'https://example.com/manual',
      'service_manual_url': 'https://example.com/service',
      'maintenance_schedule_image': 'aGVsbG8=',
    });
    expect(json.containsKey('documents_image'), isFalse);
  });

  test('omits empty optional vehicle fields and clears missing image', () {
    final vehicle = buildVehicle(id: 'v1', description: '');

    final json = PortalSyncMapper.vehicleToJson(
      vehicle,
      DistanceUnit.miles,
      updatedAt,
    );

    expect(json, {
      'id': 'v1',
      'name': vehicle.name,
      'mileage': vehicle.mileage.round(),
      'mileage_unit': 'mi',
      'updated_at': '2026-07-08T10:15:30Z',
      'maintenance_schedule_image': null,
    });
    expect(json.containsKey('description'), isFalse);
    expect(json.containsKey('user_manual_url'), isFalse);
    expect(json.containsKey('service_manual_url'), isFalse);
    expect(json.containsKey('documents_image'), isFalse);
  });

  test('maps service item fields to API payload', () {
    final item = buildServiceItem(
      id: 's1',
      vehicleId: 'v1',
      title: 'OIL CHANGE',
      description: 'Synthetic 0W-20',
      mileage: 42350.2,
      date: DateTime(2026, 3, 4),
    );

    final json = PortalSyncMapper.serviceItemToJson(
      item,
      DistanceUnit.kilometres,
      updatedAt,
    );

    expect(json, {
      'id': 's1',
      'vehicle_id': 'v1',
      'title': 'OIL CHANGE',
      'description': 'Synthetic 0W-20',
      'mileage': 42350,
      'mileage_unit': 'km',
      'occurred_at': '2026-03-04',
      'updated_at': '2026-07-08T10:15:30Z',
    });
  });

  test('omits empty service item description', () {
    final item = buildServiceItem(
      id: 's1',
      vehicleId: 'v1',
      description: '',
      date: DateTime(2026, 1, 15),
    );

    final json = PortalSyncMapper.serviceItemToJson(
      item,
      DistanceUnit.miles,
      updatedAt,
    );

    expect(json['occurred_at'], '2026-01-15');
    expect(json['mileage_unit'], 'mi');
    expect(json['updated_at'], '2026-07-08T10:15:30Z');
    expect(json.containsKey('description'), isFalse);
  });
}
