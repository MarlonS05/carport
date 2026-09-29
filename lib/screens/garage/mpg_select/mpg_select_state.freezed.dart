// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mpg_select_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MpgSelectState {

 List<Vehicle> get vehicles; bool get isLoading; DistanceUnit get distanceUnit; String? get errorMessage;
/// Create a copy of MpgSelectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MpgSelectStateCopyWith<MpgSelectState> get copyWith => _$MpgSelectStateCopyWithImpl<MpgSelectState>(this as MpgSelectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MpgSelectState&&const DeepCollectionEquality().equals(other.vehicles, vehicles)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(vehicles),isLoading,distanceUnit,errorMessage);

@override
String toString() {
  return 'MpgSelectState(vehicles: $vehicles, isLoading: $isLoading, distanceUnit: $distanceUnit, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $MpgSelectStateCopyWith<$Res>  {
  factory $MpgSelectStateCopyWith(MpgSelectState value, $Res Function(MpgSelectState) _then) = _$MpgSelectStateCopyWithImpl;
@useResult
$Res call({
 List<Vehicle> vehicles, bool isLoading, DistanceUnit distanceUnit, String? errorMessage
});




}
/// @nodoc
class _$MpgSelectStateCopyWithImpl<$Res>
    implements $MpgSelectStateCopyWith<$Res> {
  _$MpgSelectStateCopyWithImpl(this._self, this._then);

  final MpgSelectState _self;
  final $Res Function(MpgSelectState) _then;

/// Create a copy of MpgSelectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vehicles = null,Object? isLoading = null,Object? distanceUnit = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
vehicles: null == vehicles ? _self.vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<Vehicle>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MpgSelectState].
extension MpgSelectStatePatterns on MpgSelectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MpgSelectState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MpgSelectState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MpgSelectState value)  $default,){
final _that = this;
switch (_that) {
case _MpgSelectState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MpgSelectState value)?  $default,){
final _that = this;
switch (_that) {
case _MpgSelectState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Vehicle> vehicles,  bool isLoading,  DistanceUnit distanceUnit,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MpgSelectState() when $default != null:
return $default(_that.vehicles,_that.isLoading,_that.distanceUnit,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Vehicle> vehicles,  bool isLoading,  DistanceUnit distanceUnit,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _MpgSelectState():
return $default(_that.vehicles,_that.isLoading,_that.distanceUnit,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Vehicle> vehicles,  bool isLoading,  DistanceUnit distanceUnit,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _MpgSelectState() when $default != null:
return $default(_that.vehicles,_that.isLoading,_that.distanceUnit,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MpgSelectState implements MpgSelectState {
  const _MpgSelectState({final  List<Vehicle> vehicles = const [], this.isLoading = true, this.distanceUnit = DistanceUnit.miles, this.errorMessage}): _vehicles = vehicles;
  

 final  List<Vehicle> _vehicles;
@override@JsonKey() List<Vehicle> get vehicles {
  if (_vehicles is EqualUnmodifiableListView) return _vehicles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vehicles);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  DistanceUnit distanceUnit;
@override final  String? errorMessage;

/// Create a copy of MpgSelectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MpgSelectStateCopyWith<_MpgSelectState> get copyWith => __$MpgSelectStateCopyWithImpl<_MpgSelectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MpgSelectState&&const DeepCollectionEquality().equals(other._vehicles, _vehicles)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_vehicles),isLoading,distanceUnit,errorMessage);

@override
String toString() {
  return 'MpgSelectState(vehicles: $vehicles, isLoading: $isLoading, distanceUnit: $distanceUnit, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$MpgSelectStateCopyWith<$Res> implements $MpgSelectStateCopyWith<$Res> {
  factory _$MpgSelectStateCopyWith(_MpgSelectState value, $Res Function(_MpgSelectState) _then) = __$MpgSelectStateCopyWithImpl;
@override @useResult
$Res call({
 List<Vehicle> vehicles, bool isLoading, DistanceUnit distanceUnit, String? errorMessage
});




}
/// @nodoc
class __$MpgSelectStateCopyWithImpl<$Res>
    implements _$MpgSelectStateCopyWith<$Res> {
  __$MpgSelectStateCopyWithImpl(this._self, this._then);

  final _MpgSelectState _self;
  final $Res Function(_MpgSelectState) _then;

/// Create a copy of MpgSelectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vehicles = null,Object? isLoading = null,Object? distanceUnit = null,Object? errorMessage = freezed,}) {
  return _then(_MpgSelectState(
vehicles: null == vehicles ? _self._vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<Vehicle>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
