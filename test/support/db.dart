import 'package:carport/db/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Initializes the sqflite ffi database factory so SQLite tests can run on the
/// host VM (no device/emulator). Safe to call multiple times.
void initFfiDatabaseFactory() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

/// Builds a [DatabaseHelper] backed by a private in-memory database so each
/// test is isolated and safe to run concurrently across test suites.
DatabaseHelper newInMemoryDatabaseHelper() {
  return DatabaseHelper(overridePath: inMemoryDatabasePath);
}

/// Opens a fresh in-memory database for direct schema/migration testing.
Future<Database> openInMemoryDatabase({
  required int version,
  required OnDatabaseCreateFn onCreate,
  OnDatabaseVersionChangeFn? onUpgrade,
}) {
  return databaseFactory.openDatabase(
    inMemoryDatabasePath,
    options: OpenDatabaseOptions(
      version: version,
      onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    ),
  );
}
