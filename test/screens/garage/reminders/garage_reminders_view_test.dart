import 'package:bloc_test/bloc_test.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_bloc.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_event.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_state.dart';
import 'package:carport/screens/garage/reminders/garage_reminders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/builders.dart';
import '../../../support/widget.dart';

class MockGarageRemindersBloc
    extends MockBloc<GarageRemindersEvent, GarageRemindersState>
    implements GarageRemindersBloc {}

void main() {
  late MockGarageRemindersBloc bloc;

  setUp(() => bloc = MockGarageRemindersBloc());

  void seed(GarageRemindersState state) => whenListen(
        bloc,
        const Stream<GarageRemindersState>.empty(),
        initialState: state,
      );

  testWidgets('shows a loading indicator while loading', (tester) async {
    seed(const GarageRemindersState(isLoading: true));

    await pumpView<GarageRemindersBloc>(
      tester,
      bloc: bloc,
      view: const GarageRemindersView(),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders reminder names when loaded', (tester) async {
    seed(GarageRemindersState(
      isLoading: false,
      reminders: [buildReminder(id: 'r1', name: 'Registration')],
    ));

    await pumpView<GarageRemindersBloc>(
      tester,
      bloc: bloc,
      view: const GarageRemindersView(),
    );

    expect(find.text('Registration'), findsOneWidget);
  });

  testWidgets('shows an empty message when there are no reminders',
      (tester) async {
    seed(const GarageRemindersState(isLoading: false));

    await pumpView<GarageRemindersBloc>(
      tester,
      bloc: bloc,
      view: const GarageRemindersView(),
    );

    expect(find.text('NO REMINDERS YET'), findsOneWidget);
  });
}
