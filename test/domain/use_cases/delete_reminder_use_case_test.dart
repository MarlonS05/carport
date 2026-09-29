import 'package:carport/domain/use_cases/delete_reminder_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/mocks.dart';

void main() {
  test('cancels the notification before deleting the reminder', () async {
    final repository = MockReminderRepository();
    final scheduler = MockReminderNotificationScheduler();
    when(() => scheduler.cancel(any())).thenAnswer((_) async {});
    when(() => repository.delete(any())).thenAnswer((_) async {});
    final useCase = DeleteReminderUseCase(
      reminderRepository: repository,
      notificationScheduler: scheduler,
    );

    await useCase('r1');

    verifyInOrder([
      () => scheduler.cancel('r1'),
      () => repository.delete('r1'),
    ]);
  });
}
