// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_name_surname_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingNameSurnameEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingNameSurnameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingNameSurnameEvent()';
}


}

/// @nodoc
class $OnboardingNameSurnameEventCopyWith<$Res>  {
$OnboardingNameSurnameEventCopyWith(OnboardingNameSurnameEvent _, $Res Function(OnboardingNameSurnameEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingNameSurnameEvent].
extension OnboardingNameSurnameEventPatterns on OnboardingNameSurnameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventNameChanged value)?  nameChanged,TResult Function( _EventSurnameChanged value)?  surnameChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventNameChanged() when nameChanged != null:
return nameChanged(_that);case _EventSurnameChanged() when surnameChanged != null:
return surnameChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventNameChanged value)  nameChanged,required TResult Function( _EventSurnameChanged value)  surnameChanged,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventNameChanged():
return nameChanged(_that);case _EventSurnameChanged():
return surnameChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventNameChanged value)?  nameChanged,TResult? Function( _EventSurnameChanged value)?  surnameChanged,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventNameChanged() when nameChanged != null:
return nameChanged(_that);case _EventSurnameChanged() when surnameChanged != null:
return surnameChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult Function( String name)?  nameChanged,TResult Function( String surname)?  surnameChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventNameChanged() when nameChanged != null:
return nameChanged(_that.name);case _EventSurnameChanged() when surnameChanged != null:
return surnameChanged(_that.surname);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( UserYogaSalaPlus userYogaSalaPlus)  fetched,required TResult Function( String name)  nameChanged,required TResult Function( String surname)  surnameChanged,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that.userYogaSalaPlus);case _EventNameChanged():
return nameChanged(_that.name);case _EventSurnameChanged():
return surnameChanged(_that.surname);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( UserYogaSalaPlus userYogaSalaPlus)?  fetched,TResult? Function( String name)?  nameChanged,TResult? Function( String surname)?  surnameChanged,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.userYogaSalaPlus);case _EventNameChanged() when nameChanged != null:
return nameChanged(_that.name);case _EventSurnameChanged() when surnameChanged != null:
return surnameChanged(_that.surname);case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched implements OnboardingNameSurnameEvent {
  const _EventFetched(this.userYogaSalaPlus);
  

 final  UserYogaSalaPlus userYogaSalaPlus;

/// Create a copy of OnboardingNameSurnameEvent
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
  return 'OnboardingNameSurnameEvent.fetched(userYogaSalaPlus: $userYogaSalaPlus)';
}


}

/// @nodoc
abstract mixin class _$EventFetchedCopyWith<$Res> implements $OnboardingNameSurnameEventCopyWith<$Res> {
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

/// Create a copy of OnboardingNameSurnameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userYogaSalaPlus = null,}) {
  return _then(_EventFetched(
null == userYogaSalaPlus ? _self.userYogaSalaPlus : userYogaSalaPlus // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus,
  ));
}


}

/// @nodoc


class _EventNameChanged implements OnboardingNameSurnameEvent {
  const _EventNameChanged(this.name);
  

 final  String name;

/// Create a copy of OnboardingNameSurnameEvent
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
  return 'OnboardingNameSurnameEvent.nameChanged(name: $name)';
}


}

/// @nodoc
abstract mixin class _$EventNameChangedCopyWith<$Res> implements $OnboardingNameSurnameEventCopyWith<$Res> {
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

/// Create a copy of OnboardingNameSurnameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_EventNameChanged(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventSurnameChanged implements OnboardingNameSurnameEvent {
  const _EventSurnameChanged(this.surname);
  

 final  String surname;

/// Create a copy of OnboardingNameSurnameEvent
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
  return 'OnboardingNameSurnameEvent.surnameChanged(surname: $surname)';
}


}

