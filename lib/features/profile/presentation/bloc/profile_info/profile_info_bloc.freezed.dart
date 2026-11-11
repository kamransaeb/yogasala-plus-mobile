// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileInfoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInfoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileInfoEvent()';
}


}

/// @nodoc
class $ProfileInfoEventCopyWith<$Res>  {
$ProfileInfoEventCopyWith(ProfileInfoEvent _, $Res Function(ProfileInfoEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileInfoEvent].
extension ProfileInfoEventPatterns on ProfileInfoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventNameChanged value)?  nameChanged,TResult Function( _EventSurnameChanged value)?  surnameChanged,TResult Function( _EventDateOfBirthChanged value)?  dateOfBirthChanged,TResult Function( _EventGenderChanged value)?  genderChanged,TResult Function( _EventGallerySelected value)?  gallerySelected,TResult Function( _EventCameraSelected value)?  cameraSelected,TResult Function( _EventPhotoDeleted value)?  photoDeleted,TResult Function( _EventSaved value)?  saved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventNameChanged() when nameChanged != null:
return nameChanged(_that);case _EventSurnameChanged() when surnameChanged != null:
return surnameChanged(_that);case _EventDateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that);case _EventGenderChanged() when genderChanged != null:
return genderChanged(_that);case _EventGallerySelected() when gallerySelected != null:
return gallerySelected(_that);case _EventCameraSelected() when cameraSelected != null:
return cameraSelected(_that);case _EventPhotoDeleted() when photoDeleted != null:
return photoDeleted(_that);case _EventSaved() when saved != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventNameChanged value)  nameChanged,required TResult Function( _EventSurnameChanged value)  surnameChanged,required TResult Function( _EventDateOfBirthChanged value)  dateOfBirthChanged,required TResult Function( _EventGenderChanged value)  genderChanged,required TResult Function( _EventGallerySelected value)  gallerySelected,required TResult Function( _EventCameraSelected value)  cameraSelected,required TResult Function( _EventPhotoDeleted value)  photoDeleted,required TResult Function( _EventSaved value)  saved,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventNameChanged():
return nameChanged(_that);case _EventSurnameChanged():
return surnameChanged(_that);case _EventDateOfBirthChanged():
return dateOfBirthChanged(_that);case _EventGenderChanged():
return genderChanged(_that);case _EventGallerySelected():
return gallerySelected(_that);case _EventCameraSelected():
return cameraSelected(_that);case _EventPhotoDeleted():
return photoDeleted(_that);case _EventSaved():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventNameChanged value)?  nameChanged,TResult? Function( _EventSurnameChanged value)?  surnameChanged,TResult? Function( _EventDateOfBirthChanged value)?  dateOfBirthChanged,TResult? Function( _EventGenderChanged value)?  genderChanged,TResult? Function( _EventGallerySelected value)?  gallerySelected,TResult? Function( _EventCameraSelected value)?  cameraSelected,TResult? Function( _EventPhotoDeleted value)?  photoDeleted,TResult? Function( _EventSaved value)?  saved,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventNameChanged() when nameChanged != null:
return nameChanged(_that);case _EventSurnameChanged() when surnameChanged != null:
return surnameChanged(_that);case _EventDateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that);case _EventGenderChanged() when genderChanged != null:
return genderChanged(_that);case _EventGallerySelected() when gallerySelected != null:
return gallerySelected(_that);case _EventCameraSelected() when cameraSelected != null:
return cameraSelected(_that);case _EventPhotoDeleted() when photoDeleted != null:
return photoDeleted(_that);case _EventSaved() when saved != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult Function( String name)?  nameChanged,TResult Function( String surname)?  surnameChanged,TResult Function( DateTime dateOfBirth)?  dateOfBirthChanged,TResult Function( int gender)?  genderChanged,TResult Function()?  gallerySelected,TResult Function()?  cameraSelected,TResult Function()?  photoDeleted,TResult Function()?  saved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventNameChanged() when nameChanged != null:
return nameChanged(_that.name);case _EventSurnameChanged() when surnameChanged != null:
return surnameChanged(_that.surname);case _EventDateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that.dateOfBirth);case _EventGenderChanged() when genderChanged != null:
return genderChanged(_that.gender);case _EventGallerySelected() when gallerySelected != null:
return gallerySelected();case _EventCameraSelected() when cameraSelected != null:
return cameraSelected();case _EventPhotoDeleted() when photoDeleted != null:
return photoDeleted();case _EventSaved() when saved != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserYogaSalaPlus userYogaSalaPlus)  fetched,required TResult Function( String name)  nameChanged,required TResult Function( String surname)  surnameChanged,required TResult Function( DateTime dateOfBirth)  dateOfBirthChanged,required TResult Function( int gender)  genderChanged,required TResult Function()  gallerySelected,required TResult Function()  cameraSelected,required TResult Function()  photoDeleted,required TResult Function()  saved,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that.userYogaSalaPlus);case _EventNameChanged():
return nameChanged(_that.name);case _EventSurnameChanged():
return surnameChanged(_that.surname);case _EventDateOfBirthChanged():
return dateOfBirthChanged(_that.dateOfBirth);case _EventGenderChanged():
return genderChanged(_that.gender);case _EventGallerySelected():
return gallerySelected();case _EventCameraSelected():
return cameraSelected();case _EventPhotoDeleted():
return photoDeleted();case _EventSaved():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult? Function( String name)?  nameChanged,TResult? Function( String surname)?  surnameChanged,TResult? Function( DateTime dateOfBirth)?  dateOfBirthChanged,TResult? Function( int gender)?  genderChanged,TResult? Function()?  gallerySelected,TResult? Function()?  cameraSelected,TResult? Function()?  photoDeleted,TResult? Function()?  saved,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventNameChanged() when nameChanged != null:
return nameChanged(_that.name);case _EventSurnameChanged() when surnameChanged != null:
return surnameChanged(_that.surname);case _EventDateOfBirthChanged() when dateOfBirthChanged != null:
return dateOfBirthChanged(_that.dateOfBirth);case _EventGenderChanged() when genderChanged != null:
return genderChanged(_that.gender);case _EventGallerySelected() when gallerySelected != null:
return gallerySelected();case _EventCameraSelected() when cameraSelected != null:
return cameraSelected();case _EventPhotoDeleted() when photoDeleted != null:
return photoDeleted();case _EventSaved() when saved != null:
return saved();case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched implements ProfileInfoEvent {
  const _EventFetched(this.userYogaSalaPlus);
  

 final  UserYogaSalaPlus userYogaSalaPlus;

/// Create a copy of ProfileInfoEvent
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
  return 'ProfileInfoEvent.fetched(userYogaSalaPlus: $userYogaSalaPlus)';
}


}

