import 'package:uuid/uuid.dart';

import '../db/database_helper.dart';
import '../domain/entities/vehicle_attachment.dart';
import '../domain/models/vehicle_attachment_model.dart';
import '../domain/repositories/vehicle_attachment_repository.dart';

class VehicleAttachmentRepositoryImpl implements VehicleAttachmentRepository {
  VehicleAttachmentRepositoryImpl(this._dbHelper, [Uuid? uuid])
      : _uuid = uuid ?? const Uuid();

  final DatabaseHelper _dbHelper;
  final Uuid _uuid;

  @override
  Future<List<String>> listAllIds() {
    return _dbHelper.getAllVehicleAttachmentIds();
  }

  @override
  Future<List<VehicleAttachment>> listByVehicleId(String vehicleId) async {
    final models = await _dbHelper.getVehicleAttachmentsByVehicleId(vehicleId);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<VehicleAttachment?> getById(String id) async {
    final model = await _dbHelper.getVehicleAttachmentById(id);
    return model?.toEntity();
  }

  @override
  Future<String> create(VehicleAttachment attachment) async {
    final id = attachment.id.isEmpty ? _uuid.v4() : attachment.id;
    final model = VehicleAttachmentModel.fromEntity(
      VehicleAttachment(
        id: id,
        vehicleId: attachment.vehicleId,
        displayName: attachment.displayName,
        filePath: attachment.filePath,
        mimeType: attachment.mimeType,
        createdAt: attachment.createdAt,
        updatedAt: attachment.updatedAt,
      ),
    );
    await _dbHelper.insertVehicleAttachment(model);
    return id;
  }

  @override
  Future<void> delete(String id) async {
    await _dbHelper.deleteVehicleAttachment(id);
  }

  @override
  Future<({String id, DateTime updatedAt})?> getMostRecentlyUpdated() {
    return _dbHelper.getMostRecentlyUpdatedVehicleAttachment();
  }
}
