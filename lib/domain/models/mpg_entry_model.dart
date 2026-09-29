import '../entities/distance_unit.dart';
import '../entities/mpg_entry.dart';

class MpgEntryModel {
  final String id;
  final String vehicleId;
  final double liters;
  final double distance;
  final DistanceUnit distanceUnit;
  final DateTime recordedAt;

  const MpgEntryModel({
    required this.id,
    required this.vehicleId,
    required this.liters,
    required this.distance,
    required this.distanceUnit,
    required this.recordedAt,
  });

  factory MpgEntryModel.fromMap(Map<String, dynamic> map) {
    return MpgEntryModel(
      id: map['id'] as String,
      vehicleId: map['vehicle_id'] as String,
      liters: (map['liters'] as num).toDouble(),
      distance: (map['distance'] as num).toDouble(),
      distanceUnit: DistanceUnit.fromStorage(map['distance_unit'] as String?),
      recordedAt: DateTime.parse(map['recorded_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id.isNotEmpty) 'id': id,
      'vehicle_id': vehicleId,
      'liters': liters,
      'distance': distance,
      'distance_unit': distanceUnit.toStorage(),
      'recorded_at': recordedAt.toIso8601String(),
    };
  }

  MpgEntry toEntity() {
    return MpgEntry(
      id: id,
      vehicleId: vehicleId,
      liters: liters,
      distance: distance,
      distanceUnit: distanceUnit,
      recordedAt: recordedAt,
    );
  }

  factory MpgEntryModel.fromEntity(MpgEntry entry) {
    return MpgEntryModel(
      id: entry.id,
      vehicleId: entry.vehicleId,
      liters: entry.liters,
      distance: entry.distance,
      distanceUnit: entry.distanceUnit,
      recordedAt: entry.recordedAt,
    );
  }
}
