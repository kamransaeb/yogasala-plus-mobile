// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpEvent()';
}


}

/// @nodoc
class $SignUpEventCopyWith<$Res>  {
$SignUpEventCopyWith(SignUpEvent _, $Res Function(SignUpEvent) __);
}


/// Adds pattern-matching-related methods to [SignUpEvent].
extension SignUpEventPatterns on SignUpEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventEmailChanged value)?  emailChanged,TResult Function( _EventPasswordChanged value)?  passwordChanged,TResult Function( _EventConfirmedPasswordChanged value)?  confirmedPasswordChanged,TResult Function( _EventSubmitted value)?  submitted,TResult Function( _EventReset value)?  reset,TResult Function( _EventAuthFailed value)?  authFailed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventEmailChanged() when emailChanged != null:
return emailChanged(_that);case _EventPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _EventConfirmedPasswordChanged() when confirmedPasswordChanged != null:
return confirmedPasswordChanged(_that);case _EventSubmitted() when submitted != null:
return submitted(_that);case _EventReset() when reset != null:
return reset(_that);case _EventAuthFailed() when authFailed != null:
return authFailed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventEmailChanged value)  emailChanged,required TResult Function( _EventPasswordChanged value)  passwordChanged,required TResult Function( _EventConfirmedPasswordChanged value)  confirmedPasswordChanged,required TResult Function( _EventSubmitted value)  submitted,required TResult Function( _EventReset value)  reset,required TResult Function( _EventAuthFailed value)  authFailed,}){
final _that = this;
switch (_that) {
case _EventEmailChanged():
return emailChanged(_that);case _EventPasswordChanged():
return passwordChanged(_that);case _EventConfirmedPasswordChanged():
return confirmedPasswordChanged(_that);case _EventSubmitted():
return submitted(_that);case _EventReset():
return reset(_that);case _EventAuthFailed():
return authFailed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventEmailChanged value)?  emailChanged,TResult? Function( _EventPasswordChanged value)?  passwordChanged,TResult? Function( _EventConfirmedPasswordChanged value)?  confirmedPasswordChanged,TResult? Function( _EventSubmitted value)?  submitted,TResult? Function( _EventReset value)?  reset,TResult? Function( _EventAuthFailed value)?  authFailed,}){
final _that = this;
switch (_that) {
case _EventEmailChanged() when emailChanged != null:
return emailChanged(_that);case _EventPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _EventConfirmedPasswordChanged() when confirmedPasswordChanged != null:
return confirmedPasswordChanged(_that);case _EventSubmitted() when submitted != null:
return submitted(_that);case _EventReset() when reset != null:
return reset(_that);case _EventAuthFailed() when authFailed != null:
return authFailed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  emailChanged,TResult Function( String password)?  passwordChanged,TResult Function( String confirmedPassword)?  confirmedPasswordChanged,TResult Function()?  submitted,TResult Function()?  reset,TResult Function()?  authFailed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventEmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _EventPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case _EventConfirmedPasswordChanged() when confirmedPasswordChanged != null:
return confirmedPasswordChanged(_that.confirmedPassword);case _EventSubmitted() when submitted != null:
return submitted();case _EventReset() when reset != null:
return reset();case _EventAuthFailed() when authFailed != null:
return authFailed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  emailChanged,required TResult Function( String password)  passwordChanged,required TResult Function( String confirmedPassword)  confirmedPasswordChanged,required TResult Function()  submitted,required TResult Function()  reset,required TResult Function()  authFailed,}) {final _that = this;
switch (_that) {
case _EventEmailChanged():
return emailChanged(_that.email);case _EventPasswordChanged():
return passwordChanged(_that.password);case _EventConfirmedPasswordChanged():
return confirmedPasswordChanged(_that.confirmedPassword);case _EventSubmitted():
return submitted();case _EventReset():
return reset();case _EventAuthFailed():
return authFailed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  emailChanged,TResult? Function( String password)?  passwordChanged,TResult? Function( String confirmedPassword)?  confirmedPasswordChanged,TResult? Function()?  submitted,TResult? Function()?  reset,TResult? Function()?  authFailed,}) {final _that = this;
switch (_that) {
case _EventEmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _EventPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case _EventConfirmedPasswordChanged() when confirmedPasswordChanged != null:
return confirmedPasswordChanged(_that.confirmedPassword);case _EventSubmitted() when submitted != null:
return submitted();case _EventReset() when reset != null:
return reset();case _EventAuthFailed() when authFailed != null:
return authFailed();case _:
  return null;

}
}

}

