import 'package:carport/screens/components/garage/garage_dashboard_hero.dart';
import 'package:carport/screens/components/garage/garage_dashboard_tile.dart';
import 'package:carport/screens/components/garage/garage_footer_stats.dart';
import 'package:carport/screens/components/garage/garage_shell.dart';
import 'package:carport/screens/garage/home/garage_home_bloc.dart';
import 'package:carport/screens/garage/home/garage_home_event.dart';
import 'package:carport/screens/garage/home/garage_home_state.dart';
import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class GarageHomeView extends StatelessWidget {
  const GarageHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GarageShell(
      child: BlocBuilder<GarageHomeBloc, GarageHomeState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const GarageDashboardHero(
                eyebrow: 'Dashboard',
                titleLine1: 'Garage',
                titleLine2: 'Log',
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: GarageSpacing.screenH,
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: GarageSpacing.grid,
                    crossAxisSpacing: GarageSpacing.grid,
                    childAspectRatio: 1.05,
                    children: [
                      GarageDashboardTile(
                        accent: GarageDashboardTileAccent.primary,
                        icon: LucideIcons.wrench,
                        title: 'Quick Entry',
                        subtitle: 'Log a service',
                        onTap: () => context.read<GarageHomeBloc>().add(
                              const GarageHomeEvent.quickEntryTapped(),
                            ),
                      ),
                      GarageDashboardTile(
                        accent: GarageDashboardTileAccent.success,
                        icon: LucideIcons.fuel,
                        title: 'MPG',
                        subtitle: 'Log a fill-up',
                        onTap: () => context.read<GarageHomeBloc>().add(
                              const GarageHomeEvent.mpgTapped(),
                            ),
                      ),
                      GarageDashboardTile(
                        accent: GarageDashboardTileAccent.none,
                        icon: LucideIcons.car,
                        title: 'Garage',
                        subtitle: 'Your vehicles',
                        onTap: () => context.read<GarageHomeBloc>().add(
                              const GarageHomeEvent.vehiclesTapped(),
                            ),
                      ),
                      GarageDashboardTile(
                        accent: GarageDashboardTileAccent.none,
                        icon: LucideIcons.bell,
                        title: 'Reminders',
                        subtitle: 'Upcoming service',
                        onTap: () => context.read<GarageHomeBloc>().add(
                              const GarageHomeEvent.remindersTapped(),
                            ),
                      ),
                      GarageDashboardTile(
                        accent: GarageDashboardTileAccent.none,
                        icon: LucideIcons.settings,
                        title: 'Settings',
                        subtitle: 'Preferences',
                        onTap: () => context.read<GarageHomeBloc>().add(
                              const GarageHomeEvent.settingsTapped(),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              GarageFooterStats(
                text: _footerText(state),
              ),
            ],
          );
        },
      ),
    );
  }

  String _footerText(GarageHomeState state) {
    if (state.isLoading) {
      return 'Loading…';
    }
    if (state.errorMessage != null) {
      return state.errorMessage!;
    }
    final vehicleLabel = state.vehicleCount == 1 ? 'vehicle' : 'vehicles';
    final entryLabel = state.entryCount == 1 ? 'log entry' : 'log entries';
    return '${state.vehicleCount} $vehicleLabel · ${state.entryCount} $entryLabel';
  }
}
