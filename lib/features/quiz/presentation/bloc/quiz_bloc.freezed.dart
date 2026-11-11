// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizEvent()';
}


}

/// @nodoc
class $QuizEventCopyWith<$Res>  {
$QuizEventCopyWith(QuizEvent _, $Res Function(QuizEvent) __);
}


/// Adds pattern-matching-related methods to [QuizEvent].
extension QuizEventPatterns on QuizEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventAnswerSelected value)?  answerSelected,TResult Function( _EventNextRequested value)?  nextRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventAnswerSelected() when answerSelected != null:
return answerSelected(_that);case _EventNextRequested() when nextRequested != null:
return nextRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventAnswerSelected value)  answerSelected,required TResult Function( _EventNextRequested value)  nextRequested,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventAnswerSelected():
return answerSelected(_that);case _EventNextRequested():
return nextRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventAnswerSelected value)?  answerSelected,TResult? Function( _EventNextRequested value)?  nextRequested,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventAnswerSelected() when answerSelected != null:
return answerSelected(_that);case _EventNextRequested() when nextRequested != null:
return nextRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetched,TResult Function( int answerId)?  answerSelected,TResult Function()?  nextRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched();case _EventAnswerSelected() when answerSelected != null:
return answerSelected(_that.answerId);case _EventNextRequested() when nextRequested != null:
return nextRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetched,required TResult Function( int answerId)  answerSelected,required TResult Function()  nextRequested,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched();case _EventAnswerSelected():
return answerSelected(_that.answerId);case _EventNextRequested():
return nextRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetched,TResult? Function( int answerId)?  answerSelected,TResult? Function()?  nextRequested,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched();case _EventAnswerSelected() when answerSelected != null:
return answerSelected(_that.answerId);case _EventNextRequested() when nextRequested != null:
return nextRequested();case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched extends QuizEvent {
  const _EventFetched(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizEvent.fetched()';
}


}




/// @nodoc


class _EventAnswerSelected extends QuizEvent {
  const _EventAnswerSelected({required this.answerId}): super._();
  

 final  int answerId;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventAnswerSelectedCopyWith<_EventAnswerSelected> get copyWith => __$EventAnswerSelectedCopyWithImpl<_EventAnswerSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventAnswerSelected&&(identical(other.answerId, answerId) || other.answerId == answerId));
}


@override
int get hashCode => Object.hash(runtimeType,answerId);

@override
String toString() {
  return 'QuizEvent.answerSelected(answerId: $answerId)';
}


}

/// @nodoc
abstract mixin class _$EventAnswerSelectedCopyWith<$Res> implements $QuizEventCopyWith<$Res> {
  factory _$EventAnswerSelectedCopyWith(_EventAnswerSelected value, $Res Function(_EventAnswerSelected) _then) = __$EventAnswerSelectedCopyWithImpl;
@useResult
$Res call({
 int answerId
});




}
/// @nodoc
class __$EventAnswerSelectedCopyWithImpl<$Res>
    implements _$EventAnswerSelectedCopyWith<$Res> {
  __$EventAnswerSelectedCopyWithImpl(this._self, this._then);

  final _EventAnswerSelected _self;
  final $Res Function(_EventAnswerSelected) _then;

/// Create a copy of QuizEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? answerId = null,}) {
  return _then(_EventAnswerSelected(
answerId: null == answerId ? _self.answerId : answerId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _EventNextRequested extends QuizEvent {
  const _EventNextRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventNextRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizEvent.nextRequested()';
}


}




/// @nodoc
mixin _$QuizState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizState()';
}


}

/// @nodoc
class $QuizStateCopyWith<$Res>  {
$QuizStateCopyWith(QuizState _, $Res Function(QuizState) __);
}


/// Adds pattern-matching-related methods to [QuizState].
extension QuizStatePatterns on QuizState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StateInitial value)?  initial,TResult Function( _StateLoading value)?  loading,TResult Function( _StateEmpty value)?  empty,TResult Function( _StateSuccess value)?  success,TResult Function( _StateFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that);case _StateLoading() when loading != null:
return loading(_that);case _StateEmpty() when empty != null:
return empty(_that);case _StateSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StateInitial value)  initial,required TResult Function( _StateLoading value)  loading,required TResult Function( _StateEmpty value)  empty,required TResult Function( _StateSuccess value)  success,required TResult Function( _StateFailure value)  failure,}){
final _that = this;
switch (_that) {
case _StateInitial():
return initial(_that);case _StateLoading():
return loading(_that);case _StateEmpty():
return empty(_that);case _StateSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StateInitial value)?  initial,TResult? Function( _StateLoading value)?  loading,TResult? Function( _StateEmpty value)?  empty,TResult? Function( _StateSuccess value)?  success,TResult? Function( _StateFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial(_that);case _StateLoading() when loading != null:
return loading(_that);case _StateEmpty() when empty != null:
return empty(_that);case _StateSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  empty,TResult Function( VideoQuiz quiz,  int currentQuestionIndex,  bool isSubmitting,  bool showingResults,  bool? lastAnswerCorrect,  int? pointsAwarded,  int? pointsBalance,  Failure? actionFailure)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading();case _StateEmpty() when empty != null:
return empty();case _StateSuccess() when success != null:
return success(_that.quiz,_that.currentQuestionIndex,_that.isSubmitting,_that.showingResults,_that.lastAnswerCorrect,_that.pointsAwarded,_that.pointsBalance,_that.actionFailure);case _StateFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  empty,required TResult Function( VideoQuiz quiz,  int currentQuestionIndex,  bool isSubmitting,  bool showingResults,  bool? lastAnswerCorrect,  int? pointsAwarded,  int? pointsBalance,  Failure? actionFailure)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _StateInitial():
return initial();case _StateLoading():
return loading();case _StateEmpty():
return empty();case _StateSuccess():
return success(_that.quiz,_that.currentQuestionIndex,_that.isSubmitting,_that.showingResults,_that.lastAnswerCorrect,_that.pointsAwarded,_that.pointsBalance,_that.actionFailure);case _StateFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  empty,TResult? Function( VideoQuiz quiz,  int currentQuestionIndex,  bool isSubmitting,  bool showingResults,  bool? lastAnswerCorrect,  int? pointsAwarded,  int? pointsBalance,  Failure? actionFailure)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading();case _StateEmpty() when empty != null:
return empty();case _StateSuccess() when success != null:
return success(_that.quiz,_that.currentQuestionIndex,_that.isSubmitting,_that.showingResults,_that.lastAnswerCorrect,_that.pointsAwarded,_that.pointsBalance,_that.actionFailure);case _StateFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _StateInitial extends QuizState {
  const _StateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizState.initial()';
}


}




/// @nodoc


class _StateLoading extends QuizState {
  const _StateLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizState.loading()';
}


}




