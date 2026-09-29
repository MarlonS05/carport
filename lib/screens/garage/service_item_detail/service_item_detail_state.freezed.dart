// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_item_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceItemDetailState {

 ServiceItem? get serviceItem; Vehicle? get vehicle; bool get isEditing; bool get isLoading; bool get isSaving; String? get errorMessage; String? get titleError; String get draftTitle; String get draftDescription; DateTime? get draftDate; String get draftMileage;
/// Create a copy of ServiceItemDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceItemDetailStateCopyWith<ServiceItemDetailState> get copyWith => _$ServiceItemDetailStateCopyWithImpl<ServiceItemDetailState>(this as ServiceItemDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceItemDetailState&&(identical(other.serviceItem, serviceItem) || other.serviceItem == serviceItem)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.draftTitle, draftTitle) || other.draftTitle == draftTitle)&&(identical(other.draftDescription, draftDescription) || other.draftDescription == draftDescription)&&(identical(other.draftDate, draftDate) || other.draftDate == draftDate)&&(identical(other.draftMileage, draftMileage) || other.draftMileage == draftMileage));
}


@override
int get hashCode => Object.hash(runtimeType,serviceItem,vehicle,isEditing,isLoading,isSaving,errorMessage,titleError,draftTitle,draftDescription,draftDate,draftMileage);

@override
String toString() {
  return 'ServiceItemDetailState(serviceItem: $serviceItem, vehicle: $vehicle, isEditing: $isEditing, isLoading: $isLoading, isSaving: $isSaving, errorMessage: $errorMessage, titleError: $titleError, draftTitle: $draftTitle, draftDescription: $draftDescription, draftDate: $draftDate, draftMileage: $draftMileage)';
}


}

/// @nodoc
abstract mixin class $ServiceItemDetailStateCopyWith<$Res>  {
  factory $ServiceItemDetailStateCopyWith(ServiceItemDetailState value, $Res Function(ServiceItemDetailState) _then) = _$ServiceItemDetailStateCopyWithImpl;
@useResult
$Res call({
 ServiceItem? serviceItem, Vehicle? vehicle, bool isEditing, bool isLoading, bool isSaving, String? errorMessage, String? titleError, String draftTitle, String draftDescription, DateTime? draftDate, String draftMileage
});




}
/// @nodoc
class _$ServiceItemDetailStateCopyWithImpl<$Res>
    implements $ServiceItemDetailStateCopyWith<$Res> {
  _$ServiceItemDetailStateCopyWithImpl(this._self, this._then);

  final ServiceItemDetailState _self;
  final $Res Function(ServiceItemDetailState) _then;

/// Create a copy of ServiceItemDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceItem = freezed,Object? vehicle = freezed,Object? isEditing = null,Object? isLoading = null,Object? isSaving = null,Object? errorMessage = freezed,Object? titleError = freezed,Object? draftTitle = null,Object? draftDescription = null,Object? draftDate = freezed,Object? draftMileage = null,}) {
  return _then(_self.copyWith(
serviceItem: freezed == serviceItem ? _self.serviceItem : serviceItem // ignore: cast_nullable_to_non_nullable
as ServiceItem?,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,titleError: freezed == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String?,draftTitle: null == draftTitle ? _self.draftTitle : draftTitle // ignore: cast_nullable_to_non_nullable
as String,draftDescription: null == draftDescription ? _self.draftDescription : draftDescription // ignore: cast_nullable_to_non_nullable
as String,draftDate: freezed == draftDate ? _self.draftDate : draftDate // ignore: cast_nullable_to_non_nullable
as DateTime?,draftMileage: null == draftMileage ? _self.draftMileage : draftMileage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceItemDetailState].
extension ServiceItemDetailStatePatterns on ServiceItemDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceItemDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceItemDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceItemDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ServiceItemDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceItemDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceItemDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ServiceItem? serviceItem,  Vehicle? vehicle,  bool isEditing,  bool isLoading,  bool isSaving,  String? errorMessage,  String? titleError,  String draftTitle,  String draftDescription,  DateTime? draftDate,  String draftMileage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceItemDetailState() when $default != null:
return $default(_that.serviceItem,_that.vehicle,_that.isEditing,_that.isLoading,_that.isSaving,_that.errorMessage,_that.titleError,_that.draftTitle,_that.draftDescription,_that.draftDate,_that.draftMileage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ServiceItem? serviceItem,  Vehicle? vehicle,  bool isEditing,  bool isLoading,  bool isSaving,  String? errorMessage,  String? titleError,  String draftTitle,  String draftDescription,  DateTime? draftDate,  String draftMileage)  $default,) {final _that = this;
switch (_that) {
case _ServiceItemDetailState():
return $default(_that.serviceItem,_that.vehicle,_that.isEditing,_that.isLoading,_that.isSaving,_that.errorMessage,_that.titleError,_that.draftTitle,_that.draftDescription,_that.draftDate,_that.draftMileage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ServiceItem? serviceItem,  Vehicle? vehicle,  bool isEditing,  bool isLoading,  bool isSaving,  String? errorMessage,  String? titleError,  String draftTitle,  String draftDescription,  DateTime? draftDate,  String draftMileage)?  $default,) {final _that = this;
switch (_that) {
case _ServiceItemDetailState() when $default != null:
return $default(_that.serviceItem,_that.vehicle,_that.isEditing,_that.isLoading,_that.isSaving,_that.errorMessage,_that.titleError,_that.draftTitle,_that.draftDescription,_that.draftDate,_that.draftMileage);case _:
  return null;

}
}

}

/// @nodoc


class _ServiceItemDetailState implements ServiceItemDetailState {
  const _ServiceItemDetailState({this.serviceItem, this.vehicle, this.isEditing = false, this.isLoading = true, this.isSaving = false, this.errorMessage, this.titleError, this.draftTitle = '', this.draftDescription = '', this.draftDate, this.draftMileage = ''});
  

@override final  ServiceItem? serviceItem;
@override final  Vehicle? vehicle;
@override@JsonKey() final  bool isEditing;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;
@override final  String? errorMessage;
@override final  String? titleError;
@override@JsonKey() final  String draftTitle;
@override@JsonKey() final  String draftDescription;
@override final  DateTime? draftDate;
@override@JsonKey() final  String draftMileage;

/// Create a copy of ServiceItemDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceItemDetailStateCopyWith<_ServiceItemDetailState> get copyWith => __$ServiceItemDetailStateCopyWithImpl<_ServiceItemDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceItemDetailState&&(identical(other.serviceItem, serviceItem) || other.serviceItem == serviceItem)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.draftTitle, draftTitle) || other.draftTitle == draftTitle)&&(identical(other.draftDescription, draftDescription) || other.draftDescription == draftDescription)&&(identical(other.draftDate, draftDate) || other.draftDate == draftDate)&&(identical(other.draftMileage, draftMileage) || other.draftMileage == draftMileage));
}


@override
int get hashCode => Object.hash(runtimeType,serviceItem,vehicle,isEditing,isLoading,isSaving,errorMessage,titleError,draftTitle,draftDescription,draftDate,draftMileage);

@override
String toString() {
  return 'ServiceItemDetailState(serviceItem: $serviceItem, vehicle: $vehicle, isEditing: $isEditing, isLoading: $isLoading, isSaving: $isSaving, errorMessage: $errorMessage, titleError: $titleError, draftTitle: $draftTitle, draftDescription: $draftDescription, draftDate: $draftDate, draftMileage: $draftMileage)';
}


}

