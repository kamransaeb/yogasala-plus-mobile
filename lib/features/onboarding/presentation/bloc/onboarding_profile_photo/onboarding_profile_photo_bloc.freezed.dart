// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_profile_photo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingProfilePhotoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingProfilePhotoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingProfilePhotoEvent()';
}


}

/// @nodoc
class $OnboardingProfilePhotoEventCopyWith<$Res>  {
$OnboardingProfilePhotoEventCopyWith(OnboardingProfilePhotoEvent _, $Res Function(OnboardingProfilePhotoEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingProfilePhotoEvent].
extension OnboardingProfilePhotoEventPatterns on OnboardingProfilePhotoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventGallerySelected value)?  gallerySelected,TResult Function( _EventCameraSelected value)?  cameraSelected,TResult Function( _EventDeleted value)?  deleted,TResult Function( _EventSaved value)?  saved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventGallerySelected() when gallerySelected != null:
return gallerySelected(_that);case _EventCameraSelected() when cameraSelected != null:
return cameraSelected(_that);case _EventDeleted() when deleted != null:
return deleted(_that);case _EventSaved() when saved != null:
return saved(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventGallerySelected value)  gallerySelected,required TResult Function( _EventCameraSelected value)  cameraSelected,required TResult Function( _EventDeleted value)  deleted,required TResult Function( _EventSaved value)  saved,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventGallerySelected():
return gallerySelected(_that);case _EventCameraSelected():
return cameraSelected(_that);case _EventDeleted():
return deleted(_that);case _EventSaved():
return saved(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventGallerySelected value)?  gallerySelected,TResult? Function( _EventCameraSelected value)?  cameraSelected,TResult? Function( _EventDeleted value)?  deleted,TResult? Function( _EventSaved value)?  saved,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventGallerySelected() when gallerySelected != null:
return gallerySelected(_that);case _EventCameraSelected() when cameraSelected != null:
return cameraSelected(_that);case _EventDeleted() when deleted != null:
return deleted(_that);case _EventSaved() when saved != null:
return saved(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult Function()?  gallerySelected,TResult Function()?  cameraSelected,TResult Function()?  deleted,TResult Function()?  saved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventGallerySelected() when gallerySelected != null:
return gallerySelected();case _EventCameraSelected() when cameraSelected != null:
return cameraSelected();case _EventDeleted() when deleted != null:
return deleted();case _EventSaved() when saved != null:
return saved();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserYogaSalaPlus userYogaSalaPlus)  fetched,required TResult Function()  gallerySelected,required TResult Function()  cameraSelected,required TResult Function()  deleted,required TResult Function()  saved,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that.userYogaSalaPlus);case _EventGallerySelected():
return gallerySelected();case _EventCameraSelected():
return cameraSelected();case _EventDeleted():
return deleted();case _EventSaved():
return saved();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult? Function()?  gallerySelected,TResult? Function()?  cameraSelected,TResult? Function()?  deleted,TResult? Function()?  saved,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventGallerySelected() when gallerySelected != null:
return gallerySelected();case _EventCameraSelected() when cameraSelected != null:
return cameraSelected();case _EventDeleted() when deleted != null:
return deleted();case _EventSaved() when saved != null:
return saved();case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched implements OnboardingProfilePhotoEvent {
  const _EventFetched(this.userYogaSalaPlus);
  

 final  UserYogaSalaPlus userYogaSalaPlus;

/// Create a copy of OnboardingProfilePhotoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventFetchedCopyWith<_EventFetched> get copyWith => __$EventFetchedCopyWithImpl<_EventFetched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFetched&&(identical(other.userYogaSalaPlus, userYogaSalaPlus) || other.userYogaSalaPlus == userYogaSalaPlus));
}


@override
int get hashCode => Object.hash(runtimeType,userYogaSalaPlus);

@override
String toString() {
  return 'OnboardingProfilePhotoEvent.fetched(userYogaSalaPlus: $userYogaSalaPlus)';
}


}

/// @nodoc
abstract mixin class _$EventFetchedCopyWith<$Res> implements $OnboardingProfilePhotoEventCopyWith<$Res> {
  factory _$EventFetchedCopyWith(_EventFetched value, $Res Function(_EventFetched) _then) = __$EventFetchedCopyWithImpl;
@useResult
$Res call({
 UserYogaSalaPlus userYogaSalaPlus
});




}
/// @nodoc
class __$EventFetchedCopyWithImpl<$Res>
    implements _$EventFetchedCopyWith<$Res> {
  __$EventFetchedCopyWithImpl(this._self, this._then);

  final _EventFetched _self;
  final $Res Function(_EventFetched) _then;

/// Create a copy of OnboardingProfilePhotoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userYogaSalaPlus = null,}) {
  return _then(_EventFetched(
null == userYogaSalaPlus ? _self.userYogaSalaPlus : userYogaSalaPlus // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus,
  ));
}


}

/// @nodoc


class _EventGallerySelected implements OnboardingProfilePhotoEvent {
  const _EventGallerySelected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventGallerySelected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingProfilePhotoEvent.gallerySelected()';
}


}




