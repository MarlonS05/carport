import 'package:freezed_annotation/freezed_annotation.dart';

part 'garage_settings_connectivity_event.freezed.dart';

@freezed
abstract class GarageSettingsConnectivityEvent
    with _$GarageSettingsConnectivityEvent {
  const factory GarageSettingsConnectivityEvent.started() = _Started;

  const factory GarageSettingsConnectivityEvent.qrScannerTapped() =
      _QrScannerTapped;

  const factory GarageSettingsConnectivityEvent.webAccessTapped() =
      _WebAccessTapped;

  const factory GarageSettingsConnectivityEvent.backTapped() = _BackTapped;
}
