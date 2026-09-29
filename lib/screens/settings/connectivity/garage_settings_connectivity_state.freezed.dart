// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_connectivity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsConnectivityState {

 bool get isLoading; String? get portalBaseUrl; String? get errorMessage;
/// Create a copy of GarageSettingsConnectivityState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarageSettingsConnectivityStateCopyWith<GarageSettingsConnectivityState> get copyWith => _$GarageSettingsConnectivityStateCopyWithImpl<GarageSettingsConnectivityState>(this as GarageSettingsConnectivityState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsConnectivityState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.portalBaseUrl, portalBaseUrl) || other.portalBaseUrl == portalBaseUrl)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,portalBaseUrl,errorMessage);

@override
String toString() {
  return 'GarageSettingsConnectivityState(isLoading: $isLoading, portalBaseUrl: $portalBaseUrl, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GarageSettingsConnectivityStateCopyWith<$Res>  {
  factory $GarageSettingsConnectivityStateCopyWith(GarageSettingsConnectivityState value, $Res Function(GarageSettingsConnectivityState) _then) = _$GarageSettingsConnectivityStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? portalBaseUrl, String? errorMessage
});




}
/// @nodoc
class _$GarageSettingsConnectivityStateCopyWithImpl<$Res>
    implements $GarageSettingsConnectivityStateCopyWith<$Res> {
  _$GarageSettingsConnectivityStateCopyWithImpl(this._self, this._then);

  final GarageSettingsConnectivityState _self;
  final $Res Function(GarageSettingsConnectivityState) _then;

/// Create a copy of GarageSettingsConnectivityState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? portalBaseUrl = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,portalBaseUrl: freezed == portalBaseUrl ? _self.portalBaseUrl : portalBaseUrl // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GarageSettingsConnectivityState].
extension GarageSettingsConnectivityStatePatterns on GarageSettingsConnectivityState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarageSettingsConnectivityState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarageSettingsConnectivityState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarageSettingsConnectivityState value)  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsConnectivityState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarageSettingsConnectivityState value)?  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsConnectivityState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? portalBaseUrl,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarageSettingsConnectivityState() when $default != null:
return $default(_that.isLoading,_that.portalBaseUrl,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? portalBaseUrl,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsConnectivityState():
return $default(_that.isLoading,_that.portalBaseUrl,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? portalBaseUrl,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsConnectivityState() when $default != null:
return $default(_that.isLoading,_that.portalBaseUrl,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GarageSettingsConnectivityState implements GarageSettingsConnectivityState {
  const _GarageSettingsConnectivityState({this.isLoading = true, this.portalBaseUrl, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override final  String? portalBaseUrl;
@override final  String? errorMessage;

/// Create a copy of GarageSettingsConnectivityState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarageSettingsConnectivityStateCopyWith<_GarageSettingsConnectivityState> get copyWith => __$GarageSettingsConnectivityStateCopyWithImpl<_GarageSettingsConnectivityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarageSettingsConnectivityState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.portalBaseUrl, portalBaseUrl) || other.portalBaseUrl == portalBaseUrl)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,portalBaseUrl,errorMessage);

@override
String toString() {
  return 'GarageSettingsConnectivityState(isLoading: $isLoading, portalBaseUrl: $portalBaseUrl, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GarageSettingsConnectivityStateCopyWith<$Res> implements $GarageSettingsConnectivityStateCopyWith<$Res> {
  factory _$GarageSettingsConnectivityStateCopyWith(_GarageSettingsConnectivityState value, $Res Function(_GarageSettingsConnectivityState) _then) = __$GarageSettingsConnectivityStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? portalBaseUrl, String? errorMessage
});




}
/// @nodoc
class __$GarageSettingsConnectivityStateCopyWithImpl<$Res>
    implements _$GarageSettingsConnectivityStateCopyWith<$Res> {
  __$GarageSettingsConnectivityStateCopyWithImpl(this._self, this._then);

  final _GarageSettingsConnectivityState _self;
  final $Res Function(_GarageSettingsConnectivityState) _then;

/// Create a copy of GarageSettingsConnectivityState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? portalBaseUrl = freezed,Object? errorMessage = freezed,}) {
  return _then(_GarageSettingsConnectivityState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,portalBaseUrl: freezed == portalBaseUrl ? _self.portalBaseUrl : portalBaseUrl // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
