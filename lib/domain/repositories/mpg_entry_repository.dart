import '../entities/mpg_entry.dart';

abstract interface class MpgEntryRepository {
  Future<List<MpgEntry>> getByVehicleId(String vehicleId);

  Future<MpgEntry?> getById(String id);

  Future<String> create(MpgEntry entry);
}
