import 'package:carport/db/database_migrations.dart';
import 'package:carport/db/database_schema.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/db.dart';

void main() {
  setUpAll(initFfiDatabaseFactory);

  test('createSchemaV1 creates all four tables', () async {
    final db = await openInMemoryDatabase(
      version: 1,
      onCreate: (db, _) => createSchemaV1(db),
    );
    addTearDown(db.close);

    final tables = await db.query(
      'sqlite_master',
      columns: ['name'],
      where: "type = 'table'",
    );
    final names = tables.map((r) => r['name']).toSet();

    expect(
      names,
      containsAll(<String>[
        tableVehicles,
        tableServiceItems,
        tableMaintenanceEntries,
        tableReminders,
      ]),
    );
  });

  test('v2 migration rebuilds reminders and nulls repeat_frequency', () async {
    final db = await openInMemoryDatabase(
      version: 1,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE $tableReminders (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            body TEXT NOT NULL DEFAULT '',
            due_at TEXT NOT NULL,
            interval TEXT,
            repeating INTEGER NOT NULL DEFAULT 0
          )
        ''');
      },
    );
    addTearDown(db.close);

    await db.insert(tableReminders, {
      'id': 'r1',
      'name': 'Legacy',
      'body': 'note',
      'due_at': '2026-03-14T09:30:00',
      'interval': 'every_5000_mi',
      'repeating': 1,
    });

    await applyMigrations(db, 1, 2);

    final rows = await db.query(tableReminders);
    expect(rows.length, 1);
    expect(rows.first['id'], 'r1');
    expect(rows.first['name'], 'Legacy');
    expect(rows.first['due_at'], '2026-03-14T09:30:00');
    expect(rows.first['repeat_frequency'], isNull);
    expect(rows.first.containsKey('interval'), isFalse);

    final oldTable = await db.query(
      'sqlite_master',
      where: "type = 'table' AND name = '${tableReminders}_old'",
    );
    expect(oldTable, isEmpty);
  });

  test('v3 migration adds updated_at to vehicles and service items', () async {
    final db = await openInMemoryDatabase(
      version: 2,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE $tableVehicles (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            description TEXT NOT NULL DEFAULT '',
            maintenance_plan_image TEXT,
            user_manual_link TEXT,
            maintenance_manual_link TEXT,
            mileage REAL NOT NULL DEFAULT 0
          )
        ''');
        await db.execute('''
          CREATE TABLE $tableServiceItems (
            id TEXT PRIMARY KEY,
            vehicle_id TEXT NOT NULL REFERENCES $tableVehicles(id) ON DELETE CASCADE,
            title TEXT NOT NULL,
            description TEXT NOT NULL DEFAULT '',
            date TEXT NOT NULL,
            mileage REAL NOT NULL DEFAULT 0
          )
        ''');
      },
    );
    addTearDown(db.close);

    await db.insert(tableVehicles, {
      'id': 'v1',
      'name': 'Civic',
      'description': '',
      'mileage': 0,
    });
    await db.insert(tableServiceItems, {
      'id': 's1',
      'vehicle_id': 'v1',
      'title': 'Oil',
      'description': '',
      'date': '2026-01-01T00:00:00.000Z',
      'mileage': 0,
    });

    await applyMigrations(db, 2, 3);

    final vehicleColumns =
        await db.rawQuery('PRAGMA table_info($tableVehicles)');
    final serviceItemColumns =
        await db.rawQuery('PRAGMA table_info($tableServiceItems)');

    expect(
      vehicleColumns.map((row) => row['name']),
      contains('updated_at'),
    );
    expect(
      serviceItemColumns.map((row) => row['name']),
      contains('updated_at'),
    );

    final vehicle =
        await db.query(tableVehicles, where: 'id = ?', whereArgs: ['v1']);
    final serviceItem =
        await db.query(tableServiceItems, where: 'id = ?', whereArgs: ['s1']);

    expect(vehicle.first['updated_at'], updatedAtEpoch);
    expect(serviceItem.first['updated_at'], updatedAtEpoch);
  });

  test('v4 migration backfills updated_at from existing data', () async {
    final db = await openInMemoryDatabase(
      version: 2,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE $tableVehicles (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            description TEXT NOT NULL DEFAULT '',
            maintenance_plan_image TEXT,
            user_manual_link TEXT,
            maintenance_manual_link TEXT,
            mileage REAL NOT NULL DEFAULT 0
          )
        ''');
        await db.execute('''
          CREATE TABLE $tableServiceItems (
            id TEXT PRIMARY KEY,
            vehicle_id TEXT NOT NULL REFERENCES $tableVehicles(id) ON DELETE CASCADE,
            title TEXT NOT NULL,
            description TEXT NOT NULL DEFAULT '',
            date TEXT NOT NULL,
            mileage REAL NOT NULL DEFAULT 0
          )
        ''');
      },
    );
    addTearDown(db.close);

    await db.insert(tableVehicles, {
      'id': 'v1',
      'name': 'Civic',
      'description': '',
      'mileage': 0,
    });
    await db.insert(tableVehicles, {
      'id': 'v2',
      'name': 'Empty',
      'description': '',
      'mileage': 0,
    });
    await db.insert(tableServiceItems, {
      'id': 's1',
      'vehicle_id': 'v1',
      'title': 'Oil',
      'description': '',
      'date': '2026-01-01T00:00:00.000Z',
      'mileage': 0,
    });
    await db.insert(tableServiceItems, {
      'id': 's2',
      'vehicle_id': 'v1',
      'title': 'Tires',
      'description': '',
      'date': '2026-06-15T00:00:00.000Z',
      'mileage': 0,
    });

    await applyMigrations(db, 2, 4);

    final serviceItem1 =
        await db.query(tableServiceItems, where: 'id = ?', whereArgs: ['s1']);
    final serviceItem2 =
        await db.query(tableServiceItems, where: 'id = ?', whereArgs: ['s2']);
    final vehicleWithItems =
        await db.query(tableVehicles, where: 'id = ?', whereArgs: ['v1']);
    final vehicleWithoutItems =
        await db.query(tableVehicles, where: 'id = ?', whereArgs: ['v2']);

    expect(serviceItem1.first['updated_at'], '2026-01-01T00:00:00.000Z');
    expect(serviceItem2.first['updated_at'], '2026-06-15T00:00:00.000Z');
    expect(vehicleWithItems.first['updated_at'], '2026-06-15T00:00:00.000Z');
    expect(vehicleWithoutItems.first['updated_at'], updatedAtEpoch);
  });

  test('v7 migration adds documents_image to vehicles', () async {
    final db = await openInMemoryDatabase(
      version: 6,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE $tableVehicles (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            description TEXT NOT NULL DEFAULT '',
            maintenance_plan_image TEXT,
            user_manual_link TEXT,
            maintenance_manual_link TEXT,
            mileage REAL NOT NULL DEFAULT 0,
            updated_at TEXT NOT NULL
          )
        ''');
      },
    );
    addTearDown(db.close);

    await db.insert(tableVehicles, {
      'id': 'v1',
      'name': 'Civic',
      'description': '',
      'mileage': 0,
      'updated_at': updatedAtEpoch,
    });

    await applyMigrations(db, 6, 7);

    final columns = await db.rawQuery('PRAGMA table_info($tableVehicles)');
    expect(
      columns.map((row) => row['name']),
      contains('documents_image'),
    );

    final rows =
        await db.query(tableVehicles, where: 'id = ?', whereArgs: ['v1']);
    expect(rows.first['documents_image'], isNull);
  });

  test('applyMigrations is a no-op for versions without an entry', () async {
    final db = await openInMemoryDatabase(
      version: 1,
      onCreate: (db, _) => createSchemaV1(db),
    );
    addTearDown(db.close);

    await expectLater(applyMigrations(db, 99, 100), completes);
  });
}
