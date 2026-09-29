import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_qr_scanner_event.freezed.dart';

@freezed
abstract class GarageSettingsQrScannerEvent with _$GarageSettingsQrScannerEvent {
  const factory GarageSettingsQrScannerEvent.started() = _Started;

  const factory GarageSettingsQrScannerEvent.codeDetected(String raw) =
      _CodeDetected;

  const factory GarageSettingsQrScannerEvent.cameraDenied() = _CameraDenied;

  const factory GarageSettingsQrScannerEvent.backTapped() = _BackTapped;

  const factory GarageSettingsQrScannerEvent.reRegisterTapped() =
      _ReRegisterTapped;
}
