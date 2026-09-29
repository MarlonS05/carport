import 'package:carport/domain/use_cases/get_garage_home_stats_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/garage/home/garage_home_event.dart';
import 'package:carport/screens/garage/home/garage_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageHomeBloc extends Bloc<GarageHomeEvent, GarageHomeState> {
  GarageHomeBloc({
    required GetGarageHomeStatsUseCase getGarageHomeStatsUseCase,
    required AppRouter router,
  })  : _getGarageHomeStatsUseCase = getGarageHomeStatsUseCase,
        _router = router,
        super(const GarageHomeState()) {
    on<GarageHomeEvent>(_onEvent);
  }

  final GetGarageHomeStatsUseCase _getGarageHomeStatsUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    GarageHomeEvent event,
    Emitter<GarageHomeState> emit,
  ) async {
    await event.map(
      started: (_) => _loadStats(emit),
      quickEntryTapped: (_) async => _router.push(AppRoutes.quickEntry),
      mpgTapped: (_) async => _router.push(AppRoutes.mpg),
      vehiclesTapped: (_) async => _router.push(AppRoutes.vehicles),
      remindersTapped: (_) async => _router.push(AppRoutes.reminders),
      settingsTapped: (_) async => _router.push(AppRoutes.settings),
    );
  }

  Future<void> _loadStats(Emitter<GarageHomeState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final stats = await _getGarageHomeStatsUseCase();

      emit(
        state.copyWith(
          vehicleCount: stats.vehicleCount,
          entryCount: stats.entryCount,
          isLoading: false,
        ),
      );
    } catch (e, st) {
      logger.e('Failed to load home stats', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load stats',
        ),
      );
    }
  }
}
