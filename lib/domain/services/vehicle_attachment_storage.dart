abstract class VehicleAttachmentStorage {
  /// Copies [sourcePath] into app storage and returns the absolute stored path.
  Future<String> copyIntoStore({
    required String vehicleId,
    required String attachmentId,
    required String sourcePath,
    required String displayName,
  });

  Future<void> deleteFile(String filePath);

  Future<void> deleteAllForVehicle(String vehicleId);
}
