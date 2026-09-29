import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_entry_form_state.freezed.dart';

@freezed
abstract class QuickEntryFormState with _$QuickEntryFormState {
  const factory QuickEntryFormState({
    @Default('') String vehicleId,
    Vehicle? vehicle,
    @Default(true) bool isLoading,
    @Default(false) bool isSubmitting,
    @Default({}) Map<String, String> fieldErrors,
    String? errorMessage,
  }) = _QuickEntryFormState;
}