/// @nodoc
abstract mixin class _$EventFetchedCopyWith<$Res> implements $ProfileInfoEventCopyWith<$Res> {
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

/// Create a copy of ProfileInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userYogaSalaPlus = null,}) {
  return _then(_EventFetched(
null == userYogaSalaPlus ? _self.userYogaSalaPlus : userYogaSalaPlus // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus,
  ));
}


}

/// @nodoc


class _EventNameChanged implements ProfileInfoEvent {
  const _EventNameChanged(this.name);
  

 final  String name;

/// Create a copy of ProfileInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventNameChangedCopyWith<_EventNameChanged> get copyWith => __$EventNameChangedCopyWithImpl<_EventNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventNameChanged&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'ProfileInfoEvent.nameChanged(name: $name)';
}


}

/// @nodoc
abstract mixin class _$EventNameChangedCopyWith<$Res> implements $ProfileInfoEventCopyWith<$Res> {
  factory _$EventNameChangedCopyWith(_EventNameChanged value, $Res Function(_EventNameChanged) _then) = __$EventNameChangedCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$EventNameChangedCopyWithImpl<$Res>
    implements _$EventNameChangedCopyWith<$Res> {
  __$EventNameChangedCopyWithImpl(this._self, this._then);

  final _EventNameChanged _self;
  final $Res Function(_EventNameChanged) _then;

/// Create a copy of ProfileInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_EventNameChanged(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventSurnameChanged implements ProfileInfoEvent {
  const _EventSurnameChanged(this.surname);
  

 final  String surname;

/// Create a copy of ProfileInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventSurnameChangedCopyWith<_EventSurnameChanged> get copyWith => __$EventSurnameChangedCopyWithImpl<_EventSurnameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventSurnameChanged&&(identical(other.surname, surname) || other.surname == surname));
}


@override
int get hashCode => Object.hash(runtimeType,surname);

@override
String toString() {
  return 'ProfileInfoEvent.surnameChanged(surname: $surname)';
}


}

