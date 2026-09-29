import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/reminder.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_bloc.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_event.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/builders.dart';
import '../../../support/mocks.dart';

void main() {
  late MockReminderRepository repository;
  late MockDeleteReminderUseCase deleteReminder;
  late MockAppRouter router;

  setUp(() {
    repository = MockReminderRepository();
    deleteReminder = MockDeleteReminderUseCase();
    router = MockAppRouter();
    stubRouterPush(router);
  });

  GarageRemindersBloc build() => GarageRemindersBloc(
        reminderRepository: repository,
        deleteReminderUseCase: deleteReminder,
        router: router,
      );

  final reminders = [buildReminder(id: 'r1'), buildReminder(id: 'r2')];

  blocTest<GarageRemindersBloc, GarageRemindersState>(
    'started loads reminders',
    setUp: () =>
        when(() => repository.listAll()).thenAnswer((_) async => reminders),
    build: build,
    act: (bloc) => bloc.add(const GarageRemindersEvent.started()),
    expect: () => [
      const GarageRemindersState(isLoading: true),
      GarageRemindersState(isLoading: false, reminders: reminders),
    ],
  );

  blocTest<GarageRemindersBloc, GarageRemindersState>(
    'started surfaces an error message on failure',
    setUp: () => when(() => repository.listAll()).thenThrow(Exception('x')),
    build: build,
    act: (bloc) => bloc.add(const GarageRemindersEvent.started()),
    expect: () => [
      const GarageRemindersState(isLoading: true),
      const GarageRemindersState(
        isLoading: false,
        errorMessage: 'Could not load reminders',
      ),
    ],
  );

  blocTest<GarageRemindersBloc, GarageRemindersState>(
    'addTapped pushes the add route then reloads',
    setUp: () =>
        when(() => repository.listAll()).thenAnswer((_) async => <Reminder>[]),
    build: build,
    act: (bloc) => bloc.add(const GarageRemindersEvent.addTapped()),
    verify: (_) {
      verify(() => router.push(AppRoutes.addReminder)).called(1);
      verify(() => repository.listAll()).called(1);
    },
  );

  blocTest<GarageRemindersBloc, GarageRemindersState>(
    'deleteTapped deletes then reloads',
    setUp: () {
      when(() => deleteReminder(any())).thenAnswer((_) async {});
      when(() => repository.listAll())
          .thenAnswer((_) async => [buildReminder(id: 'r2')]);
    },
    build: build,
    seed: () => GarageRemindersState(isLoading: false, reminders: reminders),
    act: (bloc) =>
        bloc.add(const GarageRemindersEvent.deleteTapped(reminderId: 'r1')),
    verify: (_) {
      verify(() => deleteReminder('r1')).called(1);
      verify(() => repository.listAll()).called(1);
    },
  );

  blocTest<GarageRemindersBloc, GarageRemindersState>(
    'deleteTapped surfaces an error when deletion fails',
    setUp: () =>
        when(() => deleteReminder(any())).thenThrow(Exception('nope')),
    build: build,
    seed: () => GarageRemindersState(isLoading: false, reminders: reminders),
    act: (bloc) =>
        bloc.add(const GarageRemindersEvent.deleteTapped(reminderId: 'r1')),
    expect: () => [
      GarageRemindersState(
        isLoading: false,
        reminders: reminders,
        errorMessage: 'Could not delete reminder',
      ),
    ],
  );
}
