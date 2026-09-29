import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/entities/vehicle.dart';
import 'package:carport/domain/formatters/garage_mileage_formatter.dart';
import 'package:carport/screens/components/garage/garage_empty_state.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_list_card.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/garage/mpg_select/mpg_select_bloc.dart';
import 'package:carport/screens/garage/mpg_select/mpg_select_event.dart';
import 'package:carport/screens/garage/mpg_select/mpg_select_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class MpgSelectView extends StatelessWidget {
  const MpgSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MpgSelectBloc, MpgSelectState>(
      listenWhen: (previous, current) =>
          current.errorMessage != null &&
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        showGarageErrorDialog(
          context,
          message: state.errorMessage!,
        );
      },
      builder: (context, state) {
        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Select Vehicle',
                onBack: () => context.read<MpgSelectBloc>().add(
                      const MpgSelectEvent.backTapped(),
                    ),
              ),
              Expanded(child: _Body(state: state)),
            ],
          ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final MpgSelectState state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.vehicles.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null && state.vehicles.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: GarageSpacing.screenH),
        child: Center(
          child: Text(
            state.errorMessage!,
            style: GarageTextStyles.body(
              GarageTheme.of(context),
              color: GarageTheme.of(context).destructive,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (state.vehicles.isEmpty) {
      return const GarageEmptyState(
        icon: LucideIcons.car,
        message: 'No vehicles yet. Add one in the Garage first.',
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        GarageSpacing.screenH,
        0,
        GarageSpacing.screenH,
        24,
      ),
      itemCount: state.vehicles.length + 1,
      separatorBuilder: (_, index) {
        if (index == 0) {
          return const Padding(
            padding: EdgeInsets.only(bottom: GarageSpacing.list),
          );
        }
        return const Padding(
          padding: EdgeInsets.only(top: GarageSpacing.list),
        );
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            'Which vehicle are you logging a fill-up for?',
            style: GarageTextStyles.fieldLabel(GarageTheme.of(context)),
          );
        }

        final vehicle = state.vehicles[index - 1];
        return GarageListCard(
          title: vehicle.name,
          subtitle: _mileageSubtitle(vehicle, state.distanceUnit),
          onTap: () => context.read<MpgSelectBloc>().add(
                MpgSelectEvent.vehicleTapped(vehicleId: vehicle.id),
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