/// @nodoc


class _StateEmpty extends QuizState {
  const _StateEmpty(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuizState.empty()';
}


}




/// @nodoc


class _StateSuccess extends QuizState {
  const _StateSuccess({required this.quiz, this.currentQuestionIndex = 0, this.isSubmitting = false, this.showingResults = false, this.lastAnswerCorrect, this.pointsAwarded, this.pointsBalance, this.actionFailure}): super._();
  

 final  VideoQuiz quiz;
@JsonKey() final  int currentQuestionIndex;
@JsonKey() final  bool isSubmitting;
@JsonKey() final  bool showingResults;
 final  bool? lastAnswerCorrect;
 final  int? pointsAwarded;
 final  int? pointsBalance;
 final  Failure? actionFailure;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateSuccessCopyWith<_StateSuccess> get copyWith => __$StateSuccessCopyWithImpl<_StateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateSuccess&&(identical(other.quiz, quiz) || other.quiz == quiz)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.showingResults, showingResults) || other.showingResults == showingResults)&&(identical(other.lastAnswerCorrect, lastAnswerCorrect) || other.lastAnswerCorrect == lastAnswerCorrect)&&(identical(other.pointsAwarded, pointsAwarded) || other.pointsAwarded == pointsAwarded)&&(identical(other.pointsBalance, pointsBalance) || other.pointsBalance == pointsBalance)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode => Object.hash(runtimeType,quiz,currentQuestionIndex,isSubmitting,showingResults,lastAnswerCorrect,pointsAwarded,pointsBalance,actionFailure);

@override
String toString() {
  return 'QuizState.success(quiz: $quiz, currentQuestionIndex: $currentQuestionIndex, isSubmitting: $isSubmitting, showingResults: $showingResults, lastAnswerCorrect: $lastAnswerCorrect, pointsAwarded: $pointsAwarded, pointsBalance: $pointsBalance, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class _$StateSuccessCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$StateSuccessCopyWith(_StateSuccess value, $Res Function(_StateSuccess) _then) = __$StateSuccessCopyWithImpl;
@useResult
$Res call({
 VideoQuiz quiz, int currentQuestionIndex, bool isSubmitting, bool showingResults, bool? lastAnswerCorrect, int? pointsAwarded, int? pointsBalance, Failure? actionFailure
});




}
/// @nodoc
class __$StateSuccessCopyWithImpl<$Res>
    implements _$StateSuccessCopyWith<$Res> {
  __$StateSuccessCopyWithImpl(this._self, this._then);

  final _StateSuccess _self;
  final $Res Function(_StateSuccess) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quiz = null,Object? currentQuestionIndex = null,Object? isSubmitting = null,Object? showingResults = null,Object? lastAnswerCorrect = freezed,Object? pointsAwarded = freezed,Object? pointsBalance = freezed,Object? actionFailure = freezed,}) {
  return _then(_StateSuccess(
quiz: null == quiz ? _self.quiz : quiz // ignore: cast_nullable_to_non_nullable
as VideoQuiz,currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,showingResults: null == showingResults ? _self.showingResults : showingResults // ignore: cast_nullable_to_non_nullable
as bool,lastAnswerCorrect: freezed == lastAnswerCorrect ? _self.lastAnswerCorrect : lastAnswerCorrect // ignore: cast_nullable_to_non_nullable
as bool?,pointsAwarded: freezed == pointsAwarded ? _self.pointsAwarded : pointsAwarded // ignore: cast_nullable_to_non_nullable
as int?,pointsBalance: freezed == pointsBalance ? _self.pointsBalance : pointsBalance // ignore: cast_nullable_to_non_nullable
as int?,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

/// @nodoc


class _StateFailure extends QuizState {
  const _StateFailure({required this.failure}): super._();
  

 final  Failure failure;

/// Create a copy of QuizState
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
  return 'QuizState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$StateFailureCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
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

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_StateFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
