import 'dart:async';

import 'package:carport/db/database_migrations.dart';
import 'package:carport/db/database_schema.dart';
import 'package:carport/domain/models/maintenance_entry_model.dart';
import 'package:carport/domain/models/mpg_entry_model.dart';
import 'package:carport/domain/models/reminder_model.dart';
import 'package:carport/domain/models/service_item_model.dart';
import 'package:carport/domain/models/vehicle_attachment_model.dart';
import 'package:carport/domain/models/vehicle_model.dart';
import 'package:carport/logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper({String? overridePath}) : _overridePath = overridePath;

  static const _databaseName = 'carport.db';

  /// When set, opened directly instead of the default app database path.
  /// Intended for tests (e.g. an in-memory database).
  final String? _overridePath;

  Database? _database;
  Completer<Database>? _dbCompleter;

  Future<Database> get database async {
    if (_database != null) return _database!;
    if (_dbCompleter != null) return _dbCompleter!.future;
    _dbCompleter = Completer<Database>();
    try {
      _database = await _initDatabase();
      _dbCompleter!.complete(_database!);
    } catch (e, st) {
      _dbCompleter!.completeError(e, st);
      _dbCompleter = null;
      rethrow;
    }
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = _overridePath ?? join(await getDatabasesPath(), _databaseName);
    return openDatabase(
      path,
      version: databaseVersion,
      onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
      onCreate: (db, _) => createSchemaV1(db),
      onUpgrade: applyMigrations,
      onDowngrade: onDatabaseDowngradeDelete,
      onOpen: (db) async {
        logger.i('Database opened at version ${await db.getVersion()}');
      },
    );
  }

  // --- Vehicles ---

  Future<int> countAllVehicles() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) AS count FROM $tableVehicles',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<List<VehicleModel>> getAllVehicles() async {
    final db = await database;
    final rows = await db.query(
      tableVehicles,
      orderBy: 'name COLLATE NOCASE ASC',
    );
    return rows.map(VehicleModel.fromMap).toList();
  }

  Future<VehicleModel?> getVehicleById(String id) async {
    final db = await database;
    final rows = await db.query(
      tableVehicles,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return VehicleModel.fromMap(rows.first);
  }

  Future<void> insertVehicle(VehicleModel model) async {
    final db = await database;
    final map = model.toMap();
    map['updated_at'] = _nowIso();
    await db.insert(tableVehicles, map);
  }

  Future<void> updateVehicle(VehicleModel model) async {
    final db = await database;
    final map = model.toMap();
    map['updated_at'] = _nowIso();
    await db.update(
      tableVehicles,
      map,
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> deleteVehicle(String id) async {
    final db = await database;
    await db.delete(
      tableVehicles,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<({String id, DateTime updatedAt})?> getMostRecentlyUpdatedVehicle() async {
    final db = await database;
    final rows = await db.query(
      tableVehicles,
      columns: ['id', 'updated_at'],
      orderBy: 'updated_at DESC',
      limit: 1,
    );
    if (rows.isEmpty) return null;
    final row = rows.first;
    return (
      id: row['id'] as String,
      updatedAt: DateTime.parse(row['updated_at'] as String),
    );
  }

  Future<DateTime?> getVehicleUpdatedAt(String id) async {
    final db = await database;
    final rows = await db.query(
      tableVehicles,
      columns: ['updated_at'],
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return DateTime.parse(rows.first['updated_at'] as String);
  }

  // --- Service items ---

  Future<int> countAllServiceItems() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) AS count FROM $tableServiceItems',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<List<ServiceItemModel>> getServiceItemsByVehicleId(
    String vehicleId,
  ) async {
    final db = await database;
    final rows = await db.query(
      tableServiceItems,
      where: 'vehicle_id = ?',
      whereArgs: [vehicleId],
      orderBy: 'date DESC',
    );
    return rows.map(ServiceItemModel.fromMap).toList();
  }

  Future<ServiceItemModel?> getServiceItemById(String id) async {
    final db = await database;
    final rows = await db.query(
      tableServiceItems,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return ServiceItemModel.fromMap(rows.first);
  }

  Future<void> insertServiceItem(ServiceItemModel model) async {
    final db = await database;
    final map = model.toMap();
    map['updated_at'] = _nowIso();
    await db.insert(tableServiceItems, map);
  }

  Future<void> updateServiceItem(ServiceItemModel model) async {
    final db = await database;
    final map = model.toMap();
    map['updated_at'] = _nowIso();
    await db.update(
      tableServiceItems,
      map,
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> deleteServiceItem(String id) async {
    final db = await database;
    await db.delete(
      tableServiceItems,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<({String id, DateTime updatedAt})?> getMostRecentlyUpdatedServiceItem() async {
    final db = await database;
    final rows = await db.query(
      tableServiceItems,
      columns: ['id', 'updated_at'],
      orderBy: 'updated_at DESC',
      limit: 1,
    );
    if (rows.isEmpty) return null;
    final row = rows.first;
    return (
      id: row['id'] as String,
      updatedAt: DateTime.parse(row['updated_at'] as String),
    );
  }

  Future<DateTime?> getServiceItemUpdatedAt(String id) async {
    final db = await database;
    final rows = await db.query(
      tableServiceItems,
      columns: ['updated_at'],
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return DateTime.parse(rows.first['updated_at'] as String);
  }

  // --- Maintenance entries ---

  Future<List<MaintenanceEntryModel>> getEntriesForVehicle(
    String vehicleId,
  ) async {
    final db = await database;
    final rows = await db.query(
      tableMaintenanceEntries,
      where: 'vehicle_id = ?',
      whereArgs: [vehicleId],
      orderBy: 'date DESC',
    );
    return rows.map(MaintenanceEntryModel.fromMap).toList();
  }

  Future<MaintenanceEntryModel?> getMaintenanceEntryById(String id) async {
    final db = await database;
    final rows = await db.query(
      tableMaintenanceEntries,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return MaintenanceEntryModel.fromMap(rows.first);
  }

  Future<void> insertMaintenanceEntry(MaintenanceEntryModel model) async {
    final db = await database;
    await db.insert(tableMaintenanceEntries, model.toMap());
  }

  Future<void> updateMaintenanceEntry(MaintenanceEntryModel model) async {
    final db = await database;
    await db.update(
      tableMaintenanceEntries,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> deleteMaintenanceEntry(String id) async {
    final db = await database;
    await db.delete(
      tableMaintenanceEntries,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // --- Reminders ---

  Future<List<ReminderModel>> getAllReminders() async {
    final db = await database;
    final rows = await db.query(
      tableReminders,
      orderBy: 'due_at ASC',
    );
    return rows.map(ReminderModel.fromMap).toList();
  }

  Future<ReminderModel?> getReminderById(String id) async {
    final db = await database;
    final rows = await db.query(
      tableReminders,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return ReminderModel.fromMap(rows.first);
  }

  Future<void> insertReminder(ReminderModel model) async {
    final db = await database;
    await db.insert(tableReminders, model.toMap());
  }

  Future<void> updateReminder(ReminderModel model) async {
    final db = await database;
    await db.update(
      tableReminders,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  Future<void> deleteReminder(String id) async {
    final db = await database;
    await db.delete(
      tableReminders,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // --- Vehicle attachments ---

  Future<List<String>> getAllVehicleAttachmentIds() async {
    final db = await database;
    final rows = await db.query(
      tableVehicleAttachments,
      columns: ['id'],
      orderBy: 'id ASC',
    );
    return rows.map((row) => row['id'] as String).toList();
  }

  Future<List<VehicleAttachmentModel>> getVehicleAttachmentsByVehicleId(
    String vehicleId,
  ) async {
    final db = await database;
    final rows = await db.query(
      tableVehicleAttachments,
      where: 'vehicle_id = ?',
      whereArgs: [vehicleId],
      orderBy: 'created_at DESC',
    );
    return rows.map(VehicleAttachmentModel.fromMap).toList();
  }

  Future<VehicleAttachmentModel?> getVehicleAttachmentById(String id) async {
    final db = await database;
    final rows = await db.query(
      tableVehicleAttachments,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return VehicleAttachmentModel.fromMap(rows.first);
  }

  Future<void> insertVehicleAttachment(VehicleAttachmentModel model) async {
    final db = await database;
    final map = model.toMap();
    map['updated_at'] = _nowIso();
    await db.insert(tableVehicleAttachments, map);
  }

  Future<({String id, DateTime updatedAt})?>
      getMostRecentlyUpdatedVehicleAttachment() async {
    final db = await database;
    final rows = await db.query(
      tableVehicleAttachments,
      columns: ['id', 'updated_at'],
      orderBy: 'updated_at DESC',
      limit: 1,
    );
    if (rows.isEmpty) return null;
    final row = rows.first;
    return (
      id: row['id'] as String,
      updatedAt: DateTime.parse(row['updated_at'] as String),
    );
  }

  Future<void> deleteVehicleAttachment(String id) async {
    final db = await database;
    await db.delete(
      tableVehicleAttachments,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // --- MPG entries ---

  Future<List<MpgEntryModel>> getMpgEntriesByVehicleId(String vehicleId) async {
    final db = await database;
    final rows = await db.query(
      tableMpgEntries,
      where: 'vehicle_id = ?',
      whereArgs: [vehicleId],
      orderBy: 'recorded_at DESC',
    );
    return rows.map(MpgEntryModel.fromMap).toList();
  }

  Future<MpgEntryModel?> getMpgEntryById(String id) async {
    final db = await database;
    final rows = await db.query(
      tableMpgEntries,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return MpgEntryModel.fromMap(rows.first);
  }

  Future<void> insertMpgEntry(MpgEntryModel model) async {
    final db = await database;
    await db.insert(tableMpgEntries, model.toMap());
  }

  String _nowIso() => DateTime.now().toUtc().toIso8601String();
}
