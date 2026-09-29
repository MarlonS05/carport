import '../entities/service_item.dart';

class ServiceItemModel {
  final String id;
  final String vehicleId;
  final String title;
  final String description;
  final DateTime date;
  final double mileage;

  const ServiceItemModel({
    required this.id,
    required this.vehicleId,
    required this.title,
    required this.description,
    required this.date,
    required this.mileage,
  });

  factory ServiceItemModel.empty() {
    return ServiceItemModel(
      id: '',
      vehicleId: '',
      title: '',
      description: '',
      date: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      mileage: 0,
    );
  }

  factory ServiceItemModel.fromMap(Map<String, dynamic> map) {
    return ServiceItemModel(
      id: map['id'] as String,
      vehicleId: map['vehicle_id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: DateTime.parse(map['date'] as String),
      mileage: (map['mileage'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id.isNotEmpty) 'id': id,
      'vehicle_id': vehicleId,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'mileage': mileage,
    };
  }

  ServiceItem toEntity() {
    return ServiceItem(
      id: id,
      vehicleId: vehicleId,
      title: title,
      description: description,
      date: date,
      mileage: mileage,
    );
  }

  factory ServiceItemModel.fromEntity(ServiceItem item) {
    return ServiceItemModel(
      id: item.id,
      vehicleId: item.vehicleId,
      title: item.title,
      description: item.description,
      date: item.date,
      mileage: item.mileage,
    );
  }
}
