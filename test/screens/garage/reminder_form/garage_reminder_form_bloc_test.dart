import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/use_cases/create_or_update_reminder_use_case.dart';
import 'package:carport/domain/use_cases/use_case_validation_exception.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_bloc.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_event.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/builders.dart';
import '../../../support/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late MockReminderRepository repository;
  late MockCreateOrUpdateReminderUseCase saveReminder;
  late MockAppRouter router;

  setUp(() {
    repository = MockReminderRepository();
    saveReminder = MockCreateOrUpdateReminderUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
  });

  GarageReminderFormBloc build() => GarageReminderFormBloc(
        reminderRepository: repository,
        createOrUpdateReminderUseCase: saveReminder,
        router: router,
      );

  final reminder = buildReminder(id: 'r1');

  blocTest<GarageReminderFormBloc, GarageReminderFormState>(
    'started without an id enters add mode',
    build: build,
    act: (bloc) => bloc.add(const GarageReminderFormEvent.started()),
    expect: () => [
      const GarageReminderFormState(isLoading: false),
    ],
  );

  blocTest<GarageReminderFormBloc, GarageReminderFormState>(
    'started with an id loads the reminder in edit mode',
    setUp: () =>
        when(() => repository.getById('r1')).thenAnswer((_) async => reminder),
    build: build,
    act: (bloc) =>
        bloc.add(const GarageReminderFormEvent.started(reminderId: 'r1')),
    expect: () => [
      const GarageReminderFormState(
        mode: GarageReminderFormMode.edit,
        reminderId: 'r1',
        isLoading: true,
      ),
      GarageReminderFormState(
        mode: GarageReminderFormMode.edit,
        reminderId: 'r1',
        reminder: reminder,
        isLoading: false,
      ),
    ],
  );

  blocTest<GarageReminderFormBloc, GarageReminderFormState>(
    'started reports when the reminder is not found',
    setUp: () =>
        when(() => repository.getById('missing')).thenAnswer((_) async => null),
    build: build,
    act: (bloc) =>
        bloc.add(const GarageReminderFormEvent.started(reminderId: 'missing')),
    expect: () => [
      const GarageReminderFormState(
        mode: GarageReminderFormMode.edit,
        reminderId: 'missing',
        isLoading: true,
      ),
      const GarageReminderFormState(
        mode: GarageReminderFormMode.edit,
        reminderId: 'missing',
        isLoading: false,
        errorMessage: 'Reminder not found',
      ),
    ],
  );

  blocTest<GarageReminderFormBloc, GarageReminderFormState>(
    'saveTapped submits and pops on success',
    setUp: () => when(() => saveReminder(any())).thenAnswer(
      (_) async => const ReminderSaveOutcome(id: 'r1'),
    ),
    build: build,
    seed: () => const GarageReminderFormState(isLoading: false),
    act: (bloc) => bloc.add(
      GarageReminderFormEvent.saveTapped(
        name: 'Renew',
        body: 'note',
        dueAt: DateTime(2026, 6, 1, 9, 30),
      ),
    ),
    expect: () => [
      const GarageReminderFormState(isLoading: false, isSubmitting: true),
    ],
    verify: (_) => verify(() => router.pop()).called(1),
  );

  blocTest<GarageReminderFormBloc, GarageReminderFormState>(
    'saveTapped surfaces a warning when notifications are denied',
    setUp: () => when(() => saveReminder(any())).thenAnswer(
      (_) async => const ReminderSaveOutcome(
        id: 'r1',
        notificationPermissionDenied: true,
      ),
    ),
    build: build,
    seed: () => const GarageReminderFormState(isLoading: false),
    act: (bloc) => bloc.add(
      GarageReminderFormEvent.saveTapped(
        name: 'Renew',
        body: '',
        dueAt: DateTime(2026, 6, 1, 9, 30),
      ),
    ),
    expect: () => [
      const GarageReminderFormState(isLoading: false, isSubmitting: true),
      isA<GarageReminderFormState>()
          .having((s) => s.warningMessage, 'warningMessage', isNotNull),
    ],
  );

  blocTest<GarageReminderFormBloc, GarageReminderFormState>(
    'saveTapped maps validation errors to field errors',
    setUp: () => when(() => saveReminder(any())).thenThrow(
      const UseCaseValidationException({'name': 'Name is required'}),
    ),
    build: build,
    seed: () => const GarageReminderFormState(isLoading: false),
    act: (bloc) => bloc.add(
      GarageReminderFormEvent.saveTapped(
        name: '',
        body: '',
        dueAt: DateTime(2026, 6, 1, 9, 30),
      ),
    ),
    expect: () => [
      const GarageReminderFormState(isLoading: false, isSubmitting: true),
      const GarageReminderFormState(
        isLoading: false,
        isSubmitting: false,
        fieldErrors: {'name': 'Name is required'},
      ),
    ],
  );
}