/// @nodoc
abstract mixin class _$EventSurnameChangedCopyWith<$Res> implements $OnboardingNameSurnameEventCopyWith<$Res> {
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

/// Create a copy of OnboardingNameSurnameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? surname = null,}) {
  return _then(_EventSurnameChanged(
null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$OnboardingNameSurnameState {

 UserYogaSalaPlus? get user; NameValidator get nameInput; NameValidator get surnameInput;
/// Create a copy of OnboardingNameSurnameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingNameSurnameStateCopyWith<OnboardingNameSurnameState> get copyWith => _$OnboardingNameSurnameStateCopyWithImpl<OnboardingNameSurnameState>(this as OnboardingNameSurnameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingNameSurnameState&&(identical(other.user, user) || other.user == user)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.surnameInput, surnameInput) || other.surnameInput == surnameInput));
}


@override
int get hashCode => Object.hash(runtimeType,user,nameInput,surnameInput);

@override
String toString() {
  return 'OnboardingNameSurnameState(user: $user, nameInput: $nameInput, surnameInput: $surnameInput)';
}


}

/// @nodoc
abstract mixin class $OnboardingNameSurnameStateCopyWith<$Res>  {
  factory $OnboardingNameSurnameStateCopyWith(OnboardingNameSurnameState value, $Res Function(OnboardingNameSurnameState) _then) = _$OnboardingNameSurnameStateCopyWithImpl;
@useResult
$Res call({
 UserYogaSalaPlus? user, NameValidator nameInput, NameValidator surnameInput
});




}
/// @nodoc
class _$OnboardingNameSurnameStateCopyWithImpl<$Res>
    implements $OnboardingNameSurnameStateCopyWith<$Res> {
  _$OnboardingNameSurnameStateCopyWithImpl(this._self, this._then);

  final OnboardingNameSurnameState _self;
  final $Res Function(OnboardingNameSurnameState) _then;

/// Create a copy of OnboardingNameSurnameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? nameInput = null,Object? surnameInput = null,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,nameInput: null == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as NameValidator,surnameInput: null == surnameInput ? _self.surnameInput : surnameInput // ignore: cast_nullable_to_non_nullable
as NameValidator,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingNameSurnameState].
extension OnboardingNameSurnameStatePatterns on OnboardingNameSurnameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingNameSurnameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingNameSurnameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingNameSurnameState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingNameSurnameState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingNameSurnameState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingNameSurnameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserYogaSalaPlus? user,  NameValidator nameInput,  NameValidator surnameInput)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingNameSurnameState() when $default != null:
return $default(_that.user,_that.nameInput,_that.surnameInput);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserYogaSalaPlus? user,  NameValidator nameInput,  NameValidator surnameInput)  $default,) {final _that = this;
switch (_that) {
case _OnboardingNameSurnameState():
return $default(_that.user,_that.nameInput,_that.surnameInput);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserYogaSalaPlus? user,  NameValidator nameInput,  NameValidator surnameInput)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingNameSurnameState() when $default != null:
return $default(_that.user,_that.nameInput,_that.surnameInput);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingNameSurnameState extends OnboardingNameSurnameState {
  const _OnboardingNameSurnameState({this.user, this.nameInput = const NameValidator.pure(), this.surnameInput = const NameValidator.pure()}): super._();
  

@override final  UserYogaSalaPlus? user;
@override@JsonKey() final  NameValidator nameInput;
@override@JsonKey() final  NameValidator surnameInput;

/// Create a copy of OnboardingNameSurnameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingNameSurnameStateCopyWith<_OnboardingNameSurnameState> get copyWith => __$OnboardingNameSurnameStateCopyWithImpl<_OnboardingNameSurnameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingNameSurnameState&&(identical(other.user, user) || other.user == user)&&(identical(other.nameInput, nameInput) || other.nameInput == nameInput)&&(identical(other.surnameInput, surnameInput) || other.surnameInput == surnameInput));
}


@override
int get hashCode => Object.hash(runtimeType,user,nameInput,surnameInput);

@override
String toString() {
  return 'OnboardingNameSurnameState(user: $user, nameInput: $nameInput, surnameInput: $surnameInput)';
}


}

/// @nodoc
abstract mixin class _$OnboardingNameSurnameStateCopyWith<$Res> implements $OnboardingNameSurnameStateCopyWith<$Res> {
  factory _$OnboardingNameSurnameStateCopyWith(_OnboardingNameSurnameState value, $Res Function(_OnboardingNameSurnameState) _then) = __$OnboardingNameSurnameStateCopyWithImpl;
@override @useResult
$Res call({
 UserYogaSalaPlus? user, NameValidator nameInput, NameValidator surnameInput
});




}
/// @nodoc
class __$OnboardingNameSurnameStateCopyWithImpl<$Res>
    implements _$OnboardingNameSurnameStateCopyWith<$Res> {
  __$OnboardingNameSurnameStateCopyWithImpl(this._self, this._then);

  final _OnboardingNameSurnameState _self;
  final $Res Function(_OnboardingNameSurnameState) _then;

/// Create a copy of OnboardingNameSurnameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? nameInput = null,Object? surnameInput = null,}) {
  return _then(_OnboardingNameSurnameState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserYogaSalaPlus?,nameInput: null == nameInput ? _self.nameInput : nameInput // ignore: cast_nullable_to_non_nullable
as NameValidator,surnameInput: null == surnameInput ? _self.surnameInput : surnameInput // ignore: cast_nullable_to_non_nullable
as NameValidator,
  ));
}


}

// dart format on
