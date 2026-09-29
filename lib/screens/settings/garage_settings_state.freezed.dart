// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsState {

 bool get isLoading; DistanceUnit get distanceUnit; ColorThemePreset get colorThemePreset; String? get portalBaseUrl; String? get errorMessage;
/// Create a copy of GarageSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarageSettingsStateCopyWith<GarageSettingsState> get copyWith => _$GarageSettingsStateCopyWithImpl<GarageSettingsState>(this as GarageSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.colorThemePreset, colorThemePreset) || other.colorThemePreset == colorThemePreset)&&(identical(other.portalBaseUrl, portalBaseUrl) || other.portalBaseUrl == portalBaseUrl)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,distanceUnit,colorThemePreset,portalBaseUrl,errorMessage);

@override
String toString() {
  return 'GarageSettingsState(isLoading: $isLoading, distanceUnit: $distanceUnit, colorThemePreset: $colorThemePreset, portalBaseUrl: $portalBaseUrl, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GarageSettingsStateCopyWith<$Res>  {
  factory $GarageSettingsStateCopyWith(GarageSettingsState value, $Res Function(GarageSettingsState) _then) = _$GarageSettingsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, DistanceUnit distanceUnit, ColorThemePreset colorThemePreset, String? portalBaseUrl, String? errorMessage
});




}
/// @nodoc
class _$GarageSettingsStateCopyWithImpl<$Res>
    implements $GarageSettingsStateCopyWith<$Res> {
  _$GarageSettingsStateCopyWithImpl(this._self, this._then);

  final GarageSettingsState _self;
  final $Res Function(GarageSettingsState) _then;

/// Create a copy of GarageSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? distanceUnit = null,Object? colorThemePreset = null,Object? portalBaseUrl = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,colorThemePreset: null == colorThemePreset ? _self.colorThemePreset : colorThemePreset // ignore: cast_nullable_to_non_nullable
as ColorThemePreset,portalBaseUrl: freezed == portalBaseUrl ? _self.portalBaseUrl : portalBaseUrl // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GarageSettingsState].
extension GarageSettingsStatePatterns on GarageSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarageSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarageSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarageSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarageSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  DistanceUnit distanceUnit,  ColorThemePreset colorThemePreset,  String? portalBaseUrl,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarageSettingsState() when $default != null:
return $default(_that.isLoading,_that.distanceUnit,_that.colorThemePreset,_that.portalBaseUrl,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  DistanceUnit distanceUnit,  ColorThemePreset colorThemePreset,  String? portalBaseUrl,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsState():
return $default(_that.isLoading,_that.distanceUnit,_that.colorThemePreset,_that.portalBaseUrl,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  DistanceUnit distanceUnit,  ColorThemePreset colorThemePreset,  String? portalBaseUrl,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsState() when $default != null:
return $default(_that.isLoading,_that.distanceUnit,_that.colorThemePreset,_that.portalBaseUrl,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GarageSettingsState implements GarageSettingsState {
  const _GarageSettingsState({this.isLoading = true, this.distanceUnit = DistanceUnit.miles, this.colorThemePreset = ColorThemePreset.legacy, this.portalBaseUrl, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  DistanceUnit distanceUnit;
@override@JsonKey() final  ColorThemePreset colorThemePreset;
@override final  String? portalBaseUrl;
@override final  String? errorMessage;

/// Create a copy of GarageSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarageSettingsStateCopyWith<_GarageSettingsState> get copyWith => __$GarageSettingsStateCopyWithImpl<_GarageSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarageSettingsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.colorThemePreset, colorThemePreset) || other.colorThemePreset == colorThemePreset)&&(identical(other.portalBaseUrl, portalBaseUrl) || other.portalBaseUrl == portalBaseUrl)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,distanceUnit,colorThemePreset,portalBaseUrl,errorMessage);

@override
String toString() {
  return 'GarageSettingsState(isLoading: $isLoading, distanceUnit: $distanceUnit, colorThemePreset: $colorThemePreset, portalBaseUrl: $portalBaseUrl, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GarageSettingsStateCopyWith<$Res> implements $GarageSettingsStateCopyWith<$Res> {
  factory _$GarageSettingsStateCopyWith(_GarageSettingsState value, $Res Function(_GarageSettingsState) _then) = __$GarageSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, DistanceUnit distanceUnit, ColorThemePreset colorThemePreset, String? portalBaseUrl, String? errorMessage
});




}
/// @nodoc
class __$GarageSettingsStateCopyWithImpl<$Res>
    implements _$GarageSettingsStateCopyWith<$Res> {
  __$GarageSettingsStateCopyWithImpl(this._self, this._then);

  final _GarageSettingsState _self;
  final $Res Function(_GarageSettingsState) _then;

/// Create a copy of GarageSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? distanceUnit = null,Object? colorThemePreset = null,Object? portalBaseUrl = freezed,Object? errorMessage = freezed,}) {
  return _then(_GarageSettingsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,colorThemePreset: null == colorThemePreset ? _self.colorThemePreset : colorThemePreset // ignore: cast_nullable_to_non_nullable
as ColorThemePreset,portalBaseUrl: freezed == portalBaseUrl ? _self.portalBaseUrl : portalBaseUrl // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
