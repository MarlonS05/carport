import 'package:carport/db/database_helper.dart';
import 'package:carport/db/database_migrations.dart';
import 'package:carport/db/database_schema.dart';
import 'package:carport/repo/vehicle_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/builders.dart';
import '../support/db.dart';

void main() {
  late DatabaseHelper dbHelper;
  late VehicleRepositoryImpl repository;

  setUpAll(initFfiDatabaseFactory);

  setUp(() async {
    dbHelper = newInMemoryDatabaseHelper();
    repository = VehicleRepositoryImpl(dbHelper);
  });

  tearDown(() async {
    await (await dbHelper.database).close();
  });

  Future<DateTime> readUpdatedAt(String id) async {
    final db = await dbHelper.database;
    final rows = await db.query(
      tableVehicles,
      columns: ['updated_at'],
      where: 'id = ?',
      whereArgs: [id],
    );
    return DateTime.parse(rows.first['updated_at'] as String);
  }

  test('create generates an id when none is provided', () async {
    final id = await repository.create(buildVehicle(id: '', name: 'Civic'));

    expect(id, isNotEmpty);
    final stored = await repository.getById(id);
    expect(stored, isNotNull);
    expect(stored!.name, 'Civic');
  });

  test('create keeps an explicit id', () async {
    final id = await repository.create(buildVehicle(id: 'fixed-id'));
    expect(id, 'fixed-id');
  });

  test('getAll returns vehicles sorted case-insensitively by name', () async {
    await repository.create(buildVehicle(id: '1', name: 'zeta'));
    await repository.create(buildVehicle(id: '2', name: 'Alpha'));
    await repository.create(buildVehicle(id: '3', name: 'beta'));

    final names = (await repository.getAll()).map((v) => v.name).toList();
    expect(names, ['Alpha', 'beta', 'zeta']);
  });

  test('update persists changes', () async {
    final id = await repository.create(buildVehicle(id: 'v1', mileage: 100));
    await repository.update(buildVehicle(id: id, name: 'Renamed', mileage: 250));

    final stored = await repository.getById(id);
    expect(stored!.name, 'Renamed');
    expect(stored.mileage, 250);
  });

  test('create and update set updated_at to a recent timestamp', () async {
    final epoch = DateTime.parse(updatedAtEpoch);

    final id = await repository.create(buildVehicle(id: 'v1'));
    final createdAt = await readUpdatedAt(id);
    expect(createdAt.isAfter(epoch), isTrue);

    await Future<void>.delayed(const Duration(milliseconds: 5));
    await repository.update(buildVehicle(id: id, name: 'Updated'));

    final updatedAt = await readUpdatedAt(id);
    expect(updatedAt.isAfter(createdAt), isTrue);
  });

  test('delete removes a vehicle and countAll tracks totals', () async {
    await repository.create(buildVehicle(id: 'v1'));
    await repository.create(buildVehicle(id: 'v2'));
    expect(await repository.countAll(), 2);

    await repository.delete('v1');

    expect(await repository.countAll(), 1);
    expect(await repository.getById('v1'), isNull);
  });
}
