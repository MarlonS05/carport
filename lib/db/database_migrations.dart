import 'package:carport/db/database_schema.dart';
import 'package:carport/logger/logger.dart';
import 'package:sqflite/sqflite.dart';

/// Current database schema version. Increment when adding a migration.
const databaseVersion = 8;

/// Sentinel value used when [updated_at] is unknown (v3 default).
const updatedAtEpoch = '1970-01-01T00:00:00.000Z';

/// Maps each schema version to the SQL statements required to upgrade the
/// database to that version from the previous one.
///
/// To introduce a new migration:
///   1. Write SQL for the change (e.g. `ALTER TABLE …`, `CREATE TABLE …`).
///   2. Add a new entry here keyed by the target version number.
///   3. Increment [databaseVersion].
///   4. Update [createSchemaV1] in `database_schema.dart` if the change should
///      also apply to fresh installs (keep onCreate and latest migration in
///      sync for additive changes).
///   5. Restart the app — hot-reload does not re-run migrations reliably.
///
/// For complex migrations (data backfills, multi-step transforms), call a
/// dedicated `Future<void> migrateToVN(Database db)` from a version entry
/// instead of inline SQL strings.
final Map<int, List<String>> migrations = {
  // v2: replace free-text `interval` + `repeating` with structured
  // `repeat_frequency` (daily|weekly|monthly|yearly, nullable = one-time).
  // Existing rows cannot be reliably mapped from free text, so they become
  // one-time reminders (repeat_frequency = NULL). The table is rebuilt via
  // [createRemindersTable] so onCreate and this migration stay in sync.
  2: [
    'ALTER TABLE $tableReminders RENAME TO ${tableReminders}_old',
    createRemindersTable,
    'INSERT INTO $tableReminders (id, name, body, due_at, repeat_frequency) '
        'SELECT id, name, body, due_at, NULL FROM ${tableReminders}_old',
    'DROP TABLE ${tableReminders}_old',
  ],
  // v3: track last write time for portal checkin on app start.
  3: [
    "ALTER TABLE $tableVehicles ADD COLUMN updated_at TEXT NOT NULL "
        "DEFAULT '$updatedAtEpoch'",
    "ALTER TABLE $tableServiceItems ADD COLUMN updated_at TEXT NOT NULL "
        "DEFAULT '$updatedAtEpoch'",
  ],
  // v4: backfill legacy rows that still carry the v3 epoch sentinel.
  4: [
    "UPDATE $tableServiceItems "
        "SET updated_at = date "
        "WHERE updated_at = '$updatedAtEpoch'",
    "UPDATE $tableVehicles "
        "SET updated_at = ("
        "SELECT MAX(si.updated_at) FROM $tableServiceItems si "
        "WHERE si.vehicle_id = $tableVehicles.id"
        ") "
        "WHERE updated_at = '$updatedAtEpoch' "
        "AND EXISTS ("
        "SELECT 1 FROM $tableServiceItems si WHERE si.vehicle_id = $tableVehicles.id"
        ")",
  ],
  5: [
    '''
CREATE TABLE $tableVehicleAttachments (
  id TEXT PRIMARY KEY,
  vehicle_id TEXT NOT NULL REFERENCES $tableVehicles(id) ON DELETE CASCADE,
  display_name TEXT NOT NULL,
  file_path TEXT NOT NULL,
  mime_type TEXT,
  created_at TEXT NOT NULL
)
''',
  ],
  // v6: track attachment write time for portal checkin.
  6: [
    "ALTER TABLE $tableVehicleAttachments ADD COLUMN updated_at TEXT NOT NULL "
        "DEFAULT '$updatedAtEpoch'",
    'UPDATE $tableVehicleAttachments SET updated_at = created_at',
  ],
  // v7: optional biometric-gated vehicle documents image (base64).
  7: [
    'ALTER TABLE $tableVehicles ADD COLUMN documents_image TEXT',
  ],
  // v8: full-tank fill-up rows for MPG tracking (graphs later).
  8: [
    createMpgEntriesTable,
  ],
};

/// Applies every pending migration whose target version is greater than
/// [oldVersion] and at most [newVersion], in ascending order.
Future<void> applyMigrations(
  Database db,
  int oldVersion,
  int newVersion,
) async {
  for (var version = oldVersion + 1; version <= newVersion; version++) {
    final statements = migrations[version];
    if (statements == null) {
      logger.w(
        'DatabaseMigrations: no migration entry found for version $version '
        '(upgrading from $oldVersion to $newVersion). '
        'Add an entry to migrations for version $version.',
      );
      continue;
    }
    for (final sql in statements) {
      await db.execute(sql);
    }
  }
}
