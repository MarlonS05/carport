class Vehicle {
  final String id;
  final String name;
  final String description;
  final String? maintenancePlanImage;
  final String? documentsImage;
  final String? userManualLink;
  final String? maintenanceManualLink;
  final double mileage;

  const Vehicle({
    required this.id,
    required this.name,
    required this.description,
    required this.maintenancePlanImage,
    required this.documentsImage,
    required this.userManualLink,
    required this.maintenanceManualLink,
    required this.mileage,
  });

  factory Vehicle.empty() {
    return const Vehicle(
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
}
