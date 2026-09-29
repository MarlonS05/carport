import 'package:bloc_test/bloc_test.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_bloc.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_event.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_state.dart';
import 'package:carport/screens/garage/add_vehicle/add_vehicle_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/widget.dart';

class MockAddVehicleBloc extends MockBloc<AddVehicleEvent, AddVehicleState>
    implements AddVehicleBloc {}

void main() {
  late MockAddVehicleBloc bloc;

  setUp(() => bloc = MockAddVehicleBloc());

  void seed(AddVehicleState state) => whenListen(
        bloc,
        const Stream<AddVehicleState>.empty(),
        initialState: state,
      );

  testWidgets('renders the form title and submit button', (tester) async {
    seed(const AddVehicleState());

    await pumpView<AddVehicleBloc>(
      tester,
      bloc: bloc,
      view: const AddVehicleView(),
    );

    expect(find.text('Add Vehicle'), findsOneWidget);
    expect(find.text('Add to Garage'), findsOneWidget);
  });

  testWidgets('shows the name validation error', (tester) async {
    seed(const AddVehicleState(nameError: 'Name is required'));

    await pumpView<AddVehicleBloc>(
      tester,
      bloc: bloc,
      view: const AddVehicleView(),
    );

    expect(find.text('Name is required'), findsOneWidget);
  });
}