/// @nodoc
abstract mixin class _$EventSurnameChangedCopyWith<$Res> implements $ProfileInfoEventCopyWith<$Res> {
  factory _$EventSurnameChangedCopyWith(_EventSurnameChanged value, $Res Function(_EventSurnameChanged) _then) = __$EventSurnameChangedCopyWithImpl;
@useResult
$Res call({
 String surname
});




}
/// @nodoc
class __$EventSurnameChangedCopyWithImpl<$Res>
    implements _$EventSurnameChangedCopyWith<$Res> {
  __$EventSurnameChangedCopyWithImpl(this._self, this._then);

  final _EventSurnameChanged _self;
  final $Res Function(_EventSurnameChanged) _then;

/// Create a copy of ProfileInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? surname = null,}) {
  return _then(_EventSurnameChanged(
null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventDateOfBirthChanged implements ProfileInfoEvent {
  const _EventDateOfBirthChanged(this.dateOfBirth);
  

 final  DateTime dateOfBirth;

/// Create a copy of ProfileInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDateOfBirthChangedCopyWith<_EventDateOfBirthChanged> get copyWith => __$EventDateOfBirthChangedCopyWithImpl<_EventDateOfBirthChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDateOfBirthChanged&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth));
}


@override
int get hashCode => Object.hash(runtimeType,dateOfBirth);

@override
String toString() {
  return 'ProfileInfoEvent.dateOfBirthChanged(dateOfBirth: $dateOfBirth)';
}


}

/// @nodoc
abstract mixin class _$EventDateOfBirthChangedCopyWith<$Res> implements $ProfileInfoEventCopyWith<$Res> {
  factory _$EventDateOfBirthChangedCopyWith(_EventDateOfBirthChanged value, $Res Function(_EventDateOfBirthChanged) _then) = __$EventDateOfBirthChangedCopyWithImpl;
@useResult
$Res call({
 DateTime dateOfBirth
});




}
/// @nodoc
class __$EventDateOfBirthChangedCopyWithImpl<$Res>
    implements _$EventDateOfBirthChangedCopyWith<$Res> {
  __$EventDateOfBirthChangedCopyWithImpl(this._self, this._then);

  final _EventDateOfBirthChanged _self;
  final $Res Function(_EventDateOfBirthChanged) _then;

/// Create a copy of ProfileInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dateOfBirth = null,}) {
  return _then(_EventDateOfBirthChanged(
null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _EventGenderChanged implements ProfileInfoEvent {
  const _EventGenderChanged(this.gender);
  

 final  int gender;

/// Create a copy of ProfileInfoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventGenderChangedCopyWith<_EventGenderChanged> get copyWith => __$EventGenderChangedCopyWithImpl<_EventGenderChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventGenderChanged&&(identical(other.gender, gender) || other.gender == gender));
}


@override
int get hashCode => Object.hash(runtimeType,gender);

@override
String toString() {
  return 'ProfileInfoEvent.genderChanged(gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$EventGenderChangedCopyWith<$Res> implements $ProfileInfoEventCopyWith<$Res> {
  factory _$EventGenderChangedCopyWith(_EventGenderChanged value, $Res Function(_EventGenderChanged) _then) = __$EventGenderChangedCopyWithImpl;
@useResult
$Res call({
 int gender
});




}
/// @nodoc
class __$EventGenderChangedCopyWithImpl<$Res>
    implements _$EventGenderChangedCopyWith<$Res> {
  __$EventGenderChangedCopyWithImpl(this._self, this._then);

  final _EventGenderChanged _self;
  final $Res Function(_EventGenderChanged) _then;

/// Create a copy of ProfileInfoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? gender = null,}) {
  return _then(_EventGenderChanged(
null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _EventGallerySelected implements ProfileInfoEvent {
  const _EventGallerySelected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventGallerySelected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileInfoEvent.gallerySelected()';
}


}




/// @nodoc


class _EventCameraSelected implements ProfileInfoEvent {
  const _EventCameraSelected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventCameraSelected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileInfoEvent.cameraSelected()';
}


}




/// @nodoc


class _EventPhotoDeleted implements ProfileInfoEvent {
  const _EventPhotoDeleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventPhotoDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileInfoEvent.photoDeleted()';
}


}




/// @nodoc


class _EventSaved implements ProfileInfoEvent {
  const _EventSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileInfoEvent.saved()';
}


}




/// @nodoc
mixin _$ProfileInfoState {

 DateTime get dateOfBirth; UserYogaSalaPlus? get user; NameValidator get nameInput; NameValidator get surnameInput; int get gender; Uint8List? get imageBytes; bool get removedExisting; FormzSubmissionStatus get status; Failure? get failure;
/// Create a copy of ProfileInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileInfoStateCopyWith<ProfileInfoState> get copyWith => _$ProfileInfoStateCopyWithImpl<ProfileInfoState>(this as ProfileInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInfoState&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.user, user) || other.user == user)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.surnameInput, surnameInput) || other.surnameInput == surnameInput)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.removedExisting, removedExisting) || other.removedExisting == removedExisting)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,dateOfBirth,user,nameInput,surnameInput,gender,const DeepCollectionEquality().hash(imageBytes),removedExisting,status,failure);

@override
String toString() {
  return 'ProfileInfoState(dateOfBirth: $dateOfBirth, user: $user, nameInput: $nameInput, surnameInput: $surnameInput, gender: $gender, imageBytes: $imageBytes, removedExisting: $removedExisting, status: $status, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ProfileInfoStateCopyWith<$Res>  {
  factory $ProfileInfoStateCopyWith(ProfileInfoState value, $Res Function(ProfileInfoState) _then) = _$ProfileInfoStateCopyWithImpl;
@useResult
$Res call({
 DateTime dateOfBirth, UserYogaSalaPlus? user, NameValidator nameInput, NameValidator surnameInput, int gender, Uint8List? imageBytes, bool removedExisting, FormzSubmissionStatus status, Failure? failure
});




}
/// @nodoc
class _$ProfileInfoStateCopyWithImpl<$Res>
    implements $ProfileInfoStateCopyWith<$Res> {
  _$ProfileInfoStateCopyWithImpl(this._self, this._then);

  final ProfileInfoState _self;
  final $Res Function(ProfileInfoState) _then;

/// Create a copy of ProfileInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateOfBirth = null,Object? user = freezed,Object? nameInput = null,Object? surnameInput = null,Object? gender = null,Object? imageBytes = freezed,Object? removedExisting = null,Object? status = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,nameInput: null == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as NameValidator,surnameInput: null == surnameInput ? _self.surnameInput : surnameInput // ignore: cast_nullable_to_non_nullable
as NameValidator,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,imageBytes: freezed == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,removedExisting: null == removedExisting ? _self.removedExisting : removedExisting // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileInfoState].
extension ProfileInfoStatePatterns on ProfileInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileInfoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileInfoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileInfoState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileInfoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileInfoState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileInfoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime dateOfBirth,  UserYogaSalaPlus? user,  NameValidator nameInput,  NameValidator surnameInput,  int gender,  Uint8List? imageBytes,  bool removedExisting,  FormzSubmissionStatus status,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileInfoState() when $default != null:
return $default(_that.dateOfBirth,_that.user,_that.nameInput,_that.surnameInput,_that.gender,_that.imageBytes,_that.removedExisting,_that.status,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime dateOfBirth,  UserYogaSalaPlus? user,  NameValidator nameInput,  NameValidator surnameInput,  int gender,  Uint8List? imageBytes,  bool removedExisting,  FormzSubmissionStatus status,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _ProfileInfoState():
return $default(_that.dateOfBirth,_that.user,_that.nameInput,_that.surnameInput,_that.gender,_that.imageBytes,_that.removedExisting,_that.status,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime dateOfBirth,  UserYogaSalaPlus? user,  NameValidator nameInput,  NameValidator surnameInput,  int gender,  Uint8List? imageBytes,  bool removedExisting,  FormzSubmissionStatus status,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _ProfileInfoState() when $default != null:
return $default(_that.dateOfBirth,_that.user,_that.nameInput,_that.surnameInput,_that.gender,_that.imageBytes,_that.removedExisting,_that.status,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileInfoState extends ProfileInfoState {
  const _ProfileInfoState({required this.dateOfBirth, this.user, this.nameInput = const NameValidator.pure(), this.surnameInput = const NameValidator.pure(), this.gender = -1, this.imageBytes, this.removedExisting = false, this.status = FormzSubmissionStatus.initial, this.failure}): super._();
  

@override final  DateTime dateOfBirth;
@override final  UserYogaSalaPlus? user;
@override@JsonKey() final  NameValidator nameInput;
@override@JsonKey() final  NameValidator surnameInput;
@override@JsonKey() final  int gender;
@override final  Uint8List? imageBytes;
@override@JsonKey() final  bool removedExisting;
@override@JsonKey() final  FormzSubmissionStatus status;
@override final  Failure? failure;

/// Create a copy of ProfileInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileInfoStateCopyWith<_ProfileInfoState> get copyWith => __$ProfileInfoStateCopyWithImpl<_ProfileInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileInfoState&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.user, user) || other.user == user)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.surnameInput, surnameInput) || other.surnameInput == surnameInput)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.removedExisting, removedExisting) || other.removedExisting == removedExisting)&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,dateOfBirth,user,nameInput,surnameInput,gender,const DeepCollectionEquality().hash(imageBytes),removedExisting,status,failure);

@override
String toString() {
  return 'ProfileInfoState(dateOfBirth: $dateOfBirth, user: $user, nameInput: $nameInput, surnameInput: $surnameInput, gender: $gender, imageBytes: $imageBytes, removedExisting: $removedExisting, status: $status, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ProfileInfoStateCopyWith<$Res> implements $ProfileInfoStateCopyWith<$Res> {
  factory _$ProfileInfoStateCopyWith(_ProfileInfoState value, $Res Function(_ProfileInfoState) _then) = __$ProfileInfoStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime dateOfBirth, UserYogaSalaPlus? user, NameValidator nameInput, NameValidator surnameInput, int gender, Uint8List? imageBytes, bool removedExisting, FormzSubmissionStatus status, Failure? failure
});




}
/// @nodoc
class __$ProfileInfoStateCopyWithImpl<$Res>
    implements _$ProfileInfoStateCopyWith<$Res> {
  __$ProfileInfoStateCopyWithImpl(this._self, this._then);

  final _ProfileInfoState _self;
  final $Res Function(_ProfileInfoState) _then;

/// Create a copy of ProfileInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateOfBirth = null,Object? user = freezed,Object? nameInput = null,Object? surnameInput = null,Object? gender = null,Object? imageBytes = freezed,Object? removedExisting = null,Object? status = null,Object? failure = freezed,}) {
  return _then(_ProfileInfoState(
dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,nameInput: null == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as NameValidator,surnameInput: null == surnameInput ? _self.surnameInput : surnameInput // ignore: cast_nullable_to_non_nullable
as NameValidator,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,imageBytes: freezed == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,removedExisting: null == removedExisting ? _self.removedExisting : removedExisting // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
