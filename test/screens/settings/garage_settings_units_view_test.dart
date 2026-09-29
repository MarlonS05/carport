import 'package:bloc_test/bloc_test.dart';
import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/screens/settings/units/garage_settings_units_bloc.dart';
import 'package:carport/screens/settings/units/garage_settings_units_event.dart';
import 'package:carport/screens/settings/units/garage_settings_units_state.dart';
import 'package:carport/screens/settings/units/garage_settings_units_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/widget.dart';

class MockGarageSettingsUnitsBloc extends MockBloc<GarageSettingsUnitsEvent,
    GarageSettingsUnitsState> implements GarageSettingsUnitsBloc {}

void main() {
  late MockGarageSettingsUnitsBloc bloc;

  setUp(() => bloc = MockGarageSettingsUnitsBloc());

  void seed(GarageSettingsUnitsState state) => whenListen(
        bloc,
        const Stream<GarageSettingsUnitsState>.empty(),
        initialState: state,
      );

  testWidgets('renders both distance unit options', (tester) async {
    seed(const GarageSettingsUnitsState(
      isLoading: false,
      selectedUnit: DistanceUnit.miles,
    ));

    await pumpView<GarageSettingsUnitsBloc>(
      tester,
      bloc: bloc,
      view: const GarageSettingsUnitsView(),
    );

    expect(find.text('Units'), findsOneWidget);
    expect(find.text('Miles'), findsOneWidget);
    expect(find.text('Kilometres'), findsOneWidget);
  });

  testWidgets('tapping Kilometres dispatches unitSelected', (tester) async {
    seed(const GarageSettingsUnitsState(
      isLoading: false,
      selectedUnit: DistanceUnit.miles,
    ));

    await pumpView<GarageSettingsUnitsBloc>(
      tester,
      bloc: bloc,
      view: const GarageSettingsUnitsView(),
    );
    await tester.tap(find.text('Kilometres'));

    verify(
      () => bloc.add(
        const GarageSettingsUnitsEvent.unitSelected(DistanceUnit.kilometres),
      ),
    ).called(1);
  });
}
