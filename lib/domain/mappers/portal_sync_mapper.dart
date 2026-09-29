import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/formatters/portal_api_datetime_formatter.dart';

/// Maps local garage entities to monitor API sync payloads.
abstract final class PortalSyncMapper {
  PortalSyncMapper._();

  static Map<String, dynamic> vehicleToJson(
    Vehicle vehicle,
    DistanceUnit distanceUnit,
    DateTime updatedAt,
  ) {
    final json = <String, dynamic>{
      'id': vehicle.id,
      'name': vehicle.name,
      'mileage': vehicle.mileage.round(),
      'mileage_unit': _mileageUnit(distanceUnit),
      'updated_at': PortalApiDateTimeFormatter.formatUpdatedAt(updatedAt),
    };

    if (vehicle.description.isNotEmpty) {
      json['description'] = vehicle.description;
    }
    if (vehicle.userManualLink != null) {
      json['user_manual_url'] = vehicle.userManualLink;
    }
    if (vehicle.maintenanceManualLink != null) {
      json['service_manual_url'] = vehicle.maintenanceManualLink;
    }
    json['maintenance_schedule_image'] = vehicle.maintenancePlanImage;

    return json;
  }

  static Map<String, dynamic> serviceItemToJson(
    ServiceItem item,
    DistanceUnit distanceUnit,
    DateTime updatedAt,
  ) {
    final json = <String, dynamic>{
      'id': item.id,
      'vehicle_id': item.vehicleId,
      'title': item.title,
      'mileage': item.mileage.round(),
      'mileage_unit': _mileageUnit(distanceUnit),
      'occurred_at': _apiDate(item.date),
      'updated_at': PortalApiDateTimeFormatter.formatUpdatedAt(updatedAt),
    };

    if (item.description.isNotEmpty) {
      json['description'] = item.description;
    }

    return json;
  }

  static String _mileageUnit(DistanceUnit unit) => switch (unit) {
        DistanceUnit.miles => 'mi',
        DistanceUnit.kilometres => 'km',
      };

  static String _apiDate(DateTime date) {
    final local = DateTime(date.year, date.month, date.day);
    final year = local.year.toString().padLeft(4, '0');
    final month = local.month.toString().padLeft(2, '0');
    final day = local.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}
