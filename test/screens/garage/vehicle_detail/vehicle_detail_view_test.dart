import 'package:bloc_test/bloc_test.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_bloc.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_event.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_state.dart';
import 'package:carport/screens/garage/vehicle_detail/vehicle_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/builders.dart';
import '../../../support/widget.dart';

class MockVehicleDetailBloc
    extends MockBloc<VehicleDetailEvent, VehicleDetailState>
    implements VehicleDetailBloc {}

void main() {
  late MockVehicleDetailBloc bloc;

  setUp(() => bloc = MockVehicleDetailBloc());

  void seed(VehicleDetailState state) => whenListen(
        bloc,
        const Stream<VehicleDetailState>.empty(),
        initialState: state,
      );

  testWidgets('shows a loading indicator before the vehicle loads',
      (tester) async {
    seed(const VehicleDetailState(isLoading: true));

    await pumpView<VehicleDetailBloc>(
      tester,
      bloc: bloc,
      view: const VehicleDetailView(),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders the vehicle name and maintenance schedule when loaded',
      (tester) async {
    seed(VehicleDetailState(
      isLoading: false,
      vehicle: buildVehicle(id: 'v1', name: 'Civic', description: 'daily'),
    ));

    await pumpView<VehicleDetailBloc>(
      tester,
      bloc: bloc,
      view: const VehicleDetailView(),
    );

    expect(find.text('Civic'), findsOneWidget);
    expect(find.text('MAINTENANCE SCHEDULE'), findsOneWidget);
    expect(find.bySemanticsLabel('Vehicle documents'), findsOneWidget);
  });

  testWidgets('shows the empty state when the vehicle is missing',
      (tester) async {
    seed(const VehicleDetailState(
      isLoading: false,
      errorMessage: 'Could not load vehicle',
    ));

    await pumpView<VehicleDetailBloc>(
      tester,
      bloc: bloc,
      view: const VehicleDetailView(),
    );

    expect(find.text('COULD NOT LOAD VEHICLE'), findsOneWidget);
  });
}