/// @nodoc


class _EventCameraSelected implements OnboardingProfilePhotoEvent {
  const _EventCameraSelected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventCameraSelected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingProfilePhotoEvent.cameraSelected()';
}


}




/// @nodoc


class _EventDeleted implements OnboardingProfilePhotoEvent {
  const _EventDeleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingProfilePhotoEvent.deleted()';
}


}




/// @nodoc


class _EventSaved implements OnboardingProfilePhotoEvent {
  const _EventSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingProfilePhotoEvent.saved()';
}


}




/// @nodoc
mixin _$OnboardingProfilePhotoState {

 UserYogaSalaPlus? get user; Uint8List? get imageBytes; FormzSubmissionStatus get status;
/// Create a copy of OnboardingProfilePhotoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingProfilePhotoStateCopyWith<OnboardingProfilePhotoState> get copyWith => _$OnboardingProfilePhotoStateCopyWithImpl<OnboardingProfilePhotoState>(this as OnboardingProfilePhotoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingProfilePhotoState&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(imageBytes),status);

@override
String toString() {
  return 'OnboardingProfilePhotoState(user: $user, imageBytes: $imageBytes, status: $status)';
}


}

/// @nodoc
abstract mixin class $OnboardingProfilePhotoStateCopyWith<$Res>  {
  factory $OnboardingProfilePhotoStateCopyWith(OnboardingProfilePhotoState value, $Res Function(OnboardingProfilePhotoState) _then) = _$OnboardingProfilePhotoStateCopyWithImpl;
@useResult
$Res call({
 UserYogaSalaPlus? user, Uint8List? imageBytes, FormzSubmissionStatus status
});




}
/// @nodoc
class _$OnboardingProfilePhotoStateCopyWithImpl<$Res>
    implements $OnboardingProfilePhotoStateCopyWith<$Res> {
  _$OnboardingProfilePhotoStateCopyWithImpl(this._self, this._then);

  final OnboardingProfilePhotoState _self;
  final $Res Function(OnboardingProfilePhotoState) _then;

/// Create a copy of OnboardingProfilePhotoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? imageBytes = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,imageBytes: freezed == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingProfilePhotoState].
extension OnboardingProfilePhotoStatePatterns on OnboardingProfilePhotoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingProfilePhotoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingProfilePhotoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingProfilePhotoState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingProfilePhotoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingProfilePhotoState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingProfilePhotoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserYogaSalaPlus? user,  Uint8List? imageBytes,  FormzSubmissionStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingProfilePhotoState() when $default != null:
return $default(_that.user,_that.imageBytes,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserYogaSalaPlus? user,  Uint8List? imageBytes,  FormzSubmissionStatus status)  $default,) {final _that = this;
switch (_that) {
case _OnboardingProfilePhotoState():
return $default(_that.user,_that.imageBytes,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserYogaSalaPlus? user,  Uint8List? imageBytes,  FormzSubmissionStatus status)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingProfilePhotoState() when $default != null:
return $default(_that.user,_that.imageBytes,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingProfilePhotoState implements OnboardingProfilePhotoState {
  const _OnboardingProfilePhotoState({this.user, this.imageBytes, this.status = FormzSubmissionStatus.initial});
  

@override final  UserYogaSalaPlus? user;
@override final  Uint8List? imageBytes;
@override@JsonKey() final  FormzSubmissionStatus status;

/// Create a copy of OnboardingProfilePhotoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingProfilePhotoStateCopyWith<_OnboardingProfilePhotoState> get copyWith => __$OnboardingProfilePhotoStateCopyWithImpl<_OnboardingProfilePhotoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingProfilePhotoState&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(imageBytes),status);

@override
String toString() {
  return 'OnboardingProfilePhotoState(user: $user, imageBytes: $imageBytes, status: $status)';
}


}

/// @nodoc
abstract mixin class _$OnboardingProfilePhotoStateCopyWith<$Res> implements $OnboardingProfilePhotoStateCopyWith<$Res> {
  factory _$OnboardingProfilePhotoStateCopyWith(_OnboardingProfilePhotoState value, $Res Function(_OnboardingProfilePhotoState) _then) = __$OnboardingProfilePhotoStateCopyWithImpl;
@override @useResult
$Res call({
 UserYogaSalaPlus? user, Uint8List? imageBytes, FormzSubmissionStatus status
});




}
/// @nodoc
class __$OnboardingProfilePhotoStateCopyWithImpl<$Res>
    implements _$OnboardingProfilePhotoStateCopyWith<$Res> {
  __$OnboardingProfilePhotoStateCopyWithImpl(this._self, this._then);

  final _OnboardingProfilePhotoState _self;
  final $Res Function(_OnboardingProfilePhotoState) _then;

/// Create a copy of OnboardingProfilePhotoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? imageBytes = freezed,Object? status = null,}) {
  return _then(_OnboardingProfilePhotoState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,imageBytes: freezed == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,
  ));
}


}

// dart format on
