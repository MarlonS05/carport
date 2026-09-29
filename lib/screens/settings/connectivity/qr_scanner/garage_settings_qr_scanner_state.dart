import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_qr_scanner_state.freezed.dart';

enum PortalScanPhase {
  scanning,
  validating,
  registering,
  syncing,
  connected,
  cameraDenied,
}

@freezed
abstract class GarageSettingsQrScannerState with _$GarageSettingsQrScannerState {
  const factory GarageSettingsQrScannerState({
    @Default(true) bool isLoading,
    @Default(PortalScanPhase.scanning) PortalScanPhase scanPhase,
    String? portalBaseUrl,
    @Default(false) bool isProcessing,
    String? errorMessage,
  }) = _GarageSettingsQrScannerState;
}
