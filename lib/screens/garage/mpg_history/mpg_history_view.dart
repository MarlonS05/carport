import 'package:carport/domain/entities/fuel_economy_period.dart';
import 'package:carport/domain/entities/fuel_economy_unit.dart';
import 'package:carport/domain/formatters/fuel_economy_calculator.dart';
import 'package:carport/screens/components/garage/garage_empty_state.dart';
import 'package:carport/screens/components/garage/garage_error_dialog.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/components/garage/garage_top_bar.dart';
import 'package:carport/screens/components/garage/garage_vehicle_chip.dart';
import 'package:carport/screens/garage/mpg_history/mpg_history_bloc.dart';
import 'package:carport/screens/garage/mpg_history/mpg_history_event.dart';
import 'package:carport/screens/garage/mpg_history/mpg_history_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class MpgHistoryView extends StatelessWidget {
  const MpgHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MpgHistoryBloc, MpgHistoryState>(
      listenWhen: (previous, current) =>
          current.errorMessage != null &&
          previous.errorMessage != current.errorMessage &&
          current.vehicle != null,
      listener: (context, state) {
        showGarageErrorDialog(context, message: state.errorMessage!);
      },
      builder: (context, state) {
        return GarageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GarageTopBar(
                title: 'MPG History',
                backEnabled: !state.isLoading,
                onBack: () => context.read<MpgHistoryBloc>().add(
                      const MpgHistoryEvent.backTapped(),
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

  final MpgHistoryState state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.vehicle == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final vehicle = state.vehicle;
    if (vehicle == null) {
      return _ErrorBody(message: state.errorMessage);
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        GarageSpacing.screenH,
        0,
        GarageSpacing.screenH,
        24,
      ),
      children: [
        GarageVehicleChip(vehicleName: vehicle.name),
        const Padding(
          padding: EdgeInsets.only(top: GarageSpacing.section),
          child: _UnitSwitch(),
        ),
        if (state.entries.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 48),
            child: GarageEmptyState(
              icon: LucideIcons.fuel,
              message: 'No fill-ups yet',
            ),
          )
        else ...[
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: Text(
              'BY MONTH',
              style: GarageTextStyles.fieldLabel(GarageTheme.of(context)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
            child: _MonthlyMpgBarChart(periods: state.monthlyPeriods),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.section),
            child: Text(
              'BY YEAR',
              style: GarageTextStyles.fieldLabel(GarageTheme.of(context)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
            child: _YearGrid(periods: state.yearlyPeriods),
          ),
        ],
      ],
    );
  }
}

class _UnitSwitch extends StatelessWidget {
  const _UnitSwitch();

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final selected = context.select((MpgHistoryBloc b) => b.state.unit);
    final radius = BorderRadius.circular(GarageRadius.input);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.secondary,
        borderRadius: radius,
        border: Border.all(color: theme.border),
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Row(
          children: [
            for (final unit in FuelEconomyUnit.values)
              Expanded(
                child: _UnitSwitchSegment(
                  label: unit.label,
                  selected: unit == selected,
                  onTap: () => context.read<MpgHistoryBloc>().add(
                        MpgHistoryEvent.unitChanged(unit: unit),
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _UnitSwitchSegment extends StatelessWidget {
  const _UnitSwitchSegment({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Material(
      color: selected ? theme.success : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: GarageTextStyles.fieldLabel(theme).copyWith(
              letterSpacing: 0,
              fontSize: 11,
              color: selected
                  ? theme.primaryForeground
                  : theme.mutedForeground,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _MonthlyMpgBarChart extends StatelessWidget {
  const _MonthlyMpgBarChart({required this.periods});

  final List<FuelEconomyPeriod> periods;

  static const _rowHeight = 40.0;
  static const _visibleRows = 6;
  static final _monthFormat = DateFormat('MMM yy');

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final maxValue = periods
        .map((p) => p.value ?? 0)
        .fold<double>(0, (a, b) => a > b ? a : b);

    final contentHeight = periods.length * (_rowHeight + GarageSpacing.list) -
        GarageSpacing.list;
    final viewportHeight =
        (_visibleRows * (_rowHeight + GarageSpacing.list)) - GarageSpacing.list;

    return SizedBox(
      height: contentHeight.clamp(0, viewportHeight).toDouble(),
      child: ListView.separated(
        itemCount: periods.length,
        separatorBuilder: (_, _) =>
            const SizedBox(height: GarageSpacing.list),
        itemBuilder: (context, index) {
          final period = periods[index];
          final label = _monthFormat.format(
            DateTime(period.year, period.month ?? 1),
          );

          return SizedBox(
            height: _rowHeight,
            child: Row(
              children: [
                SizedBox(
                  width: 64,
                  child: Text(
                    label,
                    style: GarageTextStyles.listMeta(theme),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final value = period.value;
                      final rawFraction = (value == null || maxValue <= 0)
                          ? 0.0
                          : (value / maxValue).clamp(0.0, 1.0);
                      final valueLabel = value == null
                          ? '—'
                          : FuelEconomyCalculator.formatValue(value);
                      // Keep enough width to place the label inside the bar.
                      const minBarForLabel = 44.0;
                      final barWidth = value == null
                          ? 0.0
                          : (constraints.maxWidth * rawFraction)
                              .clamp(minBarForLabel, constraints.maxWidth);

                      return Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: _rowHeight,
                            decoration: BoxDecoration(
                              color: theme.secondary,
                              borderRadius:
                                  BorderRadius.circular(GarageRadius.input),
                            ),
                          ),
                          AnimatedContainer(
                            duration: GarageMotion.standard,
                            width: barWidth,
                            height: _rowHeight,
                            decoration: BoxDecoration(
                              color: theme.success,
                              borderRadius:
                                  BorderRadius.circular(GarageRadius.input),
                            ),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              valueLabel,
                              style: GarageTextStyles.listMeta(theme).copyWith(
                                color: theme.primaryForeground,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _YearGrid extends StatelessWidget {
  const _YearGrid({required this.periods});

  final List<FuelEconomyPeriod> periods;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: periods.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: GarageSpacing.grid,
        crossAxisSpacing: GarageSpacing.grid,
        childAspectRatio: 1.05,
      ),
      itemBuilder: (context, index) {
        final period = periods[index];
        return _YearCell(period: period);
      },
    );
  }
}

class _YearCell extends StatelessWidget {
  const _YearCell({required this.period});

  final FuelEconomyPeriod period;

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);
    final valueLabel = period.value == null
        ? '—'
        : FuelEconomyCalculator.formatValue(period.value!);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: theme.success, width: 6),
          ),
          alignment: Alignment.center,
          child: Text(
            valueLabel,
            style: GarageTextStyles.tileTitle(theme),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
          child: Text(
            '${period.year}',
            style: GarageTextStyles.listMeta(theme),
          ),
        ),
      ],
    );
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
