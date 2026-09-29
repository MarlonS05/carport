// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_permissions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsPermissionsState {

 bool get isLoading; bool get isRequesting; NotificationPermissionStatus get permissionStatus; String? get errorMessage;
/// Create a copy of GarageSettingsPermissionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GarageSettingsPermissionsStateCopyWith<GarageSettingsPermissionsState> get copyWith => _$GarageSettingsPermissionsStateCopyWithImpl<GarageSettingsPermissionsState>(this as GarageSettingsPermissionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsPermissionsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRequesting, isRequesting) || other.isRequesting == isRequesting)&&(identical(other.permissionStatus, permissionStatus) || other.permissionStatus == permissionStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRequesting,permissionStatus,errorMessage);

@override
String toString() {
  return 'GarageSettingsPermissionsState(isLoading: $isLoading, isRequesting: $isRequesting, permissionStatus: $permissionStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GarageSettingsPermissionsStateCopyWith<$Res>  {
  factory $GarageSettingsPermissionsStateCopyWith(GarageSettingsPermissionsState value, $Res Function(GarageSettingsPermissionsState) _then) = _$GarageSettingsPermissionsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isRequesting, NotificationPermissionStatus permissionStatus, String? errorMessage
});




}
/// @nodoc
class _$GarageSettingsPermissionsStateCopyWithImpl<$Res>
    implements $GarageSettingsPermissionsStateCopyWith<$Res> {
  _$GarageSettingsPermissionsStateCopyWithImpl(this._self, this._then);

  final GarageSettingsPermissionsState _self;
  final $Res Function(GarageSettingsPermissionsState) _then;

/// Create a copy of GarageSettingsPermissionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isRequesting = null,Object? permissionStatus = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRequesting: null == isRequesting ? _self.isRequesting : isRequesting // ignore: cast_nullable_to_non_nullable
as bool,permissionStatus: null == permissionStatus ? _self.permissionStatus : permissionStatus // ignore: cast_nullable_to_non_nullable
as NotificationPermissionStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GarageSettingsPermissionsState].
extension GarageSettingsPermissionsStatePatterns on GarageSettingsPermissionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GarageSettingsPermissionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GarageSettingsPermissionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GarageSettingsPermissionsState value)  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsPermissionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GarageSettingsPermissionsState value)?  $default,){
final _that = this;
switch (_that) {
case _GarageSettingsPermissionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isRequesting,  NotificationPermissionStatus permissionStatus,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GarageSettingsPermissionsState() when $default != null:
return $default(_that.isLoading,_that.isRequesting,_that.permissionStatus,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isRequesting,  NotificationPermissionStatus permissionStatus,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsPermissionsState():
return $default(_that.isLoading,_that.isRequesting,_that.permissionStatus,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isRequesting,  NotificationPermissionStatus permissionStatus,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GarageSettingsPermissionsState() when $default != null:
return $default(_that.isLoading,_that.isRequesting,_that.permissionStatus,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GarageSettingsPermissionsState implements GarageSettingsPermissionsState {
  const _GarageSettingsPermissionsState({this.isLoading = true, this.isRequesting = false, this.permissionStatus = NotificationPermissionStatus.notDetermined, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isRequesting;
@override@JsonKey() final  NotificationPermissionStatus permissionStatus;
@override final  String? errorMessage;

/// Create a copy of GarageSettingsPermissionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GarageSettingsPermissionsStateCopyWith<_GarageSettingsPermissionsState> get copyWith => __$GarageSettingsPermissionsStateCopyWithImpl<_GarageSettingsPermissionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GarageSettingsPermissionsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRequesting, isRequesting) || other.isRequesting == isRequesting)&&(identical(other.permissionStatus, permissionStatus) || other.permissionStatus == permissionStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRequesting,permissionStatus,errorMessage);

@override
String toString() {
  return 'GarageSettingsPermissionsState(isLoading: $isLoading, isRequesting: $isRequesting, permissionStatus: $permissionStatus, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GarageSettingsPermissionsStateCopyWith<$Res> implements $GarageSettingsPermissionsStateCopyWith<$Res> {
  factory _$GarageSettingsPermissionsStateCopyWith(_GarageSettingsPermissionsState value, $Res Function(_GarageSettingsPermissionsState) _then) = __$GarageSettingsPermissionsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isRequesting, NotificationPermissionStatus permissionStatus, String? errorMessage
});




}
/// @nodoc
class __$GarageSettingsPermissionsStateCopyWithImpl<$Res>
    implements _$GarageSettingsPermissionsStateCopyWith<$Res> {
  __$GarageSettingsPermissionsStateCopyWithImpl(this._self, this._then);

  final _GarageSettingsPermissionsState _self;
  final $Res Function(_GarageSettingsPermissionsState) _then;

/// Create a copy of GarageSettingsPermissionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isRequesting = null,Object? permissionStatus = null,Object? errorMessage = freezed,}) {
  return _then(_GarageSettingsPermissionsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRequesting: null == isRequesting ? _self.isRequesting : isRequesting // ignore: cast_nullable_to_non_nullable
as bool,permissionStatus: null == permissionStatus ? _self.permissionStatus : permissionStatus // ignore: cast_nullable_to_non_nullable
as NotificationPermissionStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
