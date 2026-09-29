// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleListEvent()';
}


}

/// @nodoc
class $VehicleListEventCopyWith<$Res>  {
$VehicleListEventCopyWith(VehicleListEvent _, $Res Function(VehicleListEvent) __);
}


/// Adds pattern-matching-related methods to [VehicleListEvent].
extension VehicleListEventPatterns on VehicleListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BackTapped value)?  backTapped,TResult Function( _AddVehicleTapped value)?  addVehicleTapped,TResult Function( _VehicleTapped value)?  vehicleTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _AddVehicleTapped() when addVehicleTapped != null:
return addVehicleTapped(_that);case _VehicleTapped() when vehicleTapped != null:
return vehicleTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _AddVehicleTapped value)  addVehicleTapped,required TResult Function( _VehicleTapped value)  vehicleTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BackTapped():
return backTapped(_that);case _AddVehicleTapped():
return addVehicleTapped(_that);case _VehicleTapped():
return vehicleTapped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _AddVehicleTapped value)?  addVehicleTapped,TResult? Function( _VehicleTapped value)?  vehicleTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _AddVehicleTapped() when addVehicleTapped != null:
return addVehicleTapped(_that);case _VehicleTapped() when vehicleTapped != null:
return vehicleTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  backTapped,TResult Function()?  addVehicleTapped,TResult Function( String vehicleId)?  vehicleTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BackTapped() when backTapped != null:
return backTapped();case _AddVehicleTapped() when addVehicleTapped != null:
return addVehicleTapped();case _VehicleTapped() when vehicleTapped != null:
return vehicleTapped(_that.vehicleId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  backTapped,required TResult Function()  addVehicleTapped,required TResult Function( String vehicleId)  vehicleTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _BackTapped():
return backTapped();case _AddVehicleTapped():
return addVehicleTapped();case _VehicleTapped():
return vehicleTapped(_that.vehicleId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  backTapped,TResult? Function()?  addVehicleTapped,TResult? Function( String vehicleId)?  vehicleTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _BackTapped() when backTapped != null:
return backTapped();case _AddVehicleTapped() when addVehicleTapped != null:
return addVehicleTapped();case _VehicleTapped() when vehicleTapped != null:
return vehicleTapped(_that.vehicleId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VehicleListEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleListEvent.started()';
}


}




/// @nodoc


class _BackTapped implements VehicleListEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleListEvent.backTapped()';
}


}




/// @nodoc


class _AddVehicleTapped implements VehicleListEvent {
  const _AddVehicleTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddVehicleTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleListEvent.addVehicleTapped()';
}


}




/// @nodoc


class _VehicleTapped implements VehicleListEvent {
  const _VehicleTapped({required this.vehicleId});
  

 final  String vehicleId;

/// Create a copy of VehicleListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleTappedCopyWith<_VehicleTapped> get copyWith => __$VehicleTappedCopyWithImpl<_VehicleTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleTapped&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId);

@override
String toString() {
  return 'VehicleListEvent.vehicleTapped(vehicleId: $vehicleId)';
}


}

/// @nodoc
abstract mixin class _$VehicleTappedCopyWith<$Res> implements $VehicleListEventCopyWith<$Res> {
  factory _$VehicleTappedCopyWith(_VehicleTapped value, $Res Function(_VehicleTapped) _then) = __$VehicleTappedCopyWithImpl;
@useResult
$Res call({
 String vehicleId
});




}
/// @nodoc
class __$VehicleTappedCopyWithImpl<$Res>
    implements _$VehicleTappedCopyWith<$Res> {
  __$VehicleTappedCopyWithImpl(this._self, this._then);

  final _VehicleTapped _self;
  final $Res Function(_VehicleTapped) _then;

/// Create a copy of VehicleListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,}) {
  return _then(_VehicleTapped(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
