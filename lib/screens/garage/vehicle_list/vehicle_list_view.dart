import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/formatters/garage_mileage_formatter.dart';
import 'package:carport/screens/components/garage/garage_empty_state.dart';
import 'package:carport/screens/components/garage/garage_fab.dart';
import 'package:carport/screens/components/garage/garage_list_card.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_bloc.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_event.dart';
import 'package:carport/screens/garage/vehicle_list/vehicle_list_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class VehicleListView extends StatelessWidget {
  const VehicleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GarageShell(
      floatingActionButton: GarageFab(
        onPressed: () => context.read<VehicleListBloc>().add(
              const VehicleListEvent.addVehicleTapped(),
            ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GarageTopBar(
            title: 'Garage',
            onBack: () => context.read<VehicleListBloc>().add(
                  const VehicleListEvent.backTapped(),
                ),
          ),
          Expanded(
            child: BlocBuilder<VehicleListBloc, VehicleListState>(
              builder: (context, state) => _Body(state: state),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final VehicleListState state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.vehicles.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null && state.vehicles.isEmpty) {
      return GarageEmptyState(
        icon: LucideIcons.car,
        message: state.errorMessage!,
      );
    }

    if (state.vehicles.isEmpty) {
      return const GarageEmptyState(
        icon: LucideIcons.car,
        message: 'No vehicles yet. Add your first one.',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        GarageSpacing.screenH,
        0,
        GarageSpacing.screenH,
        96,
      ),
      itemCount: state.vehicles.length,
      separatorBuilder: (_, _) => const Padding(
        padding: EdgeInsets.only(top: GarageSpacing.list),
      ),
      itemBuilder: (context, index) {
        final vehicle = state.vehicles[index];
        return GarageListCard(
          title: vehicle.name,
          subtitle: _mileageSubtitle(vehicle, state.distanceUnit),
          titleSize: 18,
          onTap: () => context.read<VehicleListBloc>().add(
                VehicleListEvent.vehicleTapped(vehicleId: vehicle.id),
              ),
        );
      },
    );
  }

  String? _mileageSubtitle(Vehicle vehicle, DistanceUnit unit) {
    if (vehicle.mileage <= 0) return null;
    return GarageMileageFormatter.formatDisplay(vehicle.mileage, unit: unit);
  }
}
