// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mpg_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MpgHistoryState {

 Vehicle? get vehicle; List<MpgEntry> get entries; List<FuelEconomyPeriod> get monthlyPeriods; List<FuelEconomyPeriod> get yearlyPeriods; FuelEconomyUnit get unit; bool get isLoading; String? get errorMessage;
/// Create a copy of MpgHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MpgHistoryStateCopyWith<MpgHistoryState> get copyWith => _$MpgHistoryStateCopyWithImpl<MpgHistoryState>(this as MpgHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MpgHistoryState&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&const DeepCollectionEquality().equals(other.entries, entries)&&const DeepCollectionEquality().equals(other.monthlyPeriods, monthlyPeriods)&&const DeepCollectionEquality().equals(other.yearlyPeriods, yearlyPeriods)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicle,const DeepCollectionEquality().hash(entries),const DeepCollectionEquality().hash(monthlyPeriods),const DeepCollectionEquality().hash(yearlyPeriods),unit,isLoading,errorMessage);

@override
String toString() {
  return 'MpgHistoryState(vehicle: $vehicle, entries: $entries, monthlyPeriods: $monthlyPeriods, yearlyPeriods: $yearlyPeriods, unit: $unit, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $MpgHistoryStateCopyWith<$Res>  {
  factory $MpgHistoryStateCopyWith(MpgHistoryState value, $Res Function(MpgHistoryState) _then) = _$MpgHistoryStateCopyWithImpl;
@useResult
$Res call({
 Vehicle? vehicle, List<MpgEntry> entries, List<FuelEconomyPeriod> monthlyPeriods, List<FuelEconomyPeriod> yearlyPeriods, FuelEconomyUnit unit, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$MpgHistoryStateCopyWithImpl<$Res>
    implements $MpgHistoryStateCopyWith<$Res> {
  _$MpgHistoryStateCopyWithImpl(this._self, this._then);

  final MpgHistoryState _self;
  final $Res Function(MpgHistoryState) _then;

/// Create a copy of MpgHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicle = freezed,Object? entries = null,Object? monthlyPeriods = null,Object? yearlyPeriods = null,Object? unit = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<MpgEntry>,monthlyPeriods: null == monthlyPeriods ? _self.monthlyPeriods : monthlyPeriods // ignore: cast_nullable_to_non_nullable
as List<FuelEconomyPeriod>,yearlyPeriods: null == yearlyPeriods ? _self.yearlyPeriods : yearlyPeriods // ignore: cast_nullable_to_non_nullable
as List<FuelEconomyPeriod>,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as FuelEconomyUnit,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MpgHistoryState].
extension MpgHistoryStatePatterns on MpgHistoryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MpgHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MpgHistoryState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MpgHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _MpgHistoryState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MpgHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _MpgHistoryState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Vehicle? vehicle,  List<MpgEntry> entries,  List<FuelEconomyPeriod> monthlyPeriods,  List<FuelEconomyPeriod> yearlyPeriods,  FuelEconomyUnit unit,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MpgHistoryState() when $default != null:
return $default(_that.vehicle,_that.entries,_that.monthlyPeriods,_that.yearlyPeriods,_that.unit,_that.isLoading,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Vehicle? vehicle,  List<MpgEntry> entries,  List<FuelEconomyPeriod> monthlyPeriods,  List<FuelEconomyPeriod> yearlyPeriods,  FuelEconomyUnit unit,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _MpgHistoryState():
return $default(_that.vehicle,_that.entries,_that.monthlyPeriods,_that.yearlyPeriods,_that.unit,_that.isLoading,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Vehicle? vehicle,  List<MpgEntry> entries,  List<FuelEconomyPeriod> monthlyPeriods,  List<FuelEconomyPeriod> yearlyPeriods,  FuelEconomyUnit unit,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _MpgHistoryState() when $default != null:
return $default(_that.vehicle,_that.entries,_that.monthlyPeriods,_that.yearlyPeriods,_that.unit,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MpgHistoryState implements MpgHistoryState {
  const _MpgHistoryState({this.vehicle, final  List<MpgEntry> entries = const [], final  List<FuelEconomyPeriod> monthlyPeriods = const [], final  List<FuelEconomyPeriod> yearlyPeriods = const [], this.unit = FuelEconomyUnit.mpg, this.isLoading = true, this.errorMessage}): _entries = entries,_monthlyPeriods = monthlyPeriods,_yearlyPeriods = yearlyPeriods;
  

@override final  Vehicle? vehicle;
 final  List<MpgEntry> _entries;
@override@JsonKey() List<MpgEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

 final  List<FuelEconomyPeriod> _monthlyPeriods;
@override@JsonKey() List<FuelEconomyPeriod> get monthlyPeriods {
  if (_monthlyPeriods is EqualUnmodifiableListView) return _monthlyPeriods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_monthlyPeriods);
}

 final  List<FuelEconomyPeriod> _yearlyPeriods;
@override@JsonKey() List<FuelEconomyPeriod> get yearlyPeriods {
  if (_yearlyPeriods is EqualUnmodifiableListView) return _yearlyPeriods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_yearlyPeriods);
}

@override@JsonKey() final  FuelEconomyUnit unit;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of MpgHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MpgHistoryStateCopyWith<_MpgHistoryState> get copyWith => __$MpgHistoryStateCopyWithImpl<_MpgHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MpgHistoryState&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&const DeepCollectionEquality().equals(other._entries, _entries)&&const DeepCollectionEquality().equals(other._monthlyPeriods, _monthlyPeriods)&&const DeepCollectionEquality().equals(other._yearlyPeriods, _yearlyPeriods)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,vehicle,const DeepCollectionEquality().hash(_entries),const DeepCollectionEquality().hash(_monthlyPeriods),const DeepCollectionEquality().hash(_yearlyPeriods),unit,isLoading,errorMessage);

@override
String toString() {
  return 'MpgHistoryState(vehicle: $vehicle, entries: $entries, monthlyPeriods: $monthlyPeriods, yearlyPeriods: $yearlyPeriods, unit: $unit, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$MpgHistoryStateCopyWith<$Res> implements $MpgHistoryStateCopyWith<$Res> {
  factory _$MpgHistoryStateCopyWith(_MpgHistoryState value, $Res Function(_MpgHistoryState) _then) = __$MpgHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 Vehicle? vehicle, List<MpgEntry> entries, List<FuelEconomyPeriod> monthlyPeriods, List<FuelEconomyPeriod> yearlyPeriods, FuelEconomyUnit unit, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$MpgHistoryStateCopyWithImpl<$Res>
    implements _$MpgHistoryStateCopyWith<$Res> {
  __$MpgHistoryStateCopyWithImpl(this._self, this._then);

  final _MpgHistoryState _self;
  final $Res Function(_MpgHistoryState) _then;

/// Create a copy of MpgHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicle = freezed,Object? entries = null,Object? monthlyPeriods = null,Object? yearlyPeriods = null,Object? unit = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_MpgHistoryState(
vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<MpgEntry>,monthlyPeriods: null == monthlyPeriods ? _self._monthlyPeriods : monthlyPeriods // ignore: cast_nullable_to_non_nullable
as List<FuelEconomyPeriod>,yearlyPeriods: null == yearlyPeriods ? _self._yearlyPeriods : yearlyPeriods // ignore: cast_nullable_to_non_nullable
as List<FuelEconomyPeriod>,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as FuelEconomyUnit,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
