// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_item_edit_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceItemEditEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceItemEditEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceItemEditEvent()';
}


}

/// @nodoc
class $ServiceItemEditEventCopyWith<$Res>  {
$ServiceItemEditEventCopyWith(ServiceItemEditEvent _, $Res Function(ServiceItemEditEvent) __);
}


/// Adds pattern-matching-related methods to [ServiceItemEditEvent].
extension ServiceItemEditEventPatterns on ServiceItemEditEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BackTapped value)?  backTapped,TResult Function( _Saved value)?  saved,TResult Function( _DeleteTapped value)?  deleteTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _Saved() when saved != null:
return saved(_that);case _DeleteTapped() when deleteTapped != null:
return deleteTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _Saved value)  saved,required TResult Function( _DeleteTapped value)  deleteTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BackTapped():
return backTapped(_that);case _Saved():
return saved(_that);case _DeleteTapped():
return deleteTapped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _Saved value)?  saved,TResult? Function( _DeleteTapped value)?  deleteTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _Saved() when saved != null:
return saved(_that);case _DeleteTapped() when deleteTapped != null:
return deleteTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String vehicleId,  String serviceItemId)?  started,TResult Function()?  backTapped,TResult Function( String title,  String description,  DateTime date,  String mileage)?  saved,TResult Function()?  deleteTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId,_that.serviceItemId);case _BackTapped() when backTapped != null:
return backTapped();case _Saved() when saved != null:
return saved(_that.title,_that.description,_that.date,_that.mileage);case _DeleteTapped() when deleteTapped != null:
return deleteTapped();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String vehicleId,  String serviceItemId)  started,required TResult Function()  backTapped,required TResult Function( String title,  String description,  DateTime date,  String mileage)  saved,required TResult Function()  deleteTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.vehicleId,_that.serviceItemId);case _BackTapped():
return backTapped();case _Saved():
return saved(_that.title,_that.description,_that.date,_that.mileage);case _DeleteTapped():
return deleteTapped();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String vehicleId,  String serviceItemId)?  started,TResult? Function()?  backTapped,TResult? Function( String title,  String description,  DateTime date,  String mileage)?  saved,TResult? Function()?  deleteTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId,_that.serviceItemId);case _BackTapped() when backTapped != null:
return backTapped();case _Saved() when saved != null:
return saved(_that.title,_that.description,_that.date,_that.mileage);case _DeleteTapped() when deleteTapped != null:
return deleteTapped();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ServiceItemEditEvent {
  const _Started({required this.vehicleId, required this.serviceItemId});
  

 final  String vehicleId;
 final  String serviceItemId;

/// Create a copy of ServiceItemEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.serviceItemId, serviceItemId) || other.serviceItemId == serviceItemId));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId,serviceItemId);

@override
String toString() {
  return 'ServiceItemEditEvent.started(vehicleId: $vehicleId, serviceItemId: $serviceItemId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $ServiceItemEditEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String vehicleId, String serviceItemId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of ServiceItemEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,Object? serviceItemId = null,}) {
  return _then(_Started(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,serviceItemId: null == serviceItemId ? _self.serviceItemId : serviceItemId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BackTapped implements ServiceItemEditEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceItemEditEvent.backTapped()';
}


}




/// @nodoc


class _Saved implements ServiceItemEditEvent {
  const _Saved({required this.title, required this.description, required this.date, required this.mileage});
  

 final  String title;
 final  String description;
 final  DateTime date;
 final  String mileage;

/// Create a copy of ServiceItemEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedCopyWith<_Saved> get copyWith => __$SavedCopyWithImpl<_Saved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Saved&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.mileage, mileage) || other.mileage == mileage));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,date,mileage);

@override
String toString() {
  return 'ServiceItemEditEvent.saved(title: $title, description: $description, date: $date, mileage: $mileage)';
}


}

/// @nodoc
abstract mixin class _$SavedCopyWith<$Res> implements $ServiceItemEditEventCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) _then) = __$SavedCopyWithImpl;
@useResult
$Res call({
 String title, String description, DateTime date, String mileage
});




}
/// @nodoc
class __$SavedCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(this._self, this._then);

  final _Saved _self;
  final $Res Function(_Saved) _then;

/// Create a copy of ServiceItemEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? date = null,Object? mileage = null,}) {
  return _then(_Saved(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteTapped implements ServiceItemEditEvent {
  const _DeleteTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceItemEditEvent.deleteTapped()';
}


}




// dart format on