/// @nodoc
abstract mixin class _$ServiceItemDetailStateCopyWith<$Res> implements $ServiceItemDetailStateCopyWith<$Res> {
  factory _$ServiceItemDetailStateCopyWith(_ServiceItemDetailState value, $Res Function(_ServiceItemDetailState) _then) = __$ServiceItemDetailStateCopyWithImpl;
@override @useResult
$Res call({
 ServiceItem? serviceItem, Vehicle? vehicle, bool isEditing, bool isLoading, bool isSaving, String? errorMessage, String? titleError, String draftTitle, String draftDescription, DateTime? draftDate, String draftMileage
});




}
/// @nodoc
class __$ServiceItemDetailStateCopyWithImpl<$Res>
    implements _$ServiceItemDetailStateCopyWith<$Res> {
  __$ServiceItemDetailStateCopyWithImpl(this._self, this._then);

  final _ServiceItemDetailState _self;
  final $Res Function(_ServiceItemDetailState) _then;

/// Create a copy of ServiceItemDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceItem = freezed,Object? vehicle = freezed,Object? isEditing = null,Object? isLoading = null,Object? isSaving = null,Object? errorMessage = freezed,Object? titleError = freezed,Object? draftTitle = null,Object? draftDescription = null,Object? draftDate = freezed,Object? draftMileage = null,}) {
  return _then(_ServiceItemDetailState(
serviceItem: freezed == serviceItem ? _self.serviceItem : serviceItem // ignore: cast_nullable_to_non_nullable
as ServiceItem?,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as Vehicle?,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,titleError: freezed == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String?,draftTitle: null == draftTitle ? _self.draftTitle : draftTitle // ignore: cast_nullable_to_non_nullable
as String,draftDescription: null == draftDescription ? _self.draftDescription : draftDescription // ignore: cast_nullable_to_non_nullable
as String,draftDate: freezed == draftDate ? _self.draftDate : draftDate // ignore: cast_nullable_to_non_nullable
as DateTime?,draftMileage: null == draftMileage ? _self.draftMileage : draftMileage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
