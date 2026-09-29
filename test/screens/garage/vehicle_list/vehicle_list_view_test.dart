import 'package:bloc_test/bloc_test.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_bloc.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_event.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_state.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/builders.dart';
import '../../../support/widget.dart';

class MockVehicleListBloc
    extends MockBloc<VehicleListEvent, VehicleListState>
    implements VehicleListBloc {}

void main() {
  late MockVehicleListBloc bloc;

  setUp(() => bloc = MockVehicleListBloc());

  void seed(VehicleListState state) => whenListen(
        bloc,
        const Stream<VehicleListState>.empty(),
        initialState: state,
      );

  testWidgets('shows a loading indicator while loading', (tester) async {
    seed(const VehicleListState(isLoading: true));

    await pumpView<VehicleListBloc>(
      tester,
      bloc: bloc,
      view: const VehicleListView(),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders vehicle names when loaded', (tester) async {
    seed(VehicleListState(
      isLoading: false,
      vehicles: [
        buildVehicle(id: 'v1', name: 'Civic', mileage: 1000),
        buildVehicle(id: 'v2', name: 'Model 3', mileage: 0),
      ],
    ));

    await pumpView<VehicleListBloc>(
      tester,
      bloc: bloc,
      view: const VehicleListView(),
    );

    expect(find.text('Civic'), findsOneWidget);
    expect(find.text('Model 3'), findsOneWidget);
  });

  testWidgets('shows an empty message when there are no vehicles',
      (tester) async {
    seed(const VehicleListState(isLoading: false));

    await pumpView<VehicleListBloc>(
      tester,
      bloc: bloc,
      view: const VehicleListView(),
    );

    expect(find.text('NO VEHICLES YET. ADD YOUR FIRST ONE.'), findsOneWidget);
  });
}
