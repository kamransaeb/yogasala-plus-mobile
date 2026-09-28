// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventCheckStatusRequested value)?  checkStatusRequested,TResult Function( _EventLoginRequested value)?  loginRequested,TResult Function( _EventSignUpRequested value)?  signUpRequested,TResult Function( _EventResetPasswordRequested value)?  resetPasswordRequested,TResult Function( _EventLogoutRequested value)?  logoutRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventCheckStatusRequested() when checkStatusRequested != null:
return checkStatusRequested(_that);case _EventLoginRequested() when loginRequested != null:
return loginRequested(_that);case _EventSignUpRequested() when signUpRequested != null:
return signUpRequested(_that);case _EventResetPasswordRequested() when resetPasswordRequested != null:
return resetPasswordRequested(_that);case _EventLogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventCheckStatusRequested value)  checkStatusRequested,required TResult Function( _EventLoginRequested value)  loginRequested,required TResult Function( _EventSignUpRequested value)  signUpRequested,required TResult Function( _EventResetPasswordRequested value)  resetPasswordRequested,required TResult Function( _EventLogoutRequested value)  logoutRequested,}){
final _that = this;
switch (_that) {
case _EventCheckStatusRequested():
return checkStatusRequested(_that);case _EventLoginRequested():
return loginRequested(_that);case _EventSignUpRequested():
return signUpRequested(_that);case _EventResetPasswordRequested():
return resetPasswordRequested(_that);case _EventLogoutRequested():
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventCheckStatusRequested value)?  checkStatusRequested,TResult? Function( _EventLoginRequested value)?  loginRequested,TResult? Function( _EventSignUpRequested value)?  signUpRequested,TResult? Function( _EventResetPasswordRequested value)?  resetPasswordRequested,TResult? Function( _EventLogoutRequested value)?  logoutRequested,}){
final _that = this;
switch (_that) {
case _EventCheckStatusRequested() when checkStatusRequested != null:
return checkStatusRequested(_that);case _EventLoginRequested() when loginRequested != null:
return loginRequested(_that);case _EventSignUpRequested() when signUpRequested != null:
return signUpRequested(_that);case _EventResetPasswordRequested() when resetPasswordRequested != null:
return resetPasswordRequested(_that);case _EventLogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkStatusRequested,TResult Function( String email,  String password)?  loginRequested,TResult Function( String email,  String password)?  signUpRequested,TResult Function( String email)?  resetPasswordRequested,TResult Function()?  logoutRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventCheckStatusRequested() when checkStatusRequested != null:
return checkStatusRequested();case _EventLoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case _EventSignUpRequested() when signUpRequested != null:
return signUpRequested(_that.email,_that.password);case _EventResetPasswordRequested() when resetPasswordRequested != null:
return resetPasswordRequested(_that.email);case _EventLogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkStatusRequested,required TResult Function( String email,  String password)  loginRequested,required TResult Function( String email,  String password)  signUpRequested,required TResult Function( String email)  resetPasswordRequested,required TResult Function()  logoutRequested,}) {final _that = this;
switch (_that) {
case _EventCheckStatusRequested():
return checkStatusRequested();case _EventLoginRequested():
return loginRequested(_that.email,_that.password);case _EventSignUpRequested():
return signUpRequested(_that.email,_that.password);case _EventResetPasswordRequested():
return resetPasswordRequested(_that.email);case _EventLogoutRequested():
return logoutRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkStatusRequested,TResult? Function( String email,  String password)?  loginRequested,TResult? Function( String email,  String password)?  signUpRequested,TResult? Function( String email)?  resetPasswordRequested,TResult? Function()?  logoutRequested,}) {final _that = this;
switch (_that) {
case _EventCheckStatusRequested() when checkStatusRequested != null:
return checkStatusRequested();case _EventLoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case _EventSignUpRequested() when signUpRequested != null:
return signUpRequested(_that.email,_that.password);case _EventResetPasswordRequested() when resetPasswordRequested != null:
return resetPasswordRequested(_that.email);case _EventLogoutRequested() when logoutRequested != null:
return logoutRequested();case _:
  return null;

}
}

}