/// @nodoc


class _EventEmailChanged implements SignUpEvent {
  const _EventEmailChanged(this.email);
  

 final  String email;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventEmailChangedCopyWith<_EventEmailChanged> get copyWith => __$EventEmailChangedCopyWithImpl<_EventEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventEmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'SignUpEvent.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class _$EventEmailChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory _$EventEmailChangedCopyWith(_EventEmailChanged value, $Res Function(_EventEmailChanged) _then) = __$EventEmailChangedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$EventEmailChangedCopyWithImpl<$Res>
    implements _$EventEmailChangedCopyWith<$Res> {
  __$EventEmailChangedCopyWithImpl(this._self, this._then);

  final _EventEmailChanged _self;
  final $Res Function(_EventEmailChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_EventEmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventPasswordChanged implements SignUpEvent {
  const _EventPasswordChanged(this.password);
  

 final  String password;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventPasswordChangedCopyWith<_EventPasswordChanged> get copyWith => __$EventPasswordChangedCopyWithImpl<_EventPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventPasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'SignUpEvent.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class _$EventPasswordChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory _$EventPasswordChangedCopyWith(_EventPasswordChanged value, $Res Function(_EventPasswordChanged) _then) = __$EventPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class __$EventPasswordChangedCopyWithImpl<$Res>
    implements _$EventPasswordChangedCopyWith<$Res> {
  __$EventPasswordChangedCopyWithImpl(this._self, this._then);

  final _EventPasswordChanged _self;
  final $Res Function(_EventPasswordChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(_EventPasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventConfirmedPasswordChanged implements SignUpEvent {
  const _EventConfirmedPasswordChanged(this.confirmedPassword);
  

 final  String confirmedPassword;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventConfirmedPasswordChangedCopyWith<_EventConfirmedPasswordChanged> get copyWith => __$EventConfirmedPasswordChangedCopyWithImpl<_EventConfirmedPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventConfirmedPasswordChanged&&(identical(other.confirmedPassword, confirmedPassword) || other.confirmedPassword == confirmedPassword));
}


@override
int get hashCode => Object.hash(runtimeType,confirmedPassword);

@override
String toString() {
  return 'SignUpEvent.confirmedPasswordChanged(confirmedPassword: $confirmedPassword)';
}


}

/// @nodoc
abstract mixin class _$EventConfirmedPasswordChangedCopyWith<$Res> implements $SignUpEventCopyWith<$Res> {
  factory _$EventConfirmedPasswordChangedCopyWith(_EventConfirmedPasswordChanged value, $Res Function(_EventConfirmedPasswordChanged) _then) = __$EventConfirmedPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String confirmedPassword
});




}
/// @nodoc
class __$EventConfirmedPasswordChangedCopyWithImpl<$Res>
    implements _$EventConfirmedPasswordChangedCopyWith<$Res> {
  __$EventConfirmedPasswordChangedCopyWithImpl(this._self, this._then);

  final _EventConfirmedPasswordChanged _self;
  final $Res Function(_EventConfirmedPasswordChanged) _then;

/// Create a copy of SignUpEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? confirmedPassword = null,}) {
  return _then(_EventConfirmedPasswordChanged(
null == confirmedPassword ? _self.confirmedPassword : confirmedPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventSubmitted implements SignUpEvent {
  const _EventSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpEvent.submitted()';
}


}




/// @nodoc


class _EventReset implements SignUpEvent {
  const _EventReset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpEvent.reset()';
}


}




/// @nodoc


class _EventAuthFailed implements SignUpEvent {
  const _EventAuthFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventAuthFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpEvent.authFailed()';
}


}




/// @nodoc
mixin _$SignUpState {

 UserEmailValidator get email; UserPasswordValidator get password; ConfirmedPasswordValidator get confirmedPassword; FormzSubmissionStatus get status;
/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateCopyWith<SignUpState> get copyWith => _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmedPassword, confirmedPassword) || other.confirmedPassword == confirmedPassword)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,confirmedPassword,status);

@override
String toString() {
  return 'SignUpState(email: $email, password: $password, confirmedPassword: $confirmedPassword, status: $status)';
}


}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res>  {
  factory $SignUpStateCopyWith(SignUpState value, $Res Function(SignUpState) _then) = _$SignUpStateCopyWithImpl;
@useResult
$Res call({
 UserEmailValidator email, UserPasswordValidator password, ConfirmedPasswordValidator confirmedPassword, FormzSubmissionStatus status
});




}
/// @nodoc
class _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? confirmedPassword = null,Object? status = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as UserEmailValidator,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as UserPasswordValidator,confirmedPassword: null == confirmedPassword ? _self.confirmedPassword : confirmedPassword // ignore: cast_nullable_to_non_nullable
as ConfirmedPasswordValidator,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpState].
extension SignUpStatePatterns on SignUpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpState value)  $default,){
final _that = this;
switch (_that) {
case _SignUpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpState value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserEmailValidator email,  UserPasswordValidator password,  ConfirmedPasswordValidator confirmedPassword,  FormzSubmissionStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
return $default(_that.email,_that.password,_that.confirmedPassword,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserEmailValidator email,  UserPasswordValidator password,  ConfirmedPasswordValidator confirmedPassword,  FormzSubmissionStatus status)  $default,) {final _that = this;
switch (_that) {
case _SignUpState():
return $default(_that.email,_that.password,_that.confirmedPassword,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserEmailValidator email,  UserPasswordValidator password,  ConfirmedPasswordValidator confirmedPassword,  FormzSubmissionStatus status)?  $default,) {final _that = this;
switch (_that) {
case _SignUpState() when $default != null:
return $default(_that.email,_that.password,_that.confirmedPassword,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpState extends SignUpState {
  const _SignUpState({this.email = const UserEmailValidator.pure(), this.password = const UserPasswordValidator.pure(), this.confirmedPassword = const ConfirmedPasswordValidator.pure(), this.status = FormzSubmissionStatus.initial}): super._();
  

@override@JsonKey() final  UserEmailValidator email;
@override@JsonKey() final  UserPasswordValidator password;
@override@JsonKey() final  ConfirmedPasswordValidator confirmedPassword;
@override@JsonKey() final  FormzSubmissionStatus status;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpStateCopyWith<_SignUpState> get copyWith => __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmedPassword, confirmedPassword) || other.confirmedPassword == confirmedPassword)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,confirmedPassword,status);

@override
String toString() {
  return 'SignUpState(email: $email, password: $password, confirmedPassword: $confirmedPassword, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SignUpStateCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(_SignUpState value, $Res Function(_SignUpState) _then) = __$SignUpStateCopyWithImpl;
@override @useResult
$Res call({
 UserEmailValidator email, UserPasswordValidator password, ConfirmedPasswordValidator confirmedPassword, FormzSubmissionStatus status
});




}
/// @nodoc
class __$SignUpStateCopyWithImpl<$Res>
    implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(this._self, this._then);

  final _SignUpState _self;
  final $Res Function(_SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? confirmedPassword = null,Object? status = null,}) {
  return _then(_SignUpState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as UserEmailValidator,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as UserPasswordValidator,confirmedPassword: null == confirmedPassword ? _self.confirmedPassword : confirmedPassword // ignore: cast_nullable_to_non_nullable
as ConfirmedPasswordValidator,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,
  ));
}


}

// dart format on
