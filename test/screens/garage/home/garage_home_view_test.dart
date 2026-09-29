import 'package:bloc_test/bloc_test.dart';
import 'package:carport/screens/garage/home/garage_home_bloc.dart';
import 'package:carport/screens/garage/home/garage_home_event.dart';
import 'package:carport/screens/garage/home/garage_home_state.dart';
import 'package:carport/screens/garage/home/garage_home_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/widget.dart';

class MockGarageHomeBloc
    extends MockBloc<GarageHomeEvent, GarageHomeState>
    implements GarageHomeBloc {}

void main() {
  late MockGarageHomeBloc bloc;

  setUp(() => bloc = MockGarageHomeBloc());

  void seed(GarageHomeState state) =>
      whenListen(bloc, const Stream<GarageHomeState>.empty(), initialState: state);

  testWidgets('renders the four dashboard tiles and footer stats',
      (tester) async {
    seed(const GarageHomeState(vehicleCount: 2, entryCount: 5));

    await pumpView<GarageHomeBloc>(tester, bloc: bloc, view: const GarageHomeView());

    expect(find.text('Quick Entry'), findsOneWidget);
    expect(find.text('Garage'), findsOneWidget);
    expect(find.text('Reminders'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('2 VEHICLES · 5 LOG ENTRIES'), findsOneWidget);
  });

  testWidgets('tapping Settings dispatches settingsTapped', (tester) async {
    seed(const GarageHomeState());

    await pumpView<GarageHomeBloc>(tester, bloc: bloc, view: const GarageHomeView());
    await tester.tap(find.text('Settings'));

    verify(() => bloc.add(const GarageHomeEvent.settingsTapped())).called(1);
  });
}
