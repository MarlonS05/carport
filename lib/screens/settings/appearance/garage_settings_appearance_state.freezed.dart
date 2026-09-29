// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_appearance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsAppearanceState {

 bool get isLoading; ColorThemePreset get savedPreset; ColorThemePreset get selectedPreset; bool get isSaving; String? get errorMessage;
/// Create a copy of GarageSettingsAppearanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarageSettingsAppearanceStateCopyWith<GarageSettingsAppearanceState> get copyWith => _$GarageSettingsAppearanceStateCopyWithImpl<GarageSettingsAppearanceState>(this as GarageSettingsAppearanceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsAppearanceState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.savedPreset, savedPreset) || other.savedPreset == savedPreset)&&(identical(other.selectedPreset, selectedPreset) || other.selectedPreset == selectedPreset)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,savedPreset,selectedPreset,isSaving,errorMessage);

@override
String toString() {
  return 'GarageSettingsAppearanceState(isLoading: $isLoading, savedPreset: $savedPreset, selectedPreset: $selectedPreset, isSaving: $isSaving, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GarageSettingsAppearanceStateCopyWith<$Res>  {
  factory $GarageSettingsAppearanceStateCopyWith(GarageSettingsAppearanceState value, $Res Function(GarageSettingsAppearanceState) _then) = _$GarageSettingsAppearanceStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, ColorThemePreset savedPreset, ColorThemePreset selectedPreset, bool isSaving, String? errorMessage
});




}
/// @nodoc
class _$GarageSettingsAppearanceStateCopyWithImpl<$Res>
    implements $GarageSettingsAppearanceStateCopyWith<$Res> {
  _$GarageSettingsAppearanceStateCopyWithImpl(this._self, this._then);

  final GarageSettingsAppearanceState _self;
  final $Res Function(GarageSettingsAppearanceState) _then;

/// Create a copy of GarageSettingsAppearanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? savedPreset = null,Object? selectedPreset = null,Object? isSaving = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,savedPreset: null == savedPreset ? _self.savedPreset : savedPreset // ignore: cast_nullable_to_non_nullable
as ColorThemePreset,selectedPreset: null == selectedPreset ? _self.selectedPreset : selectedPreset // ignore: cast_nullable_to_non_nullable
as ColorThemePreset,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GarageSettingsAppearanceState].
extension GarageSettingsAppearanceStatePatterns on GarageSettingsAppearanceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarageSettingsAppearanceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarageSettingsAppearanceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarageSettingsAppearanceState value)  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsAppearanceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarageSettingsAppearanceState value)?  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsAppearanceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  ColorThemePreset savedPreset,  ColorThemePreset selectedPreset,  bool isSaving,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarageSettingsAppearanceState() when $default != null:
return $default(_that.isLoading,_that.savedPreset,_that.selectedPreset,_that.isSaving,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  ColorThemePreset savedPreset,  ColorThemePreset selectedPreset,  bool isSaving,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsAppearanceState():
return $default(_that.isLoading,_that.savedPreset,_that.selectedPreset,_that.isSaving,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  ColorThemePreset savedPreset,  ColorThemePreset selectedPreset,  bool isSaving,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsAppearanceState() when $default != null:
return $default(_that.isLoading,_that.savedPreset,_that.selectedPreset,_that.isSaving,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GarageSettingsAppearanceState extends GarageSettingsAppearanceState {
  const _GarageSettingsAppearanceState({this.isLoading = true, this.savedPreset = AppThemes.defaultPreset, this.selectedPreset = AppThemes.defaultPreset, this.isSaving = false, this.errorMessage}): super._();
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  ColorThemePreset savedPreset;
@override@JsonKey() final  ColorThemePreset selectedPreset;
@override@JsonKey() final  bool isSaving;
@override final  String? errorMessage;

/// Create a copy of GarageSettingsAppearanceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarageSettingsAppearanceStateCopyWith<_GarageSettingsAppearanceState> get copyWith => __$GarageSettingsAppearanceStateCopyWithImpl<_GarageSettingsAppearanceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarageSettingsAppearanceState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.savedPreset, savedPreset) || other.savedPreset == savedPreset)&&(identical(other.selectedPreset, selectedPreset) || other.selectedPreset == selectedPreset)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,savedPreset,selectedPreset,isSaving,errorMessage);

@override
String toString() {
  return 'GarageSettingsAppearanceState(isLoading: $isLoading, savedPreset: $savedPreset, selectedPreset: $selectedPreset, isSaving: $isSaving, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GarageSettingsAppearanceStateCopyWith<$Res> implements $GarageSettingsAppearanceStateCopyWith<$Res> {
  factory _$GarageSettingsAppearanceStateCopyWith(_GarageSettingsAppearanceState value, $Res Function(_GarageSettingsAppearanceState) _then) = __$GarageSettingsAppearanceStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, ColorThemePreset savedPreset, ColorThemePreset selectedPreset, bool isSaving, String? errorMessage
});




}
/// @nodoc
class __$GarageSettingsAppearanceStateCopyWithImpl<$Res>
    implements _$GarageSettingsAppearanceStateCopyWith<$Res> {
  __$GarageSettingsAppearanceStateCopyWithImpl(this._self, this._then);

  final _GarageSettingsAppearanceState _self;
  final $Res Function(_GarageSettingsAppearanceState) _then;

/// Create a copy of GarageSettingsAppearanceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? savedPreset = null,Object? selectedPreset = null,Object? isSaving = null,Object? errorMessage = freezed,}) {
  return _then(_GarageSettingsAppearanceState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,savedPreset: null == savedPreset ? _self.savedPreset : savedPreset // ignore: cast_nullable_to_non_nullable
as ColorThemePreset,selectedPreset: null == selectedPreset ? _self.selectedPreset : selectedPreset // ignore: cast_nullable_to_non_nullable
as ColorThemePreset,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
