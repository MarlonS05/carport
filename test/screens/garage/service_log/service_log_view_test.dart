import 'package:bloc_test/bloc_test.dart';
import 'package:carport/screens/garage/service_log/service_log_bloc.dart';
import 'package:carport/screens/garage/service_log/service_log_event.dart';
import 'package:carport/screens/garage/service_log/service_log_state.dart';
import 'package:carport/screens/garage/service_log/service_log_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/builders.dart';
import '../../../support/widget.dart';

class MockServiceLogBloc
    extends MockBloc<ServiceLogEvent, ServiceLogState>
    implements ServiceLogBloc {}

void main() {
  late MockServiceLogBloc bloc;

  setUp(() => bloc = MockServiceLogBloc());

  void seed(ServiceLogState state) => whenListen(
        bloc,
        const Stream<ServiceLogState>.empty(),
        initialState: state,
      );

  testWidgets('shows a loading indicator before the vehicle loads',
      (tester) async {
    seed(const ServiceLogState(isLoading: true));

    await pumpView<ServiceLogBloc>(
      tester,
      bloc: bloc,
      view: const ServiceLogView(),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders entries for the loaded vehicle', (tester) async {
    seed(ServiceLogState(
      isLoading: false,
      vehicle: buildVehicle(id: 'v1', name: 'Civic'),
      entries: [buildServiceItem(id: 's1', vehicleId: 'v1', title: 'Oil change')],
    ));

    await pumpView<ServiceLogBloc>(
      tester,
      bloc: bloc,
      view: const ServiceLogView(),
    );

    expect(find.text('Civic'), findsOneWidget);
    expect(find.text('Oil change'), findsOneWidget);
  });

  testWidgets('shows an empty message when there are no entries',
      (tester) async {
    seed(ServiceLogState(
      isLoading: false,
      vehicle: buildVehicle(id: 'v1', name: 'Civic'),
    ));

    await pumpView<ServiceLogBloc>(
      tester,
      bloc: bloc,
      view: const ServiceLogView(),
    );

    expect(find.text('NO ENTRIES YET'), findsOneWidget);
  });
}
