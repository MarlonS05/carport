import 'package:uuid/uuid.dart';

import '../db/database_helper.dart';
import '../domain/entities/vehicle.dart';
import '../domain/models/vehicle_model.dart';
import '../domain/repositories/vehicle_repository.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final DatabaseHelper _dbHelper;
  final Uuid _uuid;

  VehicleRepositoryImpl(this._dbHelper, [Uuid? uuid]) : _uuid = uuid ?? const Uuid();

  @override
  Future<int> countAll() async {
    return _dbHelper.countAllVehicles();
  }

  @override
  Future<List<Vehicle>> getAll() async {
    final models = await _dbHelper.getAllVehicles();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<Vehicle?> getById(String id) async {
    final model = await _dbHelper.getVehicleById(id);
    return model?.toEntity();
  }

  @override
  Future<String> create(Vehicle vehicle) async {
    final id = vehicle.id.isEmpty ? _uuid.v4() : vehicle.id;
    final model = VehicleModel.fromEntity(_withId(vehicle, id));
    await _dbHelper.insertVehicle(model);
    return id;
  }

  @override
  Future<void> update(Vehicle vehicle) async {
    await _dbHelper.updateVehicle(VehicleModel.fromEntity(vehicle));
  }

  @override
  Future<void> delete(String id) async {
    await _dbHelper.deleteVehicle(id);
  }

  @override
  Future<({String id, DateTime updatedAt})?> getMostRecentlyUpdated() {
    return _dbHelper.getMostRecentlyUpdatedVehicle();
  }

  @override
  Future<DateTime?> getUpdatedAt(String id) {
    return _dbHelper.getVehicleUpdatedAt(id);
  }

  Vehicle _withId(Vehicle vehicle, String id) {
    return Vehicle(
      id: id,
      name: vehicle.name,
      description: vehicle.description,
      maintenancePlanImage: vehicle.maintenancePlanImage,
      documentsImage: vehicle.documentsImage,
      userManualLink: vehicle.userManualLink,
      maintenanceManualLink: vehicle.maintenanceManualLink,
      mileage: vehicle.mileage,
    );
  }
}
