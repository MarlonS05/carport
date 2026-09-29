import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_item_edit_event.freezed.dart';

@freezed
abstract class ServiceItemEditEvent with _$ServiceItemEditEvent {
  const factory ServiceItemEditEvent.started({
    required String vehicleId,
    required String serviceItemId,
  }) = _Started;

  const factory ServiceItemEditEvent.backTapped() = _BackTapped;

  const factory ServiceItemEditEvent.saved({
    required String title,
    required String description,
    required DateTime date,
    required String mileage,
  }) = _Saved;

  const factory ServiceItemEditEvent.deleteTapped() = _DeleteTapped;
}
