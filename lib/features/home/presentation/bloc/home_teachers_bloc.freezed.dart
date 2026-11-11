// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_teachers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeTeachersEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTeachersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTeachersEvent()';
}


}

/// @nodoc
class $HomeTeachersEventCopyWith<$Res>  {
$HomeTeachersEventCopyWith(HomeTeachersEvent _, $Res Function(HomeTeachersEvent) __);
}


/// Adds pattern-matching-related methods to [HomeTeachersEvent].
extension HomeTeachersEventPatterns on HomeTeachersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventNextPageRequested value)?  nextPageRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventNextPageRequested value)  nextPageRequested,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventNextPageRequested():
return nextPageRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventNextPageRequested value)?  nextPageRequested,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetched,TResult Function()?  nextPageRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched();case _EventNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetched,required TResult Function()  nextPageRequested,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched();case _EventNextPageRequested():
return nextPageRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetched,TResult? Function()?  nextPageRequested,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched();case _EventNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched extends HomeTeachersEvent {
  const _EventFetched(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTeachersEvent.fetched()';
}


}




/// @nodoc


class _EventNextPageRequested extends HomeTeachersEvent {
  const _EventNextPageRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventNextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTeachersEvent.nextPageRequested()';
}


}




/// @nodoc
mixin _$HomeTeachersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeTeachersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTeachersState()';
}


}

/// @nodoc
class $HomeTeachersStateCopyWith<$Res>  {
$HomeTeachersStateCopyWith(HomeTeachersState _, $Res Function(HomeTeachersState) __);
}


/// Adds pattern-matching-related methods to [HomeTeachersState].
extension HomeTeachersStatePatterns on HomeTeachersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StateInitial value)?  initial,TResult Function( _StateLoading value)?  loading,TResult Function( _StateSuccess value)?  success,TResult Function( _StateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that);case _StateLoading() when loading != null:
return loading(_that);case _StateSuccess() when success != null:
return success(_that);case _StateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StateInitial value)  initial,required TResult Function( _StateLoading value)  loading,required TResult Function( _StateSuccess value)  success,required TResult Function( _StateFailure value)  failure,}){
final _that = this;
switch (_that) {
case _StateInitial():
return initial(_that);case _StateLoading():
return loading(_that);case _StateSuccess():
return success(_that);case _StateFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StateInitial value)?  initial,TResult? Function( _StateLoading value)?  loading,TResult? Function( _StateSuccess value)?  success,TResult? Function( _StateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that);case _StateLoading() when loading != null:
return loading(_that);case _StateSuccess() when success != null:
return success(_that);case _StateFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Teacher> teachers,  int page,  int totalPages,  bool isLoadingMore,  Failure? actionFailure)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading();case _StateSuccess() when success != null:
return success(_that.teachers,_that.page,_that.totalPages,_that.isLoadingMore,_that.actionFailure);case _StateFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Teacher> teachers,  int page,  int totalPages,  bool isLoadingMore,  Failure? actionFailure)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _StateInitial():
return initial();case _StateLoading():
return loading();case _StateSuccess():
return success(_that.teachers,_that.page,_that.totalPages,_that.isLoadingMore,_that.actionFailure);case _StateFailure():
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Teacher> teachers,  int page,  int totalPages,  bool isLoadingMore,  Failure? actionFailure)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading();case _StateSuccess() when success != null:
return success(_that.teachers,_that.page,_that.totalPages,_that.isLoadingMore,_that.actionFailure);case _StateFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StateInitial extends HomeTeachersState {
  const _StateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTeachersState.initial()';
}


}




/// @nodoc


class _StateLoading extends HomeTeachersState {
  const _StateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeTeachersState.loading()';
}


}




/// @nodoc


class _StateSuccess extends HomeTeachersState {
  const _StateSuccess({final  List<Teacher> teachers = const <Teacher>[], this.page = 0, this.totalPages = 0, this.isLoadingMore = false, this.actionFailure}): _teachers = teachers,super._();
  

 final  List<Teacher> _teachers;
@JsonKey() List<Teacher> get teachers {
  if (_teachers is EqualUnmodifiableListView) return _teachers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teachers);
}

@JsonKey() final  int page;
@JsonKey() final  int totalPages;
@JsonKey() final  bool isLoadingMore;
 final  Failure? actionFailure;

/// Create a copy of HomeTeachersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateSuccessCopyWith<_StateSuccess> get copyWith => __$StateSuccessCopyWithImpl<_StateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateSuccess&&const DeepCollectionEquality().equals(other._teachers, _teachers)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_teachers),page,totalPages,isLoadingMore,actionFailure);

@override
String toString() {
  return 'HomeTeachersState.success(teachers: $teachers, page: $page, totalPages: $totalPages, isLoadingMore: $isLoadingMore, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class _$StateSuccessCopyWith<$Res> implements $HomeTeachersStateCopyWith<$Res> {
  factory _$StateSuccessCopyWith(_StateSuccess value, $Res Function(_StateSuccess) _then) = __$StateSuccessCopyWithImpl;
@useResult
$Res call({
 List<Teacher> teachers, int page, int totalPages, bool isLoadingMore, Failure? actionFailure
});




}
/// @nodoc
class __$StateSuccessCopyWithImpl<$Res>
    implements _$StateSuccessCopyWith<$Res> {
  __$StateSuccessCopyWithImpl(this._self, this._then);

  final _StateSuccess _self;
  final $Res Function(_StateSuccess) _then;

/// Create a copy of HomeTeachersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? teachers = null,Object? page = null,Object? totalPages = null,Object? isLoadingMore = null,Object? actionFailure = freezed,}) {
  return _then(_StateSuccess(
teachers: null == teachers ? _self._teachers : teachers // ignore: cast_nullable_to_non_nullable
as List<Teacher>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

/// @nodoc


class _StateFailure extends HomeTeachersState {
  const _StateFailure({required this.failure}): super._();
  

 final  Failure failure;

/// Create a copy of HomeTeachersState
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
  return 'HomeTeachersState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StateFailureCopyWith<$Res> implements $HomeTeachersStateCopyWith<$Res> {
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

/// Create a copy of HomeTeachersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_StateFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
