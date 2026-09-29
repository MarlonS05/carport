import '../entities/vehicle_attachment.dart';
import '../formatters/wall_clock_datetime.dart';

class VehicleAttachmentModel {
  final String id;
  final String vehicleId;
  final String displayName;
  final String filePath;
  final String? mimeType;
  final DateTime createdAt;
  final DateTime updatedAt;

  const VehicleAttachmentModel({
    required this.id,
    required this.vehicleId,
    required this.displayName,
    required this.filePath,
    this.mimeType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VehicleAttachmentModel.fromMap(Map<String, dynamic> map) {
    return VehicleAttachmentModel(
      id: map['id'] as String,
      vehicleId: map['vehicle_id'] as String,
      displayName: map['display_name'] as String,
      filePath: map['file_path'] as String,
      mimeType: map['mime_type'] as String?,
      createdAt: WallClockDateTime.parseFromStorage(map['created_at'] as String),
      updatedAt: WallClockDateTime.parseFromStorage(map['updated_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id.isNotEmpty) 'id': id,
      'vehicle_id': vehicleId,
      'display_name': displayName,
      'file_path': filePath,
      'mime_type': mimeType,
      'created_at': WallClockDateTime.formatForStorage(createdAt),
      'updated_at': WallClockDateTime.formatForStorage(updatedAt),
    };
  }

  VehicleAttachment toEntity() {
    return VehicleAttachment(
      id: id,
      vehicleId: vehicleId,
      displayName: displayName,
      filePath: filePath,
      mimeType: mimeType,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory VehicleAttachmentModel.fromEntity(VehicleAttachment attachment) {
    return VehicleAttachmentModel(
      id: attachment.id,
      vehicleId: attachment.vehicleId,
      displayName: attachment.displayName,
      filePath: attachment.filePath,
      mimeType: attachment.mimeType,
      createdAt: attachment.createdAt,
      updatedAt: attachment.updatedAt,
    );
  }
}
