import '../entities/vehicle.dart';

abstract interface class VehicleRepository {
  Future<int> countAll();

  Future<List<Vehicle>> getAll();

  Future<Vehicle?> getById(String id);

  Future<String> create(Vehicle vehicle);

  Future<void> update(Vehicle vehicle);

  Future<void> delete(String id);

  /// Returns the vehicle with the most recent [updated_at] timestamp, if any.
  Future<({String id, DateTime updatedAt})?> getMostRecentlyUpdated();

  /// Returns the [updated_at] timestamp for the vehicle with [id], if it exists.
  Future<DateTime?> getUpdatedAt(String id);
}
