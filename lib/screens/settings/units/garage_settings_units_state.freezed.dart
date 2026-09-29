// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_units_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsUnitsState {

 bool get isLoading; DistanceUnit get selectedUnit; bool get isSaving; String? get errorMessage;
/// Create a copy of GarageSettingsUnitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarageSettingsUnitsStateCopyWith<GarageSettingsUnitsState> get copyWith => _$GarageSettingsUnitsStateCopyWithImpl<GarageSettingsUnitsState>(this as GarageSettingsUnitsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsUnitsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedUnit, selectedUnit) || other.selectedUnit == selectedUnit)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,selectedUnit,isSaving,errorMessage);

@override
String toString() {
  return 'GarageSettingsUnitsState(isLoading: $isLoading, selectedUnit: $selectedUnit, isSaving: $isSaving, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GarageSettingsUnitsStateCopyWith<$Res>  {
  factory $GarageSettingsUnitsStateCopyWith(GarageSettingsUnitsState value, $Res Function(GarageSettingsUnitsState) _then) = _$GarageSettingsUnitsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, DistanceUnit selectedUnit, bool isSaving, String? errorMessage
});




}
/// @nodoc
class _$GarageSettingsUnitsStateCopyWithImpl<$Res>
    implements $GarageSettingsUnitsStateCopyWith<$Res> {
  _$GarageSettingsUnitsStateCopyWithImpl(this._self, this._then);

  final GarageSettingsUnitsState _self;
  final $Res Function(GarageSettingsUnitsState) _then;

/// Create a copy of GarageSettingsUnitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? selectedUnit = null,Object? isSaving = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedUnit: null == selectedUnit ? _self.selectedUnit : selectedUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GarageSettingsUnitsState].
extension GarageSettingsUnitsStatePatterns on GarageSettingsUnitsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarageSettingsUnitsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarageSettingsUnitsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarageSettingsUnitsState value)  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsUnitsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarageSettingsUnitsState value)?  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsUnitsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  DistanceUnit selectedUnit,  bool isSaving,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarageSettingsUnitsState() when $default != null:
return $default(_that.isLoading,_that.selectedUnit,_that.isSaving,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  DistanceUnit selectedUnit,  bool isSaving,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsUnitsState():
return $default(_that.isLoading,_that.selectedUnit,_that.isSaving,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  DistanceUnit selectedUnit,  bool isSaving,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsUnitsState() when $default != null:
return $default(_that.isLoading,_that.selectedUnit,_that.isSaving,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GarageSettingsUnitsState implements GarageSettingsUnitsState {
  const _GarageSettingsUnitsState({this.isLoading = true, this.selectedUnit = DistanceUnit.miles, this.isSaving = false, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  DistanceUnit selectedUnit;
@override@JsonKey() final  bool isSaving;
@override final  String? errorMessage;

/// Create a copy of GarageSettingsUnitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarageSettingsUnitsStateCopyWith<_GarageSettingsUnitsState> get copyWith => __$GarageSettingsUnitsStateCopyWithImpl<_GarageSettingsUnitsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarageSettingsUnitsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selectedUnit, selectedUnit) || other.selectedUnit == selectedUnit)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,selectedUnit,isSaving,errorMessage);

@override
String toString() {
  return 'GarageSettingsUnitsState(isLoading: $isLoading, selectedUnit: $selectedUnit, isSaving: $isSaving, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GarageSettingsUnitsStateCopyWith<$Res> implements $GarageSettingsUnitsStateCopyWith<$Res> {
  factory _$GarageSettingsUnitsStateCopyWith(_GarageSettingsUnitsState value, $Res Function(_GarageSettingsUnitsState) _then) = __$GarageSettingsUnitsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, DistanceUnit selectedUnit, bool isSaving, String? errorMessage
});




}
/// @nodoc
class __$GarageSettingsUnitsStateCopyWithImpl<$Res>
    implements _$GarageSettingsUnitsStateCopyWith<$Res> {
  __$GarageSettingsUnitsStateCopyWithImpl(this._self, this._then);

  final _GarageSettingsUnitsState _self;
  final $Res Function(_GarageSettingsUnitsState) _then;

/// Create a copy of GarageSettingsUnitsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? selectedUnit = null,Object? isSaving = null,Object? errorMessage = freezed,}) {
  return _then(_GarageSettingsUnitsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selectedUnit: null == selectedUnit ? _self.selectedUnit : selectedUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
