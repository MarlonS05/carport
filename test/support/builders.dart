import 'package:carport/domain/entities/maintenance_entry.dart';
import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:carport/domain/entities/service_item.dart';
import 'package:carport/domain/entities/vehicle.dart';

/// Test data builders. Each returns a fully-populated entity with sensible
/// defaults so tests only override the fields they care about.

Vehicle buildVehicle({
  String id = 'vehicle-1',
  String name = 'Test Car',
  String description = 'desc',
  String? maintenancePlanImage,
  String? documentsImage,
  String? userManualLink,
  String? maintenanceManualLink,
  double mileage = 1000,
}) {
  return Vehicle(
    id: id,
    name: name,
    description: description,
    maintenancePlanImage: maintenancePlanImage,
    documentsImage: documentsImage,
    userManualLink: userManualLink,
    maintenanceManualLink: maintenanceManualLink,
    mileage: mileage,
  );
}

ServiceItem buildServiceItem({
  String id = 'service-1',
  String vehicleId = 'vehicle-1',
  String title = 'Oil change',
  String description = 'notes',
  DateTime? date,
  double mileage = 1200,
}) {
  return ServiceItem(
    id: id,
    vehicleId: vehicleId,
    title: title,
    description: description,
    date: date ?? DateTime(2026, 1, 1),
    mileage: mileage,
  );
}

MaintenanceEntry buildMaintenanceEntry({
  String id = 'entry-1',
  String vehicleId = 'vehicle-1',
  String title = 'Inspection',
  String description = 'notes',
  DateTime? date,
  String mileage = '1200',
  String? imagePath,
}) {
  return MaintenanceEntry(
    id: id,
    vehicleId: vehicleId,
    title: title,
    description: description,
    date: date ?? DateTime(2026, 1, 1),
    mileage: mileage,
    imagePath: imagePath,
  );
}

Reminder buildReminder({
  String id = 'reminder-1',
  String name = 'Registration',
  String body = 'renew',
  DateTime? dueAt,
  ReminderRepeatFrequency? repeatFrequency,
}) {
  return Reminder(
    id: id,
    name: name,
    body: body,
    dueAt: dueAt ?? DateTime(2026, 6, 1, 9, 30),
    repeatFrequency: repeatFrequency,
  );
}
