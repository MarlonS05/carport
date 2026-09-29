import 'package:carport/domain/entities/web_portal_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_web_access_state.freezed.dart';

@freezed
abstract class GarageSettingsWebAccessState
    with _$GarageSettingsWebAccessState {
  const factory GarageSettingsWebAccessState({
    @Default(true) bool isLoading,
    @Default(false) bool isConnected,
    @Default(<WebPortalUser>[]) List<WebPortalUser> users,
    @Default(<int>{}) Set<int> savingUserIds,
    String? errorMessage,
  }) = _GarageSettingsWebAccessState;
}
