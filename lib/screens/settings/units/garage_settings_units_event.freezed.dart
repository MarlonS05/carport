// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'garage_settings_units_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GarageSettingsUnitsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GarageSettingsUnitsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsUnitsEvent()';
}


}

/// @nodoc
class $GarageSettingsUnitsEventCopyWith<$Res>  {
$GarageSettingsUnitsEventCopyWith(GarageSettingsUnitsEvent _, $Res Function(GarageSettingsUnitsEvent) __);
}


/// Adds pattern-matching-related methods to [GarageSettingsUnitsEvent].
extension GarageSettingsUnitsEventPatterns on GarageSettingsUnitsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UnitSelected value)?  unitSelected,TResult Function( _BackTapped value)?  backTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UnitSelected() when unitSelected != null:
return unitSelected(_that);case _BackTapped() when backTapped != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UnitSelected value)  unitSelected,required TResult Function( _BackTapped value)  backTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UnitSelected():
return unitSelected(_that);case _BackTapped():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UnitSelected value)?  unitSelected,TResult? Function( _BackTapped value)?  backTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UnitSelected() when unitSelected != null:
return unitSelected(_that);case _BackTapped() when backTapped != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( DistanceUnit unit)?  unitSelected,TResult Function()?  backTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UnitSelected() when unitSelected != null:
return unitSelected(_that.unit);case _BackTapped() when backTapped != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( DistanceUnit unit)  unitSelected,required TResult Function()  backTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UnitSelected():
return unitSelected(_that.unit);case _BackTapped():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( DistanceUnit unit)?  unitSelected,TResult? Function()?  backTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UnitSelected() when unitSelected != null:
return unitSelected(_that.unit);case _BackTapped() when backTapped != null:
return backTapped();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements GarageSettingsUnitsEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsUnitsEvent.started()';
}


}




/// @nodoc


class _UnitSelected implements GarageSettingsUnitsEvent {
  const _UnitSelected(this.unit);
  

 final  DistanceUnit unit;

/// Create a copy of GarageSettingsUnitsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitSelectedCopyWith<_UnitSelected> get copyWith => __$UnitSelectedCopyWithImpl<_UnitSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitSelected&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,unit);

@override
String toString() {
  return 'GarageSettingsUnitsEvent.unitSelected(unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$UnitSelectedCopyWith<$Res> implements $GarageSettingsUnitsEventCopyWith<$Res> {
  factory _$UnitSelectedCopyWith(_UnitSelected value, $Res Function(_UnitSelected) _then) = __$UnitSelectedCopyWithImpl;
@useResult
$Res call({
 DistanceUnit unit
});




}
/// @nodoc
class __$UnitSelectedCopyWithImpl<$Res>
    implements _$UnitSelectedCopyWith<$Res> {
  __$UnitSelectedCopyWithImpl(this._self, this._then);

  final _UnitSelected _self;
  final $Res Function(_UnitSelected) _then;

/// Create a copy of GarageSettingsUnitsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unit = null,}) {
  return _then(_UnitSelected(
null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,
  ));
}


}

/// @nodoc


class _BackTapped implements GarageSettingsUnitsEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GarageSettingsUnitsEvent.backTapped()';
}


}




// dart format on
