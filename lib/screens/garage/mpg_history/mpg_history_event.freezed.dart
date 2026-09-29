// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mpg_history_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MpgHistoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MpgHistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MpgHistoryEvent()';
}


}

/// @nodoc
class $MpgHistoryEventCopyWith<$Res>  {
$MpgHistoryEventCopyWith(MpgHistoryEvent _, $Res Function(MpgHistoryEvent) __);
}


/// Adds pattern-matching-related methods to [MpgHistoryEvent].
extension MpgHistoryEventPatterns on MpgHistoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BackTapped value)?  backTapped,TResult Function( _UnitChanged value)?  unitChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _UnitChanged() when unitChanged != null:
return unitChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _UnitChanged value)  unitChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BackTapped():
return backTapped(_that);case _UnitChanged():
return unitChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _UnitChanged value)?  unitChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _UnitChanged() when unitChanged != null:
return unitChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String vehicleId)?  started,TResult Function()?  backTapped,TResult Function( FuelEconomyUnit unit)?  unitChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId);case _BackTapped() when backTapped != null:
return backTapped();case _UnitChanged() when unitChanged != null:
return unitChanged(_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String vehicleId)  started,required TResult Function()  backTapped,required TResult Function( FuelEconomyUnit unit)  unitChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.vehicleId);case _BackTapped():
return backTapped();case _UnitChanged():
return unitChanged(_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String vehicleId)?  started,TResult? Function()?  backTapped,TResult? Function( FuelEconomyUnit unit)?  unitChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId);case _BackTapped() when backTapped != null:
return backTapped();case _UnitChanged() when unitChanged != null:
return unitChanged(_that.unit);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements MpgHistoryEvent {
  const _Started({required this.vehicleId});
  

 final  String vehicleId;

/// Create a copy of MpgHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId);

@override
String toString() {
  return 'MpgHistoryEvent.started(vehicleId: $vehicleId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $MpgHistoryEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String vehicleId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of MpgHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,}) {
  return _then(_Started(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BackTapped implements MpgHistoryEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MpgHistoryEvent.backTapped()';
}


}




/// @nodoc


class _UnitChanged implements MpgHistoryEvent {
  const _UnitChanged({required this.unit});
  

 final  FuelEconomyUnit unit;

/// Create a copy of MpgHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitChangedCopyWith<_UnitChanged> get copyWith => __$UnitChangedCopyWithImpl<_UnitChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitChanged&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,unit);

@override
String toString() {
  return 'MpgHistoryEvent.unitChanged(unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$UnitChangedCopyWith<$Res> implements $MpgHistoryEventCopyWith<$Res> {
  factory _$UnitChangedCopyWith(_UnitChanged value, $Res Function(_UnitChanged) _then) = __$UnitChangedCopyWithImpl;
@useResult
$Res call({
 FuelEconomyUnit unit
});




}
/// @nodoc
class __$UnitChangedCopyWithImpl<$Res>
    implements _$UnitChangedCopyWith<$Res> {
  __$UnitChangedCopyWithImpl(this._self, this._then);

  final _UnitChanged _self;
  final $Res Function(_UnitChanged) _then;

/// Create a copy of MpgHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unit = null,}) {
  return _then(_UnitChanged(
unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as FuelEconomyUnit,
  ));
}


}

// dart format on
