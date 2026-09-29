import 'package:carport/domain/entities/vehicle.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_entry_select_state.freezed.dart';

@freezed
abstract class QuickEntrySelectState with _$QuickEntrySelectState {
  const factory QuickEntrySelectState({
    @Default([]) List<Vehicle> vehicles,
    @Default(true) bool isLoading,
    String? errorMessage,
  }) = _QuickEntrySelectState;
}
