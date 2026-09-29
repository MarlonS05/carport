// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_web_access_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsWebAccessEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsWebAccessEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsWebAccessEvent()';
}


}

/// @nodoc
class $GarageSettingsWebAccessEventCopyWith<$Res>  {
$GarageSettingsWebAccessEventCopyWith(GarageSettingsWebAccessEvent _, $Res Function(GarageSettingsWebAccessEvent) __);
}


/// Adds pattern-matching-related methods to [GarageSettingsWebAccessEvent].
extension GarageSettingsWebAccessEventPatterns on GarageSettingsWebAccessEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UserAccessToggled value)?  userAccessToggled,TResult Function( _BackTapped value)?  backTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UserAccessToggled() when userAccessToggled != null:
return userAccessToggled(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UserAccessToggled value)  userAccessToggled,required TResult Function( _BackTapped value)  backTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UserAccessToggled():
return userAccessToggled(_that);case _BackTapped():
return backTapped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UserAccessToggled value)?  userAccessToggled,TResult? Function( _BackTapped value)?  backTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UserAccessToggled() when userAccessToggled != null:
return userAccessToggled(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int userId,  bool enabled)?  userAccessToggled,TResult Function()?  backTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UserAccessToggled() when userAccessToggled != null:
return userAccessToggled(_that.userId,_that.enabled);case _BackTapped() when backTapped != null:
return backTapped();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int userId,  bool enabled)  userAccessToggled,required TResult Function()  backTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UserAccessToggled():
return userAccessToggled(_that.userId,_that.enabled);case _BackTapped():
return backTapped();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int userId,  bool enabled)?  userAccessToggled,TResult? Function()?  backTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UserAccessToggled() when userAccessToggled != null:
return userAccessToggled(_that.userId,_that.enabled);case _BackTapped() when backTapped != null:
return backTapped();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GarageSettingsWebAccessEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsWebAccessEvent.started()';
}


}




/// @nodoc


class _UserAccessToggled implements GarageSettingsWebAccessEvent {
  const _UserAccessToggled({required this.userId, required this.enabled});
  

 final  int userId;
 final  bool enabled;

/// Create a copy of GarageSettingsWebAccessEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAccessToggledCopyWith<_UserAccessToggled> get copyWith => __$UserAccessToggledCopyWithImpl<_UserAccessToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAccessToggled&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,userId,enabled);

@override
String toString() {
  return 'GarageSettingsWebAccessEvent.userAccessToggled(userId: $userId, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$UserAccessToggledCopyWith<$Res> implements $GarageSettingsWebAccessEventCopyWith<$Res> {
  factory _$UserAccessToggledCopyWith(_UserAccessToggled value, $Res Function(_UserAccessToggled) _then) = __$UserAccessToggledCopyWithImpl;
@useResult
$Res call({
 int userId, bool enabled
});




}
/// @nodoc
class __$UserAccessToggledCopyWithImpl<$Res>
    implements _$UserAccessToggledCopyWith<$Res> {
  __$UserAccessToggledCopyWithImpl(this._self, this._then);

  final _UserAccessToggled _self;
  final $Res Function(_UserAccessToggled) _then;

/// Create a copy of GarageSettingsWebAccessEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? enabled = null,}) {
  return _then(_UserAccessToggled(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _BackTapped implements GarageSettingsWebAccessEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsWebAccessEvent.backTapped()';
}


}




// dart format on
