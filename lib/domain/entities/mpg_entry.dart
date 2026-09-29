import 'distance_unit.dart';

class MpgEntry {
  final String id;
  final String vehicleId;
  final double liters;
  final double distance;
  final DistanceUnit distanceUnit;
  final DateTime recordedAt;

  const MpgEntry({
    required this.id,
    required this.vehicleId,
    required this.liters,
    required this.distance,
    required this.distanceUnit,
    required this.recordedAt,
  });

  factory MpgEntry.empty() {
    return MpgEntry(
      id: '',
      vehicleId: '',
      liters: 0,
      distance: 0,
      distanceUnit: DistanceUnit.miles,
      recordedAt: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
    );
  }
}
