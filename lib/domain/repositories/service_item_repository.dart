import '../entities/service_item.dart';

abstract interface class ServiceItemRepository {
  Future<int> countAll();

  Future<List<ServiceItem>> getByVehicleId(String vehicleId);

  Future<ServiceItem?> getById(String id);

  Future<String> create(ServiceItem item);

  Future<void> update(ServiceItem item);

  Future<void> delete(String id);

  /// Returns the service item with the most recent [updated_at] timestamp, if any.
  Future<({String id, DateTime updatedAt})?> getMostRecentlyUpdated();

  /// Returns the [updated_at] timestamp for the service item with [id], if it exists.
  Future<DateTime?> getUpdatedAt(String id);
}
