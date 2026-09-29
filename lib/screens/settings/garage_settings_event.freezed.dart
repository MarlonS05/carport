// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsEvent()';
}


}

/// @nodoc
class $GarageSettingsEventCopyWith<$Res>  {
$GarageSettingsEventCopyWith(GarageSettingsEvent _, $Res Function(GarageSettingsEvent) __);
}


/// Adds pattern-matching-related methods to [GarageSettingsEvent].
extension GarageSettingsEventPatterns on GarageSettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UnitsTapped value)?  unitsTapped,TResult Function( _PermissionsTapped value)?  permissionsTapped,TResult Function( _ConnectivityTapped value)?  connectivityTapped,TResult Function( _AppearanceTapped value)?  appearanceTapped,TResult Function( _BackTapped value)?  backTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UnitsTapped() when unitsTapped != null:
return unitsTapped(_that);case _PermissionsTapped() when permissionsTapped != null:
return permissionsTapped(_that);case _ConnectivityTapped() when connectivityTapped != null:
return connectivityTapped(_that);case _AppearanceTapped() when appearanceTapped != null:
return appearanceTapped(_that);case _BackTapped() when backTapped != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UnitsTapped value)  unitsTapped,required TResult Function( _PermissionsTapped value)  permissionsTapped,required TResult Function( _ConnectivityTapped value)  connectivityTapped,required TResult Function( _AppearanceTapped value)  appearanceTapped,required TResult Function( _BackTapped value)  backTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UnitsTapped():
return unitsTapped(_that);case _PermissionsTapped():
return permissionsTapped(_that);case _ConnectivityTapped():
return connectivityTapped(_that);case _AppearanceTapped():
return appearanceTapped(_that);case _BackTapped():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UnitsTapped value)?  unitsTapped,TResult? Function( _PermissionsTapped value)?  permissionsTapped,TResult? Function( _ConnectivityTapped value)?  connectivityTapped,TResult? Function( _AppearanceTapped value)?  appearanceTapped,TResult? Function( _BackTapped value)?  backTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UnitsTapped() when unitsTapped != null:
return unitsTapped(_that);case _PermissionsTapped() when permissionsTapped != null:
return permissionsTapped(_that);case _ConnectivityTapped() when connectivityTapped != null:
return connectivityTapped(_that);case _AppearanceTapped() when appearanceTapped != null:
return appearanceTapped(_that);case _BackTapped() when backTapped != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  unitsTapped,TResult Function()?  permissionsTapped,TResult Function()?  connectivityTapped,TResult Function()?  appearanceTapped,TResult Function()?  backTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UnitsTapped() when unitsTapped != null:
return unitsTapped();case _PermissionsTapped() when permissionsTapped != null:
return permissionsTapped();case _ConnectivityTapped() when connectivityTapped != null:
return connectivityTapped();case _AppearanceTapped() when appearanceTapped != null:
return appearanceTapped();case _BackTapped() when backTapped != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  unitsTapped,required TResult Function()  permissionsTapped,required TResult Function()  connectivityTapped,required TResult Function()  appearanceTapped,required TResult Function()  backTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UnitsTapped():
return unitsTapped();case _PermissionsTapped():
return permissionsTapped();case _ConnectivityTapped():
return connectivityTapped();case _AppearanceTapped():
return appearanceTapped();case _BackTapped():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  unitsTapped,TResult? Function()?  permissionsTapped,TResult? Function()?  connectivityTapped,TResult? Function()?  appearanceTapped,TResult? Function()?  backTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UnitsTapped() when unitsTapped != null:
return unitsTapped();case _PermissionsTapped() when permissionsTapped != null:
return permissionsTapped();case _ConnectivityTapped() when connectivityTapped != null:
return connectivityTapped();case _AppearanceTapped() when appearanceTapped != null:
return appearanceTapped();case _BackTapped() when backTapped != null:
return backTapped();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GarageSettingsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsEvent.started()';
}


}




/// @nodoc


class _UnitsTapped implements GarageSettingsEvent {
  const _UnitsTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitsTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsEvent.unitsTapped()';
}


}




/// @nodoc


class _PermissionsTapped implements GarageSettingsEvent {
  const _PermissionsTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionsTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsEvent.permissionsTapped()';
}


}




/// @nodoc


class _ConnectivityTapped implements GarageSettingsEvent {
  const _ConnectivityTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectivityTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsEvent.connectivityTapped()';
}


}




/// @nodoc


class _AppearanceTapped implements GarageSettingsEvent {
  const _AppearanceTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppearanceTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsEvent.appearanceTapped()';
}


}




/// @nodoc


class _BackTapped implements GarageSettingsEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsEvent.backTapped()';
}


}




// dart format on
