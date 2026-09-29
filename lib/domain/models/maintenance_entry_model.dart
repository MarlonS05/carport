import '../entities/maintenance_entry.dart';

class MaintenanceEntryModel {
  final String id;
  final String vehicleId;
  final String title;
  final String description;
  final DateTime date;
  final String mileage;
  final String? imagePath;

  const MaintenanceEntryModel({
    required this.id,
    required this.vehicleId,
    required this.title,
    required this.description,
    required this.date,
    required this.mileage,
    required this.imagePath,
  });

  factory MaintenanceEntryModel.empty() {
    return MaintenanceEntryModel(
      id: '',
      vehicleId: '',
      title: '',
      description: '',
      date: DateTime.fromMillisecondsSinceEpoch(0),
      mileage: '',
      imagePath: null,
    );
  }

  factory MaintenanceEntryModel.fromMap(Map<String, dynamic> map) {
    return MaintenanceEntryModel(
      id: map['id'] as String,
      vehicleId: map['vehicle_id'] as String,
      title: map['title'] as String,
      description: map['description'] as String? ?? '',
      date: DateTime.parse(map['date'] as String),
      mileage: map['mileage'] as String? ?? '',
      imagePath: map['image_path'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vehicle_id': vehicleId,
      'title': title,
      'description': description,
      'date': date.toIso8601String().split('T').first,
      'mileage': mileage,
      'image_path': imagePath,
    };
  }

  MaintenanceEntry toEntity() {
    return MaintenanceEntry(
      id: id,
      vehicleId: vehicleId,
      title: title,
      description: description,
      date: date,
      mileage: mileage,
      imagePath: imagePath,
    );
  }

  factory MaintenanceEntryModel.fromEntity(MaintenanceEntry entry) {
    return MaintenanceEntryModel(
      id: entry.id,
      vehicleId: entry.vehicleId,
      title: entry.title,
      description: entry.description,
      date: entry.date,
      mileage: entry.mileage,
      imagePath: entry.imagePath,
    );
  }
}
