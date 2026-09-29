import '../entities/vehicle_attachment.dart';

abstract class VehicleAttachmentRepository {
  Future<List<String>> listAllIds();

  Future<List<VehicleAttachment>> listByVehicleId(String vehicleId);

  Future<VehicleAttachment?> getById(String id);

  Future<String> create(VehicleAttachment attachment);

  Future<void> delete(String id);

  Future<({String id, DateTime updatedAt})?> getMostRecentlyUpdated();
}
