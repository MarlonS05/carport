import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_item_edit_event.freezed.dart';

@freezed
abstract class ServiceItemEditEvent with _$ServiceItemEditEvent {
  const factory ServiceItemEditEvent.started({
    required String vehicleId,
    required String serviceItemId,
  }) = _Started;

  const factory ServiceItemEditEvent.backTapped() = _BackTapped;

  const factory ServiceItemEditEvent.saved() = _Saved;

  const factory ServiceItemEditEvent.deleteConfirmed() = _DeleteConfirmed;

  const factory ServiceItemEditEvent.titleChanged(String value) = _TitleChanged;

  const factory ServiceItemEditEvent.descriptionChanged(String value) =
      _DescriptionChanged;

  const factory ServiceItemEditEvent.dateChanged(DateTime value) =
      _DateChanged;

  const factory ServiceItemEditEvent.mileageChanged(String value) =
      _MileageChanged;
}
