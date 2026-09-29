import '../entities/maintenance_entry.dart';

abstract interface class MaintenanceEntryRepository {
  Future<List<MaintenanceEntry>> getEntriesForVehicle(String vehicleId);
  Future<MaintenanceEntry?> getEntry(String id);
  Future<void> createEntry(MaintenanceEntry entry);
  Future<void> updateEntry(MaintenanceEntry entry);
  Future<void> deleteEntry(String id);
}
