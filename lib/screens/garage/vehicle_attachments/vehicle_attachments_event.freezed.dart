// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_attachments_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleAttachmentsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleAttachmentsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleAttachmentsEvent()';
}


}

/// @nodoc
class $VehicleAttachmentsEventCopyWith<$Res>  {
$VehicleAttachmentsEventCopyWith(VehicleAttachmentsEvent _, $Res Function(VehicleAttachmentsEvent) __);
}


/// Adds pattern-matching-related methods to [VehicleAttachmentsEvent].
extension VehicleAttachmentsEventPatterns on VehicleAttachmentsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _BackTapped value)?  backTapped,TResult Function( _FilePicked value)?  filePicked,TResult Function( _DeleteTapped value)?  deleteTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _FilePicked() when filePicked != null:
return filePicked(_that);case _DeleteTapped() when deleteTapped != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _BackTapped value)  backTapped,required TResult Function( _FilePicked value)  filePicked,required TResult Function( _DeleteTapped value)  deleteTapped,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _BackTapped():
return backTapped(_that);case _FilePicked():
return filePicked(_that);case _DeleteTapped():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _BackTapped value)?  backTapped,TResult? Function( _FilePicked value)?  filePicked,TResult? Function( _DeleteTapped value)?  deleteTapped,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _BackTapped() when backTapped != null:
return backTapped(_that);case _FilePicked() when filePicked != null:
return filePicked(_that);case _DeleteTapped() when deleteTapped != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String vehicleId)?  started,TResult Function()?  backTapped,TResult Function( String sourcePath,  String displayName,  String? mimeType)?  filePicked,TResult Function( String attachmentId)?  deleteTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId);case _BackTapped() when backTapped != null:
return backTapped();case _FilePicked() when filePicked != null:
return filePicked(_that.sourcePath,_that.displayName,_that.mimeType);case _DeleteTapped() when deleteTapped != null:
return deleteTapped(_that.attachmentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String vehicleId)  started,required TResult Function()  backTapped,required TResult Function( String sourcePath,  String displayName,  String? mimeType)  filePicked,required TResult Function( String attachmentId)  deleteTapped,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.vehicleId);case _BackTapped():
return backTapped();case _FilePicked():
return filePicked(_that.sourcePath,_that.displayName,_that.mimeType);case _DeleteTapped():
return deleteTapped(_that.attachmentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String vehicleId)?  started,TResult? Function()?  backTapped,TResult? Function( String sourcePath,  String displayName,  String? mimeType)?  filePicked,TResult? Function( String attachmentId)?  deleteTapped,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.vehicleId);case _BackTapped() when backTapped != null:
return backTapped();case _FilePicked() when filePicked != null:
return filePicked(_that.sourcePath,_that.displayName,_that.mimeType);case _DeleteTapped() when deleteTapped != null:
return deleteTapped(_that.attachmentId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements VehicleAttachmentsEvent {
  const _Started({required this.vehicleId});
  

 final  String vehicleId;

/// Create a copy of VehicleAttachmentsEvent
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
  return 'VehicleAttachmentsEvent.started(vehicleId: $vehicleId)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $VehicleAttachmentsEventCopyWith<$Res> {
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

/// Create a copy of VehicleAttachmentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? vehicleId = null,}) {
  return _then(_Started(
vehicleId: null == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BackTapped implements VehicleAttachmentsEvent {
  const _BackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleAttachmentsEvent.backTapped()';
}


}




/// @nodoc


class _FilePicked implements VehicleAttachmentsEvent {
  const _FilePicked({required this.sourcePath, required this.displayName, this.mimeType});
  

 final  String sourcePath;
 final  String displayName;
 final  String? mimeType;

/// Create a copy of VehicleAttachmentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilePickedCopyWith<_FilePicked> get copyWith => __$FilePickedCopyWithImpl<_FilePicked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilePicked&&(identical(other.sourcePath, sourcePath) || other.sourcePath == sourcePath)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}


@override
int get hashCode => Object.hash(runtimeType,sourcePath,displayName,mimeType);

@override
String toString() {
  return 'VehicleAttachmentsEvent.filePicked(sourcePath: $sourcePath, displayName: $displayName, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class _$FilePickedCopyWith<$Res> implements $VehicleAttachmentsEventCopyWith<$Res> {
  factory _$FilePickedCopyWith(_FilePicked value, $Res Function(_FilePicked) _then) = __$FilePickedCopyWithImpl;
@useResult
$Res call({
 String sourcePath, String displayName, String? mimeType
});




}
/// @nodoc
class __$FilePickedCopyWithImpl<$Res>
    implements _$FilePickedCopyWith<$Res> {
  __$FilePickedCopyWithImpl(this._self, this._then);

  final _FilePicked _self;
  final $Res Function(_FilePicked) _then;

/// Create a copy of VehicleAttachmentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sourcePath = null,Object? displayName = null,Object? mimeType = freezed,}) {
  return _then(_FilePicked(
sourcePath: null == sourcePath ? _self.sourcePath : sourcePath // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _DeleteTapped implements VehicleAttachmentsEvent {
  const _DeleteTapped({required this.attachmentId});
  

 final  String attachmentId;

/// Create a copy of VehicleAttachmentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTappedCopyWith<_DeleteTapped> get copyWith => __$DeleteTappedCopyWithImpl<_DeleteTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTapped&&(identical(other.attachmentId, attachmentId) || other.attachmentId == attachmentId));
}


@override
int get hashCode => Object.hash(runtimeType,attachmentId);

@override
String toString() {
  return 'VehicleAttachmentsEvent.deleteTapped(attachmentId: $attachmentId)';
}


}

/// @nodoc
abstract mixin class _$DeleteTappedCopyWith<$Res> implements $VehicleAttachmentsEventCopyWith<$Res> {
  factory _$DeleteTappedCopyWith(_DeleteTapped value, $Res Function(_DeleteTapped) _then) = __$DeleteTappedCopyWithImpl;
@useResult
$Res call({
 String attachmentId
});




}
/// @nodoc
class __$DeleteTappedCopyWithImpl<$Res>
    implements _$DeleteTappedCopyWith<$Res> {
  __$DeleteTappedCopyWithImpl(this._self, this._then);

  final _DeleteTapped _self;
  final $Res Function(_DeleteTapped) _then;

/// Create a copy of VehicleAttachmentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attachmentId = null,}) {
  return _then(_DeleteTapped(
attachmentId: null == attachmentId ? _self.attachmentId : attachmentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
