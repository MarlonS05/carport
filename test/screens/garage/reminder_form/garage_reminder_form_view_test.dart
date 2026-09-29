import 'package:bloc_test/bloc_test.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_bloc.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_event.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_state.dart';
import 'package:carport/screens/garage/reminder_form/garage_reminder_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/widget.dart';

class MockGarageReminderFormBloc
    extends MockBloc<GarageReminderFormEvent, GarageReminderFormState>
    implements GarageReminderFormBloc {}

void main() {
  late MockGarageReminderFormBloc bloc;

  setUp(() => bloc = MockGarageReminderFormBloc());

  void seed(GarageReminderFormState state) => whenListen(
        bloc,
        const Stream<GarageReminderFormState>.empty(),
        initialState: state,
      );

  testWidgets('shows a loading indicator while loading', (tester) async {
    seed(const GarageReminderFormState(isLoading: true));

    await pumpView<GarageReminderFormBloc>(
      tester,
      bloc: bloc,
      view: const GarageReminderFormView(),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders the add-mode form', (tester) async {
    seed(const GarageReminderFormState(isLoading: false));

    await pumpView<GarageReminderFormBloc>(
      tester,
      bloc: bloc,
      view: const GarageReminderFormView(),
    );

    expect(find.text('New Reminder'), findsOneWidget);
    expect(find.text('Add Reminder'), findsOneWidget);
  });

  testWidgets('renders the edit-mode form title', (tester) async {
    seed(const GarageReminderFormState(
      mode: GarageReminderFormMode.edit,
      reminderId: 'r1',
      isLoading: false,
    ));

    await pumpView<GarageReminderFormBloc>(
      tester,
      bloc: bloc,
      view: const GarageReminderFormView(),
    );

    expect(find.text('Edit Reminder'), findsOneWidget);
    expect(find.text('Save Changes'), findsOneWidget);
  });
}
