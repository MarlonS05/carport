import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/domain/services/reminder_notification_scheduler.dart';
import 'package:carport/domain/use_cases/create_or_update_reminder_use_case.dart';
import 'package:carport/domain/use_cases/use_case_validation_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/builders.dart';
import '../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late MockReminderRepository repository;
  late MockReminderNotificationScheduler scheduler;
  late CreateOrUpdateReminderUseCase useCase;

  setUp(() {
    repository = MockReminderRepository();
    scheduler = MockReminderNotificationScheduler();
    useCase = CreateOrUpdateReminderUseCase(
      reminderRepository: repository,
      notificationScheduler: scheduler,
    );

    when(() => scheduler.cancel(any())).thenAnswer((_) async {});
    when(() => scheduler.schedule(any())).thenAnswer(
      (_) async => const ReminderScheduleResult(scheduled: true),
    );
  });

  test('blank name throws a field validation exception', () async {
    expect(
      () => useCase(buildReminder(name: '   ')),
      throwsA(
        isA<UseCaseValidationException>().having(
          (e) => e.fieldErrors['name'],
          'name error',
          'Name is required',
        ),
      ),
    );
  });

  test('create path inserts, does not cancel, and schedules', () async {
    final input = buildReminder(id: '', name: '  Renew  ', body: '  note ');
    when(() => repository.create(any())).thenAnswer((_) async => 'new-id');
    when(() => repository.getById('new-id')).thenAnswer(
      (_) async => buildReminder(id: 'new-id', name: 'Renew', body: 'note'),
    );

    final outcome = await useCase(input);

    expect(outcome.id, 'new-id');
    expect(outcome.notificationPermissionDenied, isFalse);
    final created = verify(() => repository.create(captureAny())).captured.single
        as Reminder;
    expect(created.name, 'Renew');
    expect(created.body, 'note');
    verifyNever(() => scheduler.cancel(any()));
    verify(() => scheduler.schedule(any())).called(1);
  });

  test('update path cancels existing notification before updating', () async {
    final input = buildReminder(id: 'r1', name: 'Renew');
    when(() => repository.update(any())).thenAnswer((_) async {});
    when(() => repository.getById('r1'))
        .thenAnswer((_) async => buildReminder(id: 'r1', name: 'Renew'));

    final outcome = await useCase(input);

    expect(outcome.id, 'r1');
    verifyInOrder([
      () => scheduler.cancel('r1'),
      () => repository.update(any()),
      () => scheduler.schedule(any()),
    ]);
    verifyNever(() => repository.create(any()));
  });

  test('propagates permissionDenied from the schedule result', () async {
    final input = buildReminder(id: 'r1');
    when(() => repository.update(any())).thenAnswer((_) async {});
    when(() => repository.getById('r1'))
        .thenAnswer((_) async => buildReminder(id: 'r1'));
    when(() => scheduler.schedule(any())).thenAnswer(
      (_) async =>
          const ReminderScheduleResult(scheduled: false, permissionDenied: true),
    );

    final outcome = await useCase(input);

    expect(outcome.notificationPermissionDenied, isTrue);
  });

  test('throws StateError when the reminder is missing after save', () async {
    final input = buildReminder(id: '');
    when(() => repository.create(any())).thenAnswer((_) async => 'new-id');
    when(() => repository.getById('new-id')).thenAnswer((_) async => null);

    expect(() => useCase(input), throwsStateError);
  });
}
