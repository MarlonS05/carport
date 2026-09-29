import 'package:carport/domain/entities/notification_permission_status.dart';
import 'package:carport/domain/services/reminder_notification_scheduler.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_event.dart';
import 'package:carport/screens/settings/permissions/garage_settings_permissions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageSettingsPermissionsBloc extends Bloc<GarageSettingsPermissionsEvent,
    GarageSettingsPermissionsState> {
  GarageSettingsPermissionsBloc({
    required ReminderNotificationScheduler notificationScheduler,
    required AppRouter router,
  })  : _notificationScheduler = notificationScheduler,
        _router = router,
        super(const GarageSettingsPermissionsState()) {
    on<GarageSettingsPermissionsEvent>(_onEvent);
  }

  final ReminderNotificationScheduler _notificationScheduler;
  final AppRouter _router;

  Future<void> _onEvent(
    GarageSettingsPermissionsEvent event,
    Emitter<GarageSettingsPermissionsState> emit,
  ) async {
    await event.map(
      started: (_) => _refreshStatus(emit),
      permissionTapped: (_) => _handlePermissionTap(emit),
      backTapped: (_) async {
        if (!state.isRequesting) _router.pop();
      },
    );
  }

  Future<void> _refreshStatus(
    Emitter<GarageSettingsPermissionsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final status = await _notificationScheduler.getPermissionStatus();
      emit(state.copyWith(isLoading: false, permissionStatus: status));
    } catch (e, st) {
      logger.e('Failed to read notification permission', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not read notification permission: $e',
        ),
      );
    }
  }

  Future<void> _handlePermissionTap(
    Emitter<GarageSettingsPermissionsState> emit,
  ) async {
    if (state.isRequesting ||
        state.permissionStatus == NotificationPermissionStatus.granted ||
        state.permissionStatus == NotificationPermissionStatus.unsupported) {
      return;
    }

    emit(state.copyWith(isRequesting: true, errorMessage: null));
    try {
      await _notificationScheduler.requestPermissions();
      final status = await _notificationScheduler.getPermissionStatus();
      if (status != NotificationPermissionStatus.granted) {
        await _notificationScheduler.openAppSettings();
        final refreshed = await _notificationScheduler.getPermissionStatus();
        emit(
          state.copyWith(
            isRequesting: false,
            permissionStatus: refreshed,
          ),
        );
        return;
      }
      emit(state.copyWith(isRequesting: false, permissionStatus: status));
    } catch (e, st) {
      logger.e('Failed to request notification permission', error: e, stackTrace: st);
      emit(
        state.copyWith(
          isRequesting: false,
          errorMessage: 'Could not request notification permission: $e',
        ),
      );
    }
  }
}
