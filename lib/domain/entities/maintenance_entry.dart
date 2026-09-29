class MaintenanceEntry {
  final String id;
  final String vehicleId;
  final String title;
  final String description;
  final DateTime date;
  final String mileage;
  final String? imagePath;

  const MaintenanceEntry({
    required this.id,
    required this.vehicleId,
    required this.title,
    required this.description,
    required this.date,
    required this.mileage,
    required this.imagePath,
  });

  factory MaintenanceEntry.empty() {
    return MaintenanceEntry(
      id: '',
      vehicleId: '',
      title: '',
      description: '',
      date: DateTime.fromMillisecondsSinceEpoch(0),
      mileage: '',
      imagePath: null,
    );
  }
}
