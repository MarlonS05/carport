import 'package:uuid/uuid.dart';

import '../db/database_helper.dart';
import '../domain/entities/mpg_entry.dart';
import '../domain/models/mpg_entry_model.dart';
import '../domain/repositories/mpg_entry_repository.dart';

class MpgEntryRepositoryImpl implements MpgEntryRepository {
  final DatabaseHelper _dbHelper;
  final Uuid _uuid;

  MpgEntryRepositoryImpl(this._dbHelper, [Uuid? uuid])
      : _uuid = uuid ?? const Uuid();

  @override
  Future<List<MpgEntry>> getByVehicleId(String vehicleId) async {
    final models = await _dbHelper.getMpgEntriesByVehicleId(vehicleId);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<MpgEntry?> getById(String id) async {
    final model = await _dbHelper.getMpgEntryById(id);
    return model?.toEntity();
  }

  @override
  Future<String> create(MpgEntry entry) async {
    final id = entry.id.isEmpty ? _uuid.v4() : entry.id;
    final model = MpgEntryModel.fromEntity(_copyWithId(entry, id));
    await _dbHelper.insertMpgEntry(model);
    return id;
  }

  MpgEntry _copyWithId(MpgEntry entry, String id) {
    return MpgEntry(
      id: id,
      vehicleId: entry.vehicleId,
      liters: entry.liters,
      distance: entry.distance,
      distanceUnit: entry.distanceUnit,
      recordedAt: entry.recordedAt,
    );
  }
}
