import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_connectivity_state.freezed.dart';

@freezed
abstract class GarageSettingsConnectivityState
    with _$GarageSettingsConnectivityState {
  const factory GarageSettingsConnectivityState({
    @Default(true) bool isLoading,
    String? portalBaseUrl,
    String? errorMessage,
  }) = _GarageSettingsConnectivityState;
}
