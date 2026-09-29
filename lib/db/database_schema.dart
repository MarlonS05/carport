import 'package:sqflite/sqflite.dart';

const tableVehicles = 'vehicles';
const tableMaintenanceEntries = 'maintenance_entries';
const tableServiceItems = 'service_items';
const tableReminders = 'reminders';
const tableVehicleAttachments = 'vehicle_attachments';
const tableMpgEntries = 'mpg_entries';

const createVehiclesTable = '''
CREATE TABLE $tableVehicles (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  maintenance_plan_image TEXT,
  documents_image TEXT,
  user_manual_link TEXT,
  maintenance_manual_link TEXT,
  mileage REAL NOT NULL DEFAULT 0,
  updated_at TEXT NOT NULL
)
''';

const createMaintenanceEntriesTable = '''
CREATE TABLE $tableMaintenanceEntries (
  id TEXT PRIMARY KEY,
  vehicle_id TEXT NOT NULL REFERENCES $tableVehicles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  date TEXT NOT NULL,
  mileage TEXT NOT NULL DEFAULT '',
  image_path TEXT
)
''';

const createServiceItemsTable = '''
CREATE TABLE $tableServiceItems (
  id TEXT PRIMARY KEY,
  vehicle_id TEXT NOT NULL REFERENCES $tableVehicles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  date TEXT NOT NULL,
  mileage REAL NOT NULL DEFAULT 0,
  updated_at TEXT NOT NULL
)
''';

const createRemindersTable = '''
CREATE TABLE $tableReminders (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  body TEXT NOT NULL DEFAULT '',
  due_at TEXT NOT NULL,
  repeat_frequency TEXT
)
''';

const createVehicleAttachmentsTable = '''
CREATE TABLE $tableVehicleAttachments (
  id TEXT PRIMARY KEY,
  vehicle_id TEXT NOT NULL REFERENCES $tableVehicles(id) ON DELETE CASCADE,
  display_name TEXT NOT NULL,
  file_path TEXT NOT NULL,
  mime_type TEXT,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
)
''';

const createMpgEntriesTable = '''
CREATE TABLE $tableMpgEntries (
  id TEXT PRIMARY KEY,
  vehicle_id TEXT NOT NULL REFERENCES $tableVehicles(id) ON DELETE CASCADE,
  liters REAL NOT NULL,
  distance REAL NOT NULL,
  distance_unit TEXT NOT NULL,
  recorded_at TEXT NOT NULL
)
''';

/// Creates the v1 schema for a fresh database install.
Future<void> createSchemaV1(Database db) async {
  await db.execute(createVehiclesTable);
  await db.execute(createMaintenanceEntriesTable);
  await db.execute(createServiceItemsTable);
  await db.execute(createRemindersTable);
  await db.execute(createVehicleAttachmentsTable);
  await db.execute(createMpgEntriesTable);
}