/// @nodoc


class _EventCheckStatusRequested extends AuthEvent {
  const _EventCheckStatusRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventCheckStatusRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkStatusRequested()';
}


}




/// @nodoc


class _EventLoginRequested extends AuthEvent {
  const _EventLoginRequested({required this.email, required this.password}): super._();
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventLoginRequestedCopyWith<_EventLoginRequested> get copyWith => __$EventLoginRequestedCopyWithImpl<_EventLoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventLoginRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.loginRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$EventLoginRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$EventLoginRequestedCopyWith(_EventLoginRequested value, $Res Function(_EventLoginRequested) _then) = __$EventLoginRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$EventLoginRequestedCopyWithImpl<$Res>
    implements _$EventLoginRequestedCopyWith<$Res> {
  __$EventLoginRequestedCopyWithImpl(this._self, this._then);

  final _EventLoginRequested _self;
  final $Res Function(_EventLoginRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_EventLoginRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventSignUpRequested extends AuthEvent {
  const _EventSignUpRequested({required this.email, required this.password}): super._();
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventSignUpRequestedCopyWith<_EventSignUpRequested> get copyWith => __$EventSignUpRequestedCopyWithImpl<_EventSignUpRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventSignUpRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.signUpRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$EventSignUpRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$EventSignUpRequestedCopyWith(_EventSignUpRequested value, $Res Function(_EventSignUpRequested) _then) = __$EventSignUpRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$EventSignUpRequestedCopyWithImpl<$Res>
    implements _$EventSignUpRequestedCopyWith<$Res> {
  __$EventSignUpRequestedCopyWithImpl(this._self, this._then);

  final _EventSignUpRequested _self;
  final $Res Function(_EventSignUpRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_EventSignUpRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventResetPasswordRequested extends AuthEvent {
  const _EventResetPasswordRequested({required this.email}): super._();
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventResetPasswordRequestedCopyWith<_EventResetPasswordRequested> get copyWith => __$EventResetPasswordRequestedCopyWithImpl<_EventResetPasswordRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventResetPasswordRequested&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthEvent.resetPasswordRequested(email: $email)';
}


}

/// @nodoc
abstract mixin class _$EventResetPasswordRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$EventResetPasswordRequestedCopyWith(_EventResetPasswordRequested value, $Res Function(_EventResetPasswordRequested) _then) = __$EventResetPasswordRequestedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$EventResetPasswordRequestedCopyWithImpl<$Res>
    implements _$EventResetPasswordRequestedCopyWith<$Res> {
  __$EventResetPasswordRequestedCopyWithImpl(this._self, this._then);

  final _EventResetPasswordRequested _self;
  final $Res Function(_EventResetPasswordRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_EventResetPasswordRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventLogoutRequested extends AuthEvent {
  const _EventLogoutRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventLogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutRequested()';
}


}




/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StateInitial value)?  initial,TResult Function( _StateChecking value)?  checking,TResult Function( _StateLoading value)?  loading,TResult Function( _StateAuthenticated value)?  authenticated,TResult Function( _StateUnauthenticated value)?  unauthenticated,TResult Function( _StateFailure value)?  failure,TResult Function( _StateSignUpSuccess value)?  signUpSuccess,TResult Function( _StateSignUpFailure value)?  signUpFailure,TResult Function( _StateResetPasswordSuccess value)?  resetPasswordSuccess,TResult Function( _StateResetPasswordFailure value)?  resetPasswordFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that);case _StateChecking() when checking != null:
return checking(_that);case _StateLoading() when loading != null:
return loading(_that);case _StateAuthenticated() when authenticated != null:
return authenticated(_that);case _StateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _StateFailure() when failure != null:
return failure(_that);case _StateSignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that);case _StateSignUpFailure() when signUpFailure != null:
return signUpFailure(_that);case _StateResetPasswordSuccess() when resetPasswordSuccess != null:
return resetPasswordSuccess(_that);case _StateResetPasswordFailure() when resetPasswordFailure != null:
return resetPasswordFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StateInitial value)  initial,required TResult Function( _StateChecking value)  checking,required TResult Function( _StateLoading value)  loading,required TResult Function( _StateAuthenticated value)  authenticated,required TResult Function( _StateUnauthenticated value)  unauthenticated,required TResult Function( _StateFailure value)  failure,required TResult Function( _StateSignUpSuccess value)  signUpSuccess,required TResult Function( _StateSignUpFailure value)  signUpFailure,required TResult Function( _StateResetPasswordSuccess value)  resetPasswordSuccess,required TResult Function( _StateResetPasswordFailure value)  resetPasswordFailure,}){
final _that = this;
switch (_that) {
case _StateInitial():
return initial(_that);case _StateChecking():
return checking(_that);case _StateLoading():
return loading(_that);case _StateAuthenticated():
return authenticated(_that);case _StateUnauthenticated():
return unauthenticated(_that);case _StateFailure():
return failure(_that);case _StateSignUpSuccess():
return signUpSuccess(_that);case _StateSignUpFailure():
return signUpFailure(_that);case _StateResetPasswordSuccess():
return resetPasswordSuccess(_that);case _StateResetPasswordFailure():
return resetPasswordFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StateInitial value)?  initial,TResult? Function( _StateChecking value)?  checking,TResult? Function( _StateLoading value)?  loading,TResult? Function( _StateAuthenticated value)?  authenticated,TResult? Function( _StateUnauthenticated value)?  unauthenticated,TResult? Function( _StateFailure value)?  failure,TResult? Function( _StateSignUpSuccess value)?  signUpSuccess,TResult? Function( _StateSignUpFailure value)?  signUpFailure,TResult? Function( _StateResetPasswordSuccess value)?  resetPasswordSuccess,TResult? Function( _StateResetPasswordFailure value)?  resetPasswordFailure,}){
final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that);case _StateChecking() when checking != null:
return checking(_that);case _StateLoading() when loading != null:
return loading(_that);case _StateAuthenticated() when authenticated != null:
return authenticated(_that);case _StateUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _StateFailure() when failure != null:
return failure(_that);case _StateSignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that);case _StateSignUpFailure() when signUpFailure != null:
return signUpFailure(_that);case _StateResetPasswordSuccess() when resetPasswordSuccess != null:
return resetPasswordSuccess(_that);case _StateResetPasswordFailure() when resetPasswordFailure != null:
return resetPasswordFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  checking,TResult Function()?  loading,TResult Function( AuthUser authUser)?  authenticated,TResult Function()?  unauthenticated,TResult Function( Failure failure)?  failure,TResult Function( String email,  String password)?  signUpSuccess,TResult Function( Failure failure)?  signUpFailure,TResult Function( String email)?  resetPasswordSuccess,TResult Function( Failure failure)?  resetPasswordFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateChecking() when checking != null:
return checking();case _StateLoading() when loading != null:
return loading();case _StateAuthenticated() when authenticated != null:
return authenticated(_that.authUser);case _StateUnauthenticated() when unauthenticated != null:
return unauthenticated();case _StateFailure() when failure != null:
return failure(_that.failure);case _StateSignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that.email,_that.password);case _StateSignUpFailure() when signUpFailure != null:
return signUpFailure(_that.failure);case _StateResetPasswordSuccess() when resetPasswordSuccess != null:
return resetPasswordSuccess(_that.email);case _StateResetPasswordFailure() when resetPasswordFailure != null:
return resetPasswordFailure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  checking,required TResult Function()  loading,required TResult Function( AuthUser authUser)  authenticated,required TResult Function()  unauthenticated,required TResult Function( Failure failure)  failure,required TResult Function( String email,  String password)  signUpSuccess,required TResult Function( Failure failure)  signUpFailure,required TResult Function( String email)  resetPasswordSuccess,required TResult Function( Failure failure)  resetPasswordFailure,}) {final _that = this;
switch (_that) {
case _StateInitial():
return initial();case _StateChecking():
return checking();case _StateLoading():
return loading();case _StateAuthenticated():
return authenticated(_that.authUser);case _StateUnauthenticated():
return unauthenticated();case _StateFailure():
return failure(_that.failure);case _StateSignUpSuccess():
return signUpSuccess(_that.email,_that.password);case _StateSignUpFailure():
return signUpFailure(_that.failure);case _StateResetPasswordSuccess():
return resetPasswordSuccess(_that.email);case _StateResetPasswordFailure():
return resetPasswordFailure(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  checking,TResult? Function()?  loading,TResult? Function( AuthUser authUser)?  authenticated,TResult? Function()?  unauthenticated,TResult? Function( Failure failure)?  failure,TResult? Function( String email,  String password)?  signUpSuccess,TResult? Function( Failure failure)?  signUpFailure,TResult? Function( String email)?  resetPasswordSuccess,TResult? Function( Failure failure)?  resetPasswordFailure,}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateChecking() when checking != null:
return checking();case _StateLoading() when loading != null:
return loading();case _StateAuthenticated() when authenticated != null:
return authenticated(_that.authUser);case _StateUnauthenticated() when unauthenticated != null:
return unauthenticated();case _StateFailure() when failure != null:
return failure(_that.failure);case _StateSignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that.email,_that.password);case _StateSignUpFailure() when signUpFailure != null:
return signUpFailure(_that.failure);case _StateResetPasswordSuccess() when resetPasswordSuccess != null:
return resetPasswordSuccess(_that.email);case _StateResetPasswordFailure() when resetPasswordFailure != null:
return resetPasswordFailure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StateInitial extends AuthState {
  const _StateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _StateChecking extends AuthState {
  const _StateChecking(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateChecking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.checking()';
}


}




/// @nodoc


class _StateLoading extends AuthState {
  const _StateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _StateAuthenticated extends AuthState {
  const _StateAuthenticated({required this.authUser}): super._();
  

 final  AuthUser authUser;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateAuthenticatedCopyWith<_StateAuthenticated> get copyWith => __$StateAuthenticatedCopyWithImpl<_StateAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateAuthenticated&&(identical(other.authUser, authUser) || other.authUser == authUser));
}


@override
int get hashCode => Object.hash(runtimeType,authUser);

@override
String toString() {
  return 'AuthState.authenticated(authUser: $authUser)';
}


}

/// @nodoc
abstract mixin class _$StateAuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$StateAuthenticatedCopyWith(_StateAuthenticated value, $Res Function(_StateAuthenticated) _then) = __$StateAuthenticatedCopyWithImpl;
@useResult
$Res call({
 AuthUser authUser
});




}
/// @nodoc
class __$StateAuthenticatedCopyWithImpl<$Res>
    implements _$StateAuthenticatedCopyWith<$Res> {
  __$StateAuthenticatedCopyWithImpl(this._self, this._then);

  final _StateAuthenticated _self;
  final $Res Function(_StateAuthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authUser = null,}) {
  return _then(_StateAuthenticated(
authUser: null == authUser ? _self.authUser : authUser // ignore: cast_nullable_to_non_nullable
as AuthUser,
  ));
}


}

