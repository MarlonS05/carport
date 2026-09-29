import 'package:carport/db/database_helper.dart';
import 'package:carport/db/database_migrations.dart';
import 'package:carport/db/database_schema.dart';
import 'package:carport/repo/service_item_repository_impl.dart';
import 'package:carport/repo/vehicle_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/builders.dart';
import '../support/db.dart';

void main() {
  late DatabaseHelper dbHelper;
  late ServiceItemRepositoryImpl repository;
  late VehicleRepositoryImpl vehicleRepository;

  setUpAll(initFfiDatabaseFactory);

  setUp(() async {
    dbHelper = newInMemoryDatabaseHelper();
    repository = ServiceItemRepositoryImpl(dbHelper);
    vehicleRepository = VehicleRepositoryImpl(dbHelper);
    await vehicleRepository.create(buildVehicle(id: 'v1'));
  });

  tearDown(() async {
    await (await dbHelper.database).close();
  });

  Future<DateTime> readUpdatedAt(String id) async {
    final db = await dbHelper.database;
    final rows = await db.query(
      tableServiceItems,
      columns: ['updated_at'],
      where: 'id = ?',
      whereArgs: [id],
    );
    return DateTime.parse(rows.first['updated_at'] as String);
  }

  test('create generates an id and getById reads it back', () async {
    final id = await repository.create(
      buildServiceItem(id: '', vehicleId: 'v1', title: 'Oil'),
    );

    expect(id, isNotEmpty);
    final stored = await repository.getById(id);
    expect(stored!.title, 'Oil');
  });

  test('getByVehicleId returns items ordered by date descending', () async {
    await repository.create(
      buildServiceItem(id: 's1', vehicleId: 'v1', date: DateTime(2026, 1, 1)),
    );
    await repository.create(
      buildServiceItem(id: 's2', vehicleId: 'v1', date: DateTime(2026, 6, 1)),
    );
    await repository.create(
      buildServiceItem(id: 's3', vehicleId: 'v1', date: DateTime(2026, 3, 1)),
    );

    final ids =
        (await repository.getByVehicleId('v1')).map((i) => i.id).toList();
    expect(ids, ['s2', 's3', 's1']);
  });

  test('update persists changes', () async {
    await repository.create(
      buildServiceItem(id: 's1', vehicleId: 'v1', mileage: 100),
    );
    await repository.update(
      buildServiceItem(id: 's1', vehicleId: 'v1', title: 'New', mileage: 500),
    );

    final stored = await repository.getById('s1');
    expect(stored!.title, 'New');
    expect(stored.mileage, 500);
  });

  test('create and update set updated_at to a recent timestamp', () async {
    final epoch = DateTime.parse(updatedAtEpoch);

    await repository.create(
      buildServiceItem(id: 's1', vehicleId: 'v1', title: 'Oil'),
    );
    final createdAt = await readUpdatedAt('s1');
    expect(createdAt.isAfter(epoch), isTrue);

    await Future<void>.delayed(const Duration(milliseconds: 5));
    await repository.update(
      buildServiceItem(id: 's1', vehicleId: 'v1', title: 'Updated'),
    );

    final updatedAt = await readUpdatedAt('s1');
    expect(updatedAt.isAfter(createdAt), isTrue);
  });

  test('deleting a vehicle cascades to its service items', () async {
    await repository.create(buildServiceItem(id: 's1', vehicleId: 'v1'));
    expect(await repository.countAll(), 1);

    await vehicleRepository.delete('v1');

    expect(await repository.countAll(), 0);
    expect(await repository.getById('s1'), isNull);
  });
}
