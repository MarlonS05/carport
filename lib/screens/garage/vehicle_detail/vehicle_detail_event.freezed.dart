// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleDetailEvent()';
}


}

/// @nodoc
class $VehicleDetailEventCopyWith<$Res>  {
$VehicleDetailEventCopyWith(VehicleDetailEvent _, $Res Function(VehicleDetailEvent) __);
}


/// Adds pattern-matching-related methods to [VehicleDetailEvent].
extension VehicleDetailEventPatterns on VehicleDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BackTapped value)?  backTapped,TResult Function( _EditToggled value)?  editToggled,TResult Function( _Saved value)?  saved,TResult Function( _ServiceLogTapped value)?  serviceLogTapped,TResult Function( _MpgHistoryTapped value)?  mpgHistoryTapped,TResult Function( _AttachmentsTapped value)?  attachmentsTapped,TResult Function( _DocumentsButtonTapped value)?  documentsButtonTapped,TResult Function( _DeleteConfirmed value)?  deleteConfirmed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _EditToggled() when editToggled != null:
return editToggled(_that);case _Saved() when saved != null:
return saved(_that);case _ServiceLogTapped() when serviceLogTapped != null:
return serviceLogTapped(_that);case _MpgHistoryTapped() when mpgHistoryTapped != null:
return mpgHistoryTapped(_that);case _AttachmentsTapped() when attachmentsTapped != null:
return attachmentsTapped(_that);case _DocumentsButtonTapped() when documentsButtonTapped != null:
return documentsButtonTapped(_that);case _DeleteConfirmed() when deleteConfirmed != null:
return deleteConfirmed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _EditToggled value)  editToggled,required TResult Function( _Saved value)  saved,required TResult Function( _ServiceLogTapped value)  serviceLogTapped,required TResult Function( _MpgHistoryTapped value)  mpgHistoryTapped,required TResult Function( _AttachmentsTapped value)  attachmentsTapped,required TResult Function( _DocumentsButtonTapped value)  documentsButtonTapped,required TResult Function( _DeleteConfirmed value)  deleteConfirmed,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BackTapped():
return backTapped(_that);case _EditToggled():
return editToggled(_that);case _Saved():
return saved(_that);case _ServiceLogTapped():
return serviceLogTapped(_that);case _MpgHistoryTapped():
return mpgHistoryTapped(_that);case _AttachmentsTapped():
return attachmentsTapped(_that);case _DocumentsButtonTapped():
return documentsButtonTapped(_that);case _DeleteConfirmed():
return deleteConfirmed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _EditToggled value)?  editToggled,TResult? Function( _Saved value)?  saved,TResult? Function( _ServiceLogTapped value)?  serviceLogTapped,TResult? Function( _MpgHistoryTapped value)?  mpgHistoryTapped,TResult? Function( _AttachmentsTapped value)?  attachmentsTapped,TResult? Function( _DocumentsButtonTapped value)?  documentsButtonTapped,TResult? Function( _DeleteConfirmed value)?  deleteConfirmed,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _EditToggled() when editToggled != null:
return editToggled(_that);case _Saved() when saved != null:
return saved(_that);case _ServiceLogTapped() when serviceLogTapped != null:
return serviceLogTapped(_that);case _MpgHistoryTapped() when mpgHistoryTapped != null:
return mpgHistoryTapped(_that);case _AttachmentsTapped() when attachmentsTapped != null:
return attachmentsTapped(_that);case _DocumentsButtonTapped() when documentsButtonTapped != null:
return documentsButtonTapped(_that);case _DeleteConfirmed() when deleteConfirmed != null:
return deleteConfirmed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String vehicleId)?  started,TResult Function()?  backTapped,TResult Function()?  editToggled,TResult Function( String name,  String description,  String mileage,  String userManualLink,  String maintenanceManualLink,  String? maintenancePlanImage,  String? documentsImage)?  saved,TResult Function()?  serviceLogTapped,TResult Function()?  mpgHistoryTapped,TResult Function()?  attachmentsTapped,TResult Function()?  documentsButtonTapped,TResult Function()?  deleteConfirmed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId);case _BackTapped() when backTapped != null:
return backTapped();case _EditToggled() when editToggled != null:
return editToggled();case _Saved() when saved != null:
return saved(_that.name,_that.description,_that.mileage,_that.userManualLink,_that.maintenanceManualLink,_that.maintenancePlanImage,_that.documentsImage);case _ServiceLogTapped() when serviceLogTapped != null:
return serviceLogTapped();case _MpgHistoryTapped() when mpgHistoryTapped != null:
return mpgHistoryTapped();case _AttachmentsTapped() when attachmentsTapped != null:
return attachmentsTapped();case _DocumentsButtonTapped() when documentsButtonTapped != null:
return documentsButtonTapped();case _DeleteConfirmed() when deleteConfirmed != null:
return deleteConfirmed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String vehicleId)  started,required TResult Function()  backTapped,required TResult Function()  editToggled,required TResult Function( String name,  String description,  String mileage,  String userManualLink,  String maintenanceManualLink,  String? maintenancePlanImage,  String? documentsImage)  saved,required TResult Function()  serviceLogTapped,required TResult Function()  mpgHistoryTapped,required TResult Function()  attachmentsTapped,required TResult Function()  documentsButtonTapped,required TResult Function()  deleteConfirmed,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.vehicleId);case _BackTapped():
return backTapped();case _EditToggled():
return editToggled();case _Saved():
return saved(_that.name,_that.description,_that.mileage,_that.userManualLink,_that.maintenanceManualLink,_that.maintenancePlanImage,_that.documentsImage);case _ServiceLogTapped():
return serviceLogTapped();case _MpgHistoryTapped():
return mpgHistoryTapped();case _AttachmentsTapped():
return attachmentsTapped();case _DocumentsButtonTapped():
return documentsButtonTapped();case _DeleteConfirmed():
return deleteConfirmed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String vehicleId)?  started,TResult? Function()?  backTapped,TResult? Function()?  editToggled,TResult? Function( String name,  String description,  String mileage,  String userManualLink,  String maintenanceManualLink,  String? maintenancePlanImage,  String? documentsImage)?  saved,TResult? Function()?  serviceLogTapped,TResult? Function()?  mpgHistoryTapped,TResult? Function()?  attachmentsTapped,TResult? Function()?  documentsButtonTapped,TResult? Function()?  deleteConfirmed,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId);case _BackTapped() when backTapped != null:
return backTapped();case _EditToggled() when editToggled != null:
return editToggled();case _Saved() when saved != null:
return saved(_that.name,_that.description,_that.mileage,_that.userManualLink,_that.maintenanceManualLink,_that.maintenancePlanImage,_that.documentsImage);case _ServiceLogTapped() when serviceLogTapped != null:
return serviceLogTapped();case _MpgHistoryTapped() when mpgHistoryTapped != null:
return mpgHistoryTapped();case _AttachmentsTapped() when attachmentsTapped != null:
return attachmentsTapped();case _DocumentsButtonTapped() when documentsButtonTapped != null:
return documentsButtonTapped();case _DeleteConfirmed() when deleteConfirmed != null:
return deleteConfirmed();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VehicleDetailEvent {
  const _Started({required this.vehicleId});
  

 final  String vehicleId;

/// Create a copy of VehicleDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId));
}


