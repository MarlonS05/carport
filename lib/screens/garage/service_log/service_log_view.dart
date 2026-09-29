import 'package:carport/domain/entities/distance_unit.dart';
import 'package:carport/domain/formatters/garage_mileage_formatter.dart';
import 'package:carport/screens/components/garage/garage_empty_state.dart';
import 'package:carport/screens/components/garage/garage_entry_card.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/components/garage/garage_vehicle_chip.dart';
import 'package:carport/screens/garage/service_log/service_log_bloc.dart';
import 'package:carport/screens/garage/service_log/service_log_event.dart';
import 'package:carport/screens/garage/service_log/service_log_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class ServiceLogView extends StatelessWidget {
  const ServiceLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceLogBloc, ServiceLogState>(
      listenWhen: (previous, current) =>
          current.errorMessage != null &&
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        showGarageErrorDialog(context, message: state.errorMessage!);
      },
      builder: (context, state) {
        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'Service Log',
                backEnabled: !state.isLoading,
                onBack: () => context.read<ServiceLogBloc>().add(
                  const ServiceLogEvent.backTapped(),
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

  final ServiceLogState state;

  static final _dateFormat = DateFormat('MMM d, y');

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.vehicle == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final vehicle = state.vehicle;
    if (vehicle == null) {
      return _ErrorBody(message: state.errorMessage);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state.errorMessage != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              GarageSpacing.screenH,
              0,
              GarageSpacing.screenH,
              GarageSpacing.list,
            ),
            child: Text(
              state.errorMessage!,
              style: GarageTextStyles.body(
                GarageTheme.of(context),
                color: GarageTheme.of(context).destructive,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            GarageSpacing.screenH,
            0,
            GarageSpacing.screenH,
            12,
          ),
          child: Row(
            children: [
              Expanded(child: GarageVehicleChip(vehicleName: vehicle.name)),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: _EntryCountBadge(count: state.entries.length),
              ),
            ],
          ),
        ),
        Expanded(
          child: state.entries.isEmpty
              ? const GarageEmptyState(
                  icon: LucideIcons.fileText,
                  message: 'No entries yet',
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    GarageSpacing.screenH,
                    0,
                    GarageSpacing.screenH,
                    24,
                  ),
                  itemCount: state.entries.length,
                  separatorBuilder: (_, _) => const Padding(
                    padding: EdgeInsets.only(top: GarageSpacing.list),
                  ),
                  itemBuilder: (context, index) {
                    final entry = state.entries[index];
                    return GarageEntryCard(
                      title: entry.title,
                      date: _formatDate(entry.date),
                      description: entry.description.isEmpty
                          ? null
                          : entry.description,
                      mileage: _formatMileage(
                        entry.mileage,
                        state.distanceUnit,
                      ),
                      onEdit: () => context.read<ServiceLogBloc>().add(
                        ServiceLogEvent.entryEditTapped(
                          serviceItemId: entry.id,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    if (date.millisecondsSinceEpoch == 0) return '—';
    return _dateFormat.format(date);
  }

  String? _formatMileage(double mileage, DistanceUnit unit) {
    if (mileage <= 0) return null;
    return GarageMileageFormatter.formatDisplay(mileage, unit: unit);
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GarageSpacing.screenH),
        child: Text(
          message ?? 'Something went wrong',
          style: GarageTextStyles.body(theme, color: theme.destructive),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _EntryCountBadge extends StatelessWidget {
  const _EntryCountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final label = count == 1 ? '1 entry' : '$count entries';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.secondary,
        borderRadius: BorderRadius.circular(GarageRadius.input),
        border: Border.all(color: theme.border),
      ),
      child: Text(label, style: GarageTextStyles.listMeta(theme)),
    );
  }
}
