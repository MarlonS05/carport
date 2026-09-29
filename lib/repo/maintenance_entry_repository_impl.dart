import '../db/database_helper.dart';
import '../domain/entities/maintenance_entry.dart';
import '../domain/models/maintenance_entry_model.dart';
import '../domain/repositories/maintenance_entry_repository.dart';

class MaintenanceEntryRepositoryImpl implements MaintenanceEntryRepository {
  final DatabaseHelper _dbHelper;

  MaintenanceEntryRepositoryImpl(this._dbHelper);

  @override
  Future<List<MaintenanceEntry>> getEntriesForVehicle(String vehicleId) async {
    final models = await _dbHelper.getEntriesForVehicle(vehicleId);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<MaintenanceEntry?> getEntry(String id) async {
    final model = await _dbHelper.getMaintenanceEntryById(id);
    return model?.toEntity();
  }

  @override
  Future<void> createEntry(MaintenanceEntry entry) async {
    await _dbHelper.insertMaintenanceEntry(
      MaintenanceEntryModel.fromEntity(entry),
    );
  }

  @override
  Future<void> updateEntry(MaintenanceEntry entry) async {
    await _dbHelper.updateMaintenanceEntry(
      MaintenanceEntryModel.fromEntity(entry),
    );
  }

  @override
  Future<void> deleteEntry(String id) async {
    await _dbHelper.deleteMaintenanceEntry(id);
  }
}
