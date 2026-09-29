import 'package:carport/db/database_helper.dart';
import 'package:carport/domain/entities/reminder_repeat_frequency.dart';
import 'package:carport/repo/reminder_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/builders.dart';
import '../support/db.dart';

void main() {
  late DatabaseHelper dbHelper;
  late ReminderRepositoryImpl repository;

  setUpAll(initFfiDatabaseFactory);

  setUp(() async {
    dbHelper = newInMemoryDatabaseHelper();
    repository = ReminderRepositoryImpl(dbHelper);
  });

  tearDown(() async {
    await (await dbHelper.database).close();
  });

  test('create generates an id and preserves repeat frequency', () async {
    final id = await repository.create(
      buildReminder(
        id: '',
        name: 'Registration',
        repeatFrequency: ReminderRepeatFrequency.yearly,
      ),
    );

    expect(id, isNotEmpty);
    final stored = await repository.getById(id);
    expect(stored!.name, 'Registration');
    expect(stored.repeatFrequency, ReminderRepeatFrequency.yearly);
  });

  test('listAll returns reminders ordered by due date ascending', () async {
    await repository.create(
      buildReminder(id: 'r1', dueAt: DateTime(2026, 6, 1, 9)),
    );
    await repository.create(
      buildReminder(id: 'r2', dueAt: DateTime(2026, 1, 1, 9)),
    );
    await repository.create(
      buildReminder(id: 'r3', dueAt: DateTime(2026, 3, 1, 9)),
    );

    final ids = (await repository.listAll()).map((r) => r.id).toList();
    expect(ids, ['r2', 'r3', 'r1']);
  });

  test('update and delete work', () async {
    await repository.create(buildReminder(id: 'r1', name: 'Old'));
    await repository.update(buildReminder(id: 'r1', name: 'Updated'));
    expect((await repository.getById('r1'))!.name, 'Updated');

    await repository.delete('r1');
    expect(await repository.getById('r1'), isNull);
  });
}
