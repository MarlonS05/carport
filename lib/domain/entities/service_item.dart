class ServiceItem {
  final String id;
  final String vehicleId;
  final String title;
  final String description;
  final DateTime date;
  final double mileage;

  const ServiceItem({
    required this.id,
    required this.vehicleId,
    required this.title,
    required this.description,
    required this.date,
    required this.mileage,
  });

  factory ServiceItem.empty() {
    return ServiceItem(
      id: '',
      vehicleId: '',
      title: '',
      description: '',
      date: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      mileage: 0,
    );
  }
}
