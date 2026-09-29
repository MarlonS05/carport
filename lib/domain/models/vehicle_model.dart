import '../entities/vehicle.dart';

class VehicleModel {
  final String id;
  final String name;
  final String description;
  final String? maintenancePlanImage;
  final String? documentsImage;
  final String? userManualLink;
  final String? maintenanceManualLink;
  final double mileage;

  const VehicleModel({
    required this.id,
    required this.name,
    required this.description,
    required this.maintenancePlanImage,
    required this.documentsImage,
    required this.userManualLink,
    required this.maintenanceManualLink,
    required this.mileage,
  });

  factory VehicleModel.empty() {
    return const VehicleModel(
      id: '',
      name: '',
      description: '',
      maintenancePlanImage: null,
      documentsImage: null,
      userManualLink: null,
      maintenanceManualLink: null,
      mileage: 0,
    );
  }

  factory VehicleModel.fromMap(Map<String, dynamic> map) {
    return VehicleModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      maintenancePlanImage: map['maintenance_plan_image'] as String?,
      documentsImage: map['documents_image'] as String?,
      userManualLink: map['user_manual_link'] as String?,
      maintenanceManualLink: map['maintenance_manual_link'] as String?,
      mileage: (map['mileage'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id.isNotEmpty) 'id': id,
      'name': name,
      'description': description,
      'maintenance_plan_image': maintenancePlanImage,
      'documents_image': documentsImage,
      'user_manual_link': userManualLink,
      'maintenance_manual_link': maintenanceManualLink,
      'mileage': mileage,
    };
  }

  Vehicle toEntity() {
    return Vehicle(
      id: id,
      name: name,
      description: description,
      maintenancePlanImage: maintenancePlanImage,
      documentsImage: documentsImage,
      userManualLink: userManualLink,
      maintenanceManualLink: maintenanceManualLink,
      mileage: mileage,
    );
  }

  factory VehicleModel.fromEntity(Vehicle vehicle) {
    return VehicleModel(
      id: vehicle.id,
      name: vehicle.name,
      description: vehicle.description,
      maintenancePlanImage: vehicle.maintenancePlanImage,
      documentsImage: vehicle.documentsImage,
      userManualLink: vehicle.userManualLink,
      maintenanceManualLink: vehicle.maintenanceManualLink,
      mileage: vehicle.mileage,
    );
  }
}
