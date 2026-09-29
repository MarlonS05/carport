class VehicleAttachment {
  final String id;
  final String vehicleId;
  final String displayName;
  final String filePath;
  final String? mimeType;
  final DateTime createdAt;
  final DateTime updatedAt;

  const VehicleAttachment({
    required this.id,
    required this.vehicleId,
    required this.displayName,
    required this.filePath,
    this.mimeType,
    required this.createdAt,
    required this.updatedAt,
  });
}
