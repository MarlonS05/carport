import 'package:uuid/uuid.dart';

import '../db/database_helper.dart';
import '../domain/entities/service_item.dart';
import '../domain/models/service_item_model.dart';
import '../domain/repositories/service_item_repository.dart';

class ServiceItemRepositoryImpl implements ServiceItemRepository {
  final DatabaseHelper _dbHelper;
  final Uuid _uuid;

  ServiceItemRepositoryImpl(this._dbHelper, [Uuid? uuid])
      : _uuid = uuid ?? const Uuid();

  @override
  Future<int> countAll() async {
    return _dbHelper.countAllServiceItems();
  }

  @override
  Future<List<ServiceItem>> getByVehicleId(String vehicleId) async {
    final models = await _dbHelper.getServiceItemsByVehicleId(vehicleId);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<ServiceItem?> getById(String id) async {
    final model = await _dbHelper.getServiceItemById(id);
    return model?.toEntity();
  }

  @override
  Future<String> create(ServiceItem item) async {
    final id = item.id.isEmpty ? _uuid.v4() : item.id;
    final model = ServiceItemModel.fromEntity(_copyWithId(item, id));
    await _dbHelper.insertServiceItem(model);
    return id;
  }

  @override
  Future<void> update(ServiceItem item) async {
    await _dbHelper.updateServiceItem(ServiceItemModel.fromEntity(item));
  }

  @override
  Future<void> delete(String id) async {
    await _dbHelper.deleteServiceItem(id);
  }

  @override
  Future<({String id, DateTime updatedAt})?> getMostRecentlyUpdated() {
    return _dbHelper.getMostRecentlyUpdatedServiceItem();
  }

  @override
  Future<DateTime?> getUpdatedAt(String id) {
    return _dbHelper.getServiceItemUpdatedAt(id);
  }

  ServiceItem _copyWithId(ServiceItem item, String id) {
    return ServiceItem(
      id: id,
      vehicleId: item.vehicleId,
      title: item.title,
      description: item.description,
      date: item.date,
      mileage: item.mileage,
    );
  }
}
