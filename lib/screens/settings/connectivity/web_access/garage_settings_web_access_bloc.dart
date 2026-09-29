import 'package:carport/domain/entities/web_portal_user.dart';
import 'package:carport/domain/services/portal_monitor_api_exception.dart';
import 'package:carport/domain/use_cases/get_portal_base_url_use_case.dart';
import 'package:carport/domain/use_cases/get_web_portal_users_use_case.dart';
import 'package:carport/domain/use_cases/set_web_portal_user_access_use_case.dart';
import 'package:carport/logger/logger.dart';
import 'package:carport/router/app_router.dart';
import 'package:carport/screens/settings/connectivity/web_access/garage_settings_web_access_event.dart';
import 'package:carport/screens/settings/connectivity/web_access/garage_settings_web_access_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GarageSettingsWebAccessBloc
    extends Bloc<GarageSettingsWebAccessEvent, GarageSettingsWebAccessState> {
  GarageSettingsWebAccessBloc({
    required GetPortalBaseUrlUseCase getPortalBaseUrlUseCase,
    required GetWebPortalUsersUseCase getWebPortalUsersUseCase,
    required SetWebPortalUserAccessUseCase setWebPortalUserAccessUseCase,
    required AppRouter router,
  })  : _getPortalBaseUrlUseCase = getPortalBaseUrlUseCase,
        _getWebPortalUsersUseCase = getWebPortalUsersUseCase,
        _setWebPortalUserAccessUseCase = setWebPortalUserAccessUseCase,
        _router = router,
        super(const GarageSettingsWebAccessState()) {
    on<GarageSettingsWebAccessEvent>(_onEvent);
  }

  final GetPortalBaseUrlUseCase _getPortalBaseUrlUseCase;
  final GetWebPortalUsersUseCase _getWebPortalUsersUseCase;
  final SetWebPortalUserAccessUseCase _setWebPortalUserAccessUseCase;
  final AppRouter _router;

  Future<void> _onEvent(
    GarageSettingsWebAccessEvent event,
    Emitter<GarageSettingsWebAccessState> emit,
  ) async {
    await event.map(
      started: (_) => _load(emit),
      userAccessToggled: (event) => _toggleAccess(
        emit,
        userId: event.userId,
        enabled: event.enabled,
      ),
      backTapped: (_) async {
        if (state.savingUserIds.isEmpty) {
          _router.pop();
        }
      },
    );
  }

  Future<void> _load(Emitter<GarageSettingsWebAccessState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final baseUrl = await _getPortalBaseUrlUseCase();
      final isConnected = baseUrl != null;
      final users =
          isConnected ? await _getWebPortalUsersUseCase() : const <WebPortalUser>[];
      emit(
        state.copyWith(
          isLoading: false,
          isConnected: isConnected,
          users: users,
        ),
      );
    } catch (e, st) {
      if (e is! PortalMonitorApiException) {
        logger.e('Failed to load web access settings', error: e, stackTrace: st);
      }
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Could not load web access settings: $e',
        ),
      );
    }
  }

  Future<void> _toggleAccess(
    Emitter<GarageSettingsWebAccessState> emit, {
    required int userId,
    required bool enabled,
  }) async {
    if (state.savingUserIds.contains(userId)) {
      return;
    }

    final previousUsers = state.users;
    final optimisticUsers = previousUsers
        .map(
          (user) => user.id == userId
              ? user.copyWith(hasAccess: enabled)
              : user,
        )
        .toList();

    emit(
      state.copyWith(
        users: optimisticUsers,
        savingUserIds: {...state.savingUserIds, userId},
        errorMessage: null,
      ),
    );

    final updatedSaving = Set<int>.from(state.savingUserIds)..remove(userId);

    try {
      await _setWebPortalUserAccessUseCase(userId: userId, enabled: enabled);
      emit(state.copyWith(savingUserIds: updatedSaving));
    } on PortalMonitorApiException catch (_) {
      emit(
        state.copyWith(
          users: previousUsers,
          savingUserIds: updatedSaving,
          errorMessage: 'Could not update web user access.',
        ),
      );
    } catch (e, st) {
      logger.e('Failed to update web user access', error: e, stackTrace: st);
      emit(
        state.copyWith(
          users: previousUsers,
          savingUserIds: updatedSaving,
          errorMessage: 'Could not update web user access: $e',
        ),
      );
    }
  }
}
