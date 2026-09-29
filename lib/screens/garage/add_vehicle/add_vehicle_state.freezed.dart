// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_vehicle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddVehicleState {

 String get name; String get description; String get mileage; String get link1; String get link2; bool get isSubmitting; String? get errorMessage; DistanceUnit get distanceUnit; String? get nameError;
/// Create a copy of AddVehicleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddVehicleStateCopyWith<AddVehicleState> get copyWith => _$AddVehicleStateCopyWithImpl<AddVehicleState>(this as AddVehicleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddVehicleState&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.link1, link1) || other.link1 == link1)&&(identical(other.link2, link2) || other.link2 == link2)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.nameError, nameError) || other.nameError == nameError));
}


@override
int get hashCode => Object.hash(runtimeType,name,description,mileage,link1,link2,isSubmitting,errorMessage,distanceUnit,nameError);

@override
String toString() {
  return 'AddVehicleState(name: $name, description: $description, mileage: $mileage, link1: $link1, link2: $link2, isSubmitting: $isSubmitting, errorMessage: $errorMessage, distanceUnit: $distanceUnit, nameError: $nameError)';
}


}

/// @nodoc
abstract mixin class $AddVehicleStateCopyWith<$Res>  {
  factory $AddVehicleStateCopyWith(AddVehicleState value, $Res Function(AddVehicleState) _then) = _$AddVehicleStateCopyWithImpl;
@useResult
$Res call({
 String name, String description, String mileage, String link1, String link2, bool isSubmitting, String? errorMessage, DistanceUnit distanceUnit, String? nameError
});




}
/// @nodoc
class _$AddVehicleStateCopyWithImpl<$Res>
    implements $AddVehicleStateCopyWith<$Res> {
  _$AddVehicleStateCopyWithImpl(this._self, this._then);

  final AddVehicleState _self;
  final $Res Function(AddVehicleState) _then;

/// Create a copy of AddVehicleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? mileage = null,Object? link1 = null,Object? link2 = null,Object? isSubmitting = null,Object? errorMessage = freezed,Object? distanceUnit = null,Object? nameError = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String,link1: null == link1 ? _self.link1 : link1 // ignore: cast_nullable_to_non_nullable
as String,link2: null == link2 ? _self.link2 : link2 // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddVehicleState].
extension AddVehicleStatePatterns on AddVehicleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddVehicleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddVehicleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddVehicleState value)  $default,){
final _that = this;
switch (_that) {
case _AddVehicleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddVehicleState value)?  $default,){
final _that = this;
switch (_that) {
case _AddVehicleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  String mileage,  String link1,  String link2,  bool isSubmitting,  String? errorMessage,  DistanceUnit distanceUnit,  String? nameError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddVehicleState() when $default != null:
return $default(_that.name,_that.description,_that.mileage,_that.link1,_that.link2,_that.isSubmitting,_that.errorMessage,_that.distanceUnit,_that.nameError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  String mileage,  String link1,  String link2,  bool isSubmitting,  String? errorMessage,  DistanceUnit distanceUnit,  String? nameError)  $default,) {final _that = this;
switch (_that) {
case _AddVehicleState():
return $default(_that.name,_that.description,_that.mileage,_that.link1,_that.link2,_that.isSubmitting,_that.errorMessage,_that.distanceUnit,_that.nameError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  String mileage,  String link1,  String link2,  bool isSubmitting,  String? errorMessage,  DistanceUnit distanceUnit,  String? nameError)?  $default,) {final _that = this;
switch (_that) {
case _AddVehicleState() when $default != null:
return $default(_that.name,_that.description,_that.mileage,_that.link1,_that.link2,_that.isSubmitting,_that.errorMessage,_that.distanceUnit,_that.nameError);case _:
  return null;

}
}

}

/// @nodoc


class _AddVehicleState implements AddVehicleState {
  const _AddVehicleState({this.name = '', this.description = '', this.mileage = '', this.link1 = '', this.link2 = '', this.isSubmitting = false, this.errorMessage, this.distanceUnit = DistanceUnit.miles, this.nameError});
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  String mileage;
@override@JsonKey() final  String link1;
@override@JsonKey() final  String link2;
@override@JsonKey() final  bool isSubmitting;
@override final  String? errorMessage;
@override@JsonKey() final  DistanceUnit distanceUnit;
@override final  String? nameError;

/// Create a copy of AddVehicleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddVehicleStateCopyWith<_AddVehicleState> get copyWith => __$AddVehicleStateCopyWithImpl<_AddVehicleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddVehicleState&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.link1, link1) || other.link1 == link1)&&(identical(other.link2, link2) || other.link2 == link2)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.distanceUnit, distanceUnit) || other.distanceUnit == distanceUnit)&&(identical(other.nameError, nameError) || other.nameError == nameError));
}


@override
int get hashCode => Object.hash(runtimeType,name,description,mileage,link1,link2,isSubmitting,errorMessage,distanceUnit,nameError);

@override
String toString() {
  return 'AddVehicleState(name: $name, description: $description, mileage: $mileage, link1: $link1, link2: $link2, isSubmitting: $isSubmitting, errorMessage: $errorMessage, distanceUnit: $distanceUnit, nameError: $nameError)';
}


}

/// @nodoc
abstract mixin class _$AddVehicleStateCopyWith<$Res> implements $AddVehicleStateCopyWith<$Res> {
  factory _$AddVehicleStateCopyWith(_AddVehicleState value, $Res Function(_AddVehicleState) _then) = __$AddVehicleStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, String mileage, String link1, String link2, bool isSubmitting, String? errorMessage, DistanceUnit distanceUnit, String? nameError
});




}
/// @nodoc
class __$AddVehicleStateCopyWithImpl<$Res>
    implements _$AddVehicleStateCopyWith<$Res> {
  __$AddVehicleStateCopyWithImpl(this._self, this._then);

  final _AddVehicleState _self;
  final $Res Function(_AddVehicleState) _then;

/// Create a copy of AddVehicleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? mileage = null,Object? link1 = null,Object? link2 = null,Object? isSubmitting = null,Object? errorMessage = freezed,Object? distanceUnit = null,Object? nameError = freezed,}) {
  return _then(_AddVehicleState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String,link1: null == link1 ? _self.link1 : link1 // ignore: cast_nullable_to_non_nullable
as String,link2: null == link2 ? _self.link2 : link2 // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,distanceUnit: null == distanceUnit ? _self.distanceUnit : distanceUnit // ignore: cast_nullable_to_non_nullable
as DistanceUnit,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
