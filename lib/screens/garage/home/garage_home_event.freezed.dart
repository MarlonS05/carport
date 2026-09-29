// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageHomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageHomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageHomeEvent()';
}


}

/// @nodoc
class $GarageHomeEventCopyWith<$Res>  {
$GarageHomeEventCopyWith(GarageHomeEvent _, $Res Function(GarageHomeEvent) __);
}


/// Adds pattern-matching-related methods to [GarageHomeEvent].
extension GarageHomeEventPatterns on GarageHomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _QuickEntryTapped value)?  quickEntryTapped,TResult Function( _MpgTapped value)?  mpgTapped,TResult Function( _VehiclesTapped value)?  vehiclesTapped,TResult Function( _RemindersTapped value)?  remindersTapped,TResult Function( _SettingsTapped value)?  settingsTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _QuickEntryTapped() when quickEntryTapped != null:
return quickEntryTapped(_that);case _MpgTapped() when mpgTapped != null:
return mpgTapped(_that);case _VehiclesTapped() when vehiclesTapped != null:
return vehiclesTapped(_that);case _RemindersTapped() when remindersTapped != null:
return remindersTapped(_that);case _SettingsTapped() when settingsTapped != null:
return settingsTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _QuickEntryTapped value)  quickEntryTapped,required TResult Function( _MpgTapped value)  mpgTapped,required TResult Function( _VehiclesTapped value)  vehiclesTapped,required TResult Function( _RemindersTapped value)  remindersTapped,required TResult Function( _SettingsTapped value)  settingsTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _QuickEntryTapped():
return quickEntryTapped(_that);case _MpgTapped():
return mpgTapped(_that);case _VehiclesTapped():
return vehiclesTapped(_that);case _RemindersTapped():
return remindersTapped(_that);case _SettingsTapped():
return settingsTapped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _QuickEntryTapped value)?  quickEntryTapped,TResult? Function( _MpgTapped value)?  mpgTapped,TResult? Function( _VehiclesTapped value)?  vehiclesTapped,TResult? Function( _RemindersTapped value)?  remindersTapped,TResult? Function( _SettingsTapped value)?  settingsTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _QuickEntryTapped() when quickEntryTapped != null:
return quickEntryTapped(_that);case _MpgTapped() when mpgTapped != null:
return mpgTapped(_that);case _VehiclesTapped() when vehiclesTapped != null:
return vehiclesTapped(_that);case _RemindersTapped() when remindersTapped != null:
return remindersTapped(_that);case _SettingsTapped() when settingsTapped != null:
return settingsTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  quickEntryTapped,TResult Function()?  mpgTapped,TResult Function()?  vehiclesTapped,TResult Function()?  remindersTapped,TResult Function()?  settingsTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _QuickEntryTapped() when quickEntryTapped != null:
return quickEntryTapped();case _MpgTapped() when mpgTapped != null:
return mpgTapped();case _VehiclesTapped() when vehiclesTapped != null:
return vehiclesTapped();case _RemindersTapped() when remindersTapped != null:
return remindersTapped();case _SettingsTapped() when settingsTapped != null:
return settingsTapped();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  quickEntryTapped,required TResult Function()  mpgTapped,required TResult Function()  vehiclesTapped,required TResult Function()  remindersTapped,required TResult Function()  settingsTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _QuickEntryTapped():
return quickEntryTapped();case _MpgTapped():
return mpgTapped();case _VehiclesTapped():
return vehiclesTapped();case _RemindersTapped():
return remindersTapped();case _SettingsTapped():
return settingsTapped();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  quickEntryTapped,TResult? Function()?  mpgTapped,TResult? Function()?  vehiclesTapped,TResult? Function()?  remindersTapped,TResult? Function()?  settingsTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _QuickEntryTapped() when quickEntryTapped != null:
return quickEntryTapped();case _MpgTapped() when mpgTapped != null:
return mpgTapped();case _VehiclesTapped() when vehiclesTapped != null:
return vehiclesTapped();case _RemindersTapped() when remindersTapped != null:
return remindersTapped();case _SettingsTapped() when settingsTapped != null:
return settingsTapped();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GarageHomeEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageHomeEvent.started()';
}


}




/// @nodoc


class _QuickEntryTapped implements GarageHomeEvent {
  const _QuickEntryTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuickEntryTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageHomeEvent.quickEntryTapped()';
}


}




/// @nodoc


class _MpgTapped implements GarageHomeEvent {
  const _MpgTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MpgTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageHomeEvent.mpgTapped()';
}


}




/// @nodoc


class _VehiclesTapped implements GarageHomeEvent {
  const _VehiclesTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehiclesTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageHomeEvent.vehiclesTapped()';
}


}




/// @nodoc


class _RemindersTapped implements GarageHomeEvent {
  const _RemindersTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemindersTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageHomeEvent.remindersTapped()';
}


}




/// @nodoc


class _SettingsTapped implements GarageHomeEvent {
  const _SettingsTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageHomeEvent.settingsTapped()';
}


}




// dart format on