/// @nodoc


class _StateUnauthenticated extends AuthState {
  const _StateUnauthenticated(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthenticated()';
}


}




/// @nodoc


class _StateFailure extends AuthState {
  const _StateFailure({required this.failure}): super._();
  

 final  Failure failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateFailureCopyWith<_StateFailure> get copyWith => __$StateFailureCopyWithImpl<_StateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AuthState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StateFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$StateFailureCopyWith(_StateFailure value, $Res Function(_StateFailure) _then) = __$StateFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$StateFailureCopyWithImpl<$Res>
    implements _$StateFailureCopyWith<$Res> {
  __$StateFailureCopyWithImpl(this._self, this._then);

  final _StateFailure _self;
  final $Res Function(_StateFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_StateFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class _StateSignUpSuccess extends AuthState {
  const _StateSignUpSuccess({required this.email, required this.password}): super._();
  

 final  String email;
 final  String password;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateSignUpSuccessCopyWith<_StateSignUpSuccess> get copyWith => __$StateSignUpSuccessCopyWithImpl<_StateSignUpSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateSignUpSuccess&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthState.signUpSuccess(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$StateSignUpSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$StateSignUpSuccessCopyWith(_StateSignUpSuccess value, $Res Function(_StateSignUpSuccess) _then) = __$StateSignUpSuccessCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$StateSignUpSuccessCopyWithImpl<$Res>
    implements _$StateSignUpSuccessCopyWith<$Res> {
  __$StateSignUpSuccessCopyWithImpl(this._self, this._then);

  final _StateSignUpSuccess _self;
  final $Res Function(_StateSignUpSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_StateSignUpSuccess(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StateSignUpFailure extends AuthState {
  const _StateSignUpFailure({required this.failure}): super._();
  

 final  Failure failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateSignUpFailureCopyWith<_StateSignUpFailure> get copyWith => __$StateSignUpFailureCopyWithImpl<_StateSignUpFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateSignUpFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AuthState.signUpFailure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StateSignUpFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$StateSignUpFailureCopyWith(_StateSignUpFailure value, $Res Function(_StateSignUpFailure) _then) = __$StateSignUpFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$StateSignUpFailureCopyWithImpl<$Res>
    implements _$StateSignUpFailureCopyWith<$Res> {
  __$StateSignUpFailureCopyWithImpl(this._self, this._then);

  final _StateSignUpFailure _self;
  final $Res Function(_StateSignUpFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_StateSignUpFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class _StateResetPasswordSuccess extends AuthState {
  const _StateResetPasswordSuccess({required this.email}): super._();
  

 final  String email;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateResetPasswordSuccessCopyWith<_StateResetPasswordSuccess> get copyWith => __$StateResetPasswordSuccessCopyWithImpl<_StateResetPasswordSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateResetPasswordSuccess&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'AuthState.resetPasswordSuccess(email: $email)';
}


}

/// @nodoc
abstract mixin class _$StateResetPasswordSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$StateResetPasswordSuccessCopyWith(_StateResetPasswordSuccess value, $Res Function(_StateResetPasswordSuccess) _then) = __$StateResetPasswordSuccessCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$StateResetPasswordSuccessCopyWithImpl<$Res>
    implements _$StateResetPasswordSuccessCopyWith<$Res> {
  __$StateResetPasswordSuccessCopyWithImpl(this._self, this._then);

  final _StateResetPasswordSuccess _self;
  final $Res Function(_StateResetPasswordSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_StateResetPasswordSuccess(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _StateResetPasswordFailure extends AuthState {
  const _StateResetPasswordFailure({required this.failure}): super._();
  

 final  Failure failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateResetPasswordFailureCopyWith<_StateResetPasswordFailure> get copyWith => __$StateResetPasswordFailureCopyWithImpl<_StateResetPasswordFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateResetPasswordFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AuthState.resetPasswordFailure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StateResetPasswordFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$StateResetPasswordFailureCopyWith(_StateResetPasswordFailure value, $Res Function(_StateResetPasswordFailure) _then) = __$StateResetPasswordFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$StateResetPasswordFailureCopyWithImpl<$Res>
    implements _$StateResetPasswordFailureCopyWith<$Res> {
  __$StateResetPasswordFailureCopyWithImpl(this._self, this._then);

  final _StateResetPasswordFailure _self;
  final $Res Function(_StateResetPasswordFailure) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_StateResetPasswordFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