@override
int get hashCode => Object.hash(runtimeType,vehicleId);

@override
String toString() {
  return 'VehicleDetailEvent.started(vehicleId: $vehicleId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $VehicleDetailEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 String vehicleId
});




}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of VehicleDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,}) {
  return _then(_Started(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BackTapped implements VehicleDetailEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleDetailEvent.backTapped()';
}


}




/// @nodoc


class _EditToggled implements VehicleDetailEvent {
  const _EditToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleDetailEvent.editToggled()';
}


}




/// @nodoc


class _Saved implements VehicleDetailEvent {
  const _Saved({required this.name, required this.description, required this.mileage, required this.userManualLink, required this.maintenanceManualLink, this.maintenancePlanImage, this.documentsImage});
  

 final  String name;
 final  String description;
 final  String mileage;
 final  String userManualLink;
 final  String maintenanceManualLink;
 final  String? maintenancePlanImage;
 final  String? documentsImage;

/// Create a copy of VehicleDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedCopyWith<_Saved> get copyWith => __$SavedCopyWithImpl<_Saved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Saved&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.userManualLink, userManualLink) || other.userManualLink == userManualLink)&&(identical(other.maintenanceManualLink, maintenanceManualLink) || other.maintenanceManualLink == maintenanceManualLink)&&(identical(other.maintenancePlanImage, maintenancePlanImage) || other.maintenancePlanImage == maintenancePlanImage)&&(identical(other.documentsImage, documentsImage) || other.documentsImage == documentsImage));
}


@override
int get hashCode => Object.hash(runtimeType,name,description,mileage,userManualLink,maintenanceManualLink,maintenancePlanImage,documentsImage);

@override
String toString() {
  return 'VehicleDetailEvent.saved(name: $name, description: $description, mileage: $mileage, userManualLink: $userManualLink, maintenanceManualLink: $maintenanceManualLink, maintenancePlanImage: $maintenancePlanImage, documentsImage: $documentsImage)';
}


}

/// @nodoc
abstract mixin class _$SavedCopyWith<$Res> implements $VehicleDetailEventCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) _then) = __$SavedCopyWithImpl;
@useResult
$Res call({
 String name, String description, String mileage, String userManualLink, String maintenanceManualLink, String? maintenancePlanImage, String? documentsImage
});




}
/// @nodoc
class __$SavedCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(this._self, this._then);

  final _Saved _self;
  final $Res Function(_Saved) _then;

/// Create a copy of VehicleDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? mileage = null,Object? userManualLink = null,Object? maintenanceManualLink = null,Object? maintenancePlanImage = freezed,Object? documentsImage = freezed,}) {
  return _then(_Saved(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as String,userManualLink: null == userManualLink ? _self.userManualLink : userManualLink // ignore: cast_nullable_to_non_nullable
as String,maintenanceManualLink: null == maintenanceManualLink ? _self.maintenanceManualLink : maintenanceManualLink // ignore: cast_nullable_to_non_nullable
as String,maintenancePlanImage: freezed == maintenancePlanImage ? _self.maintenancePlanImage : maintenancePlanImage // ignore: cast_nullable_to_non_nullable
as String?,documentsImage: freezed == documentsImage ? _self.documentsImage : documentsImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ServiceLogTapped implements VehicleDetailEvent {
  const _ServiceLogTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceLogTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleDetailEvent.serviceLogTapped()';
}


}




/// @nodoc


class _MpgHistoryTapped implements VehicleDetailEvent {
  const _MpgHistoryTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MpgHistoryTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleDetailEvent.mpgHistoryTapped()';
}


}




/// @nodoc


class _AttachmentsTapped implements VehicleDetailEvent {
  const _AttachmentsTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttachmentsTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleDetailEvent.attachmentsTapped()';
}


}




/// @nodoc


class _DocumentsButtonTapped implements VehicleDetailEvent {
  const _DocumentsButtonTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentsButtonTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleDetailEvent.documentsButtonTapped()';
}


}




/// @nodoc


class _DeleteConfirmed implements VehicleDetailEvent {
  const _DeleteConfirmed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteConfirmed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleDetailEvent.deleteConfirmed()';
}


}




// dart format on
