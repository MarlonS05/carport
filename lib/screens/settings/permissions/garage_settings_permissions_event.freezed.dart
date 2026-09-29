// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_permissions_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsPermissionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsPermissionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsPermissionsEvent()';
}


}

/// @nodoc
class $GarageSettingsPermissionsEventCopyWith<$Res>  {
$GarageSettingsPermissionsEventCopyWith(GarageSettingsPermissionsEvent _, $Res Function(GarageSettingsPermissionsEvent) __);
}


/// Adds pattern-matching-related methods to [GarageSettingsPermissionsEvent].
extension GarageSettingsPermissionsEventPatterns on GarageSettingsPermissionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _PermissionTapped value)?  permissionTapped,TResult Function( _BackTapped value)?  backTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PermissionTapped() when permissionTapped != null:
return permissionTapped(_that);case _BackTapped() when backTapped != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _PermissionTapped value)  permissionTapped,required TResult Function( _BackTapped value)  backTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _PermissionTapped():
return permissionTapped(_that);case _BackTapped():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _PermissionTapped value)?  permissionTapped,TResult? Function( _BackTapped value)?  backTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PermissionTapped() when permissionTapped != null:
return permissionTapped(_that);case _BackTapped() when backTapped != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  permissionTapped,TResult Function()?  backTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PermissionTapped() when permissionTapped != null:
return permissionTapped();case _BackTapped() when backTapped != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  permissionTapped,required TResult Function()  backTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _PermissionTapped():
return permissionTapped();case _BackTapped():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  permissionTapped,TResult? Function()?  backTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PermissionTapped() when permissionTapped != null:
return permissionTapped();case _BackTapped() when backTapped != null:
return backTapped();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GarageSettingsPermissionsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsPermissionsEvent.started()';
}


}




/// @nodoc


class _PermissionTapped implements GarageSettingsPermissionsEvent {
  const _PermissionTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsPermissionsEvent.permissionTapped()';
}


}




/// @nodoc


class _BackTapped implements GarageSettingsPermissionsEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsPermissionsEvent.backTapped()';
}


}




// dart format on
