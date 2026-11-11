// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_sessions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiveSessionsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveSessionsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LiveSessionsEvent()';
}


}

/// @nodoc
class $LiveSessionsEventCopyWith<$Res>  {
$LiveSessionsEventCopyWith(LiveSessionsEvent _, $Res Function(LiveSessionsEvent) __);
}


/// Adds pattern-matching-related methods to [LiveSessionsEvent].
extension LiveSessionsEventPatterns on LiveSessionsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventFetched value)?  fetched,TResult Function( _EventDateSelected value)?  dateSelected,TResult Function( _EventMonthChanged value)?  monthChanged,TResult Function( _EventJoinRequested value)?  joinRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventDateSelected() when dateSelected != null:
return dateSelected(_that);case _EventMonthChanged() when monthChanged != null:
return monthChanged(_that);case _EventJoinRequested() when joinRequested != null:
return joinRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventFetched value)  fetched,required TResult Function( _EventDateSelected value)  dateSelected,required TResult Function( _EventMonthChanged value)  monthChanged,required TResult Function( _EventJoinRequested value)  joinRequested,}){
final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that);case _EventDateSelected():
return dateSelected(_that);case _EventMonthChanged():
return monthChanged(_that);case _EventJoinRequested():
return joinRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventFetched value)?  fetched,TResult? Function( _EventDateSelected value)?  dateSelected,TResult? Function( _EventMonthChanged value)?  monthChanged,TResult? Function( _EventJoinRequested value)?  joinRequested,}){
final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that);case _EventDateSelected() when dateSelected != null:
return dateSelected(_that);case _EventMonthChanged() when monthChanged != null:
return monthChanged(_that);case _EventJoinRequested() when joinRequested != null:
return joinRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime? date)?  fetched,TResult Function( int year,  int month,  int day)?  dateSelected,TResult Function( int year,  int month)?  monthChanged,TResult Function( int slotId,  String occurrenceStart)?  joinRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.date);case _EventDateSelected() when dateSelected != null:
return dateSelected(_that.year,_that.month,_that.day);case _EventMonthChanged() when monthChanged != null:
return monthChanged(_that.year,_that.month);case _EventJoinRequested() when joinRequested != null:
return joinRequested(_that.slotId,_that.occurrenceStart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime? date)  fetched,required TResult Function( int year,  int month,  int day)  dateSelected,required TResult Function( int year,  int month)  monthChanged,required TResult Function( int slotId,  String occurrenceStart)  joinRequested,}) {final _that = this;
switch (_that) {
case _EventFetched():
return fetched(_that.date);case _EventDateSelected():
return dateSelected(_that.year,_that.month,_that.day);case _EventMonthChanged():
return monthChanged(_that.year,_that.month);case _EventJoinRequested():
return joinRequested(_that.slotId,_that.occurrenceStart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime? date)?  fetched,TResult? Function( int year,  int month,  int day)?  dateSelected,TResult? Function( int year,  int month)?  monthChanged,TResult? Function( int slotId,  String occurrenceStart)?  joinRequested,}) {final _that = this;
switch (_that) {
case _EventFetched() when fetched != null:
return fetched(_that.date);case _EventDateSelected() when dateSelected != null:
return dateSelected(_that.year,_that.month,_that.day);case _EventMonthChanged() when monthChanged != null:
return monthChanged(_that.year,_that.month);case _EventJoinRequested() when joinRequested != null:
return joinRequested(_that.slotId,_that.occurrenceStart);case _:
  return null;

}
}

}

/// @nodoc


class _EventFetched extends LiveSessionsEvent {
  const _EventFetched({this.date}): super._();
  

 final  DateTime? date;

/// Create a copy of LiveSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventFetchedCopyWith<_EventFetched> get copyWith => __$EventFetchedCopyWithImpl<_EventFetched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventFetched&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'LiveSessionsEvent.fetched(date: $date)';
}


}

/// @nodoc
abstract mixin class _$EventFetchedCopyWith<$Res> implements $LiveSessionsEventCopyWith<$Res> {
  factory _$EventFetchedCopyWith(_EventFetched value, $Res Function(_EventFetched) _then) = __$EventFetchedCopyWithImpl;
@useResult
$Res call({
 DateTime? date
});




}
/// @nodoc
class __$EventFetchedCopyWithImpl<$Res>
    implements _$EventFetchedCopyWith<$Res> {
  __$EventFetchedCopyWithImpl(this._self, this._then);

  final _EventFetched _self;
  final $Res Function(_EventFetched) _then;

/// Create a copy of LiveSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = freezed,}) {
  return _then(_EventFetched(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _EventDateSelected extends LiveSessionsEvent {
  const _EventDateSelected({required this.year, required this.month, required this.day}): super._();
  

 final  int year;
 final  int month;
 final  int day;

/// Create a copy of LiveSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDateSelectedCopyWith<_EventDateSelected> get copyWith => __$EventDateSelectedCopyWithImpl<_EventDateSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDateSelected&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,year,month,day);

@override
String toString() {
  return 'LiveSessionsEvent.dateSelected(year: $year, month: $month, day: $day)';
}


}

/// @nodoc
abstract mixin class _$EventDateSelectedCopyWith<$Res> implements $LiveSessionsEventCopyWith<$Res> {
  factory _$EventDateSelectedCopyWith(_EventDateSelected value, $Res Function(_EventDateSelected) _then) = __$EventDateSelectedCopyWithImpl;
@useResult
$Res call({
 int year, int month, int day
});




}
/// @nodoc
class __$EventDateSelectedCopyWithImpl<$Res>
    implements _$EventDateSelectedCopyWith<$Res> {
  __$EventDateSelectedCopyWithImpl(this._self, this._then);

  final _EventDateSelected _self;
  final $Res Function(_EventDateSelected) _then;

/// Create a copy of LiveSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? year = null,Object? month = null,Object? day = null,}) {
  return _then(_EventDateSelected(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _EventMonthChanged extends LiveSessionsEvent {
  const _EventMonthChanged({required this.year, required this.month}): super._();
  

 final  int year;
 final  int month;

/// Create a copy of LiveSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventMonthChangedCopyWith<_EventMonthChanged> get copyWith => __$EventMonthChangedCopyWithImpl<_EventMonthChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventMonthChanged&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month));
}


@override
int get hashCode => Object.hash(runtimeType,year,month);

@override
String toString() {
  return 'LiveSessionsEvent.monthChanged(year: $year, month: $month)';
}


}

/// @nodoc
abstract mixin class _$EventMonthChangedCopyWith<$Res> implements $LiveSessionsEventCopyWith<$Res> {
  factory _$EventMonthChangedCopyWith(_EventMonthChanged value, $Res Function(_EventMonthChanged) _then) = __$EventMonthChangedCopyWithImpl;
@useResult
$Res call({
 int year, int month
});




}
/// @nodoc
class __$EventMonthChangedCopyWithImpl<$Res>
    implements _$EventMonthChangedCopyWith<$Res> {
  __$EventMonthChangedCopyWithImpl(this._self, this._then);

  final _EventMonthChanged _self;
  final $Res Function(_EventMonthChanged) _then;

/// Create a copy of LiveSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? year = null,Object? month = null,}) {
  return _then(_EventMonthChanged(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _EventJoinRequested extends LiveSessionsEvent {
  const _EventJoinRequested({required this.slotId, required this.occurrenceStart}): super._();
  

 final  int slotId;
 final  String occurrenceStart;

/// Create a copy of LiveSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventJoinRequestedCopyWith<_EventJoinRequested> get copyWith => __$EventJoinRequestedCopyWithImpl<_EventJoinRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventJoinRequested&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.occurrenceStart, occurrenceStart) || other.occurrenceStart == occurrenceStart));
}


@override
int get hashCode => Object.hash(runtimeType,slotId,occurrenceStart);

@override
String toString() {
  return 'LiveSessionsEvent.joinRequested(slotId: $slotId, occurrenceStart: $occurrenceStart)';
}


}

/// @nodoc
abstract mixin class _$EventJoinRequestedCopyWith<$Res> implements $LiveSessionsEventCopyWith<$Res> {
  factory _$EventJoinRequestedCopyWith(_EventJoinRequested value, $Res Function(_EventJoinRequested) _then) = __$EventJoinRequestedCopyWithImpl;
@useResult
$Res call({
 int slotId, String occurrenceStart
});




}
/// @nodoc
class __$EventJoinRequestedCopyWithImpl<$Res>
    implements _$EventJoinRequestedCopyWith<$Res> {
  __$EventJoinRequestedCopyWithImpl(this._self, this._then);

  final _EventJoinRequested _self;
  final $Res Function(_EventJoinRequested) _then;

/// Create a copy of LiveSessionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slotId = null,Object? occurrenceStart = null,}) {
  return _then(_EventJoinRequested(
slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as int,occurrenceStart: null == occurrenceStart ? _self.occurrenceStart : occurrenceStart // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LiveSessionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveSessionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LiveSessionsState()';
}


}

/// @nodoc
class $LiveSessionsStateCopyWith<$Res>  {
$LiveSessionsStateCopyWith(LiveSessionsState _, $Res Function(LiveSessionsState) __);
}


/// Adds pattern-matching-related methods to [LiveSessionsState].
extension LiveSessionsStatePatterns on LiveSessionsState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( DateTime selectedDate,  DateTime focusedMonth)?  loading,TResult Function( DateTime selectedDate,  DateTime focusedMonth,  List<LiveSession> sessions,  bool hasLiveEntitlement,  bool isJoining,  bool isRefreshing,  int? joiningSlotId,  LiveJoin? joinResult,  bool requiresPremiumUpgrade,  Failure? actionFailure)?  success,TResult Function( Failure failure,  DateTime selectedDate,  DateTime focusedMonth)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading(_that.selectedDate,_that.focusedMonth);case _StateSuccess() when success != null:
return success(_that.selectedDate,_that.focusedMonth,_that.sessions,_that.hasLiveEntitlement,_that.isJoining,_that.isRefreshing,_that.joiningSlotId,_that.joinResult,_that.requiresPremiumUpgrade,_that.actionFailure);case _StateFailure() when failure != null:
return failure(_that.failure,_that.selectedDate,_that.focusedMonth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( DateTime selectedDate,  DateTime focusedMonth)  loading,required TResult Function( DateTime selectedDate,  DateTime focusedMonth,  List<LiveSession> sessions,  bool hasLiveEntitlement,  bool isJoining,  bool isRefreshing,  int? joiningSlotId,  LiveJoin? joinResult,  bool requiresPremiumUpgrade,  Failure? actionFailure)  success,required TResult Function( Failure failure,  DateTime selectedDate,  DateTime focusedMonth)  failure,}) {final _that = this;
switch (_that) {
case _StateInitial():
return initial();case _StateLoading():
return loading(_that.selectedDate,_that.focusedMonth);case _StateSuccess():
return success(_that.selectedDate,_that.focusedMonth,_that.sessions,_that.hasLiveEntitlement,_that.isJoining,_that.isRefreshing,_that.joiningSlotId,_that.joinResult,_that.requiresPremiumUpgrade,_that.actionFailure);case _StateFailure():
return failure(_that.failure,_that.selectedDate,_that.focusedMonth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( DateTime selectedDate,  DateTime focusedMonth)?  loading,TResult? Function( DateTime selectedDate,  DateTime focusedMonth,  List<LiveSession> sessions,  bool hasLiveEntitlement,  bool isJoining,  bool isRefreshing,  int? joiningSlotId,  LiveJoin? joinResult,  bool requiresPremiumUpgrade,  Failure? actionFailure)?  success,TResult? Function( Failure failure,  DateTime selectedDate,  DateTime focusedMonth)?  failure,}) {final _that = this;
switch (_that) {
case _StateInitial() when initial != null:
return initial();case _StateLoading() when loading != null:
return loading(_that.selectedDate,_that.focusedMonth);case _StateSuccess() when success != null:
return success(_that.selectedDate,_that.focusedMonth,_that.sessions,_that.hasLiveEntitlement,_that.isJoining,_that.isRefreshing,_that.joiningSlotId,_that.joinResult,_that.requiresPremiumUpgrade,_that.actionFailure);case _StateFailure() when failure != null:
return failure(_that.failure,_that.selectedDate,_that.focusedMonth);case _:
  return null;

}
}

}

/// @nodoc


class _StateInitial extends LiveSessionsState {
  const _StateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LiveSessionsState.initial()';
}


}




/// @nodoc


class _StateLoading extends LiveSessionsState {
  const _StateLoading({required this.selectedDate, required this.focusedMonth}): super._();
  

 final  DateTime selectedDate;
 final  DateTime focusedMonth;

/// Create a copy of LiveSessionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateLoadingCopyWith<_StateLoading> get copyWith => __$StateLoadingCopyWithImpl<_StateLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateLoading&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.focusedMonth, focusedMonth) || other.focusedMonth == focusedMonth));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,focusedMonth);

@override
String toString() {
  return 'LiveSessionsState.loading(selectedDate: $selectedDate, focusedMonth: $focusedMonth)';
}


}

/// @nodoc
abstract mixin class _$StateLoadingCopyWith<$Res> implements $LiveSessionsStateCopyWith<$Res> {
  factory _$StateLoadingCopyWith(_StateLoading value, $Res Function(_StateLoading) _then) = __$StateLoadingCopyWithImpl;
@useResult
$Res call({
 DateTime selectedDate, DateTime focusedMonth
});




}
/// @nodoc
class __$StateLoadingCopyWithImpl<$Res>
    implements _$StateLoadingCopyWith<$Res> {
  __$StateLoadingCopyWithImpl(this._self, this._then);

  final _StateLoading _self;
  final $Res Function(_StateLoading) _then;

/// Create a copy of LiveSessionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedDate = null,Object? focusedMonth = null,}) {
  return _then(_StateLoading(
selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,focusedMonth: null == focusedMonth ? _self.focusedMonth : focusedMonth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class _StateSuccess extends LiveSessionsState {
  const _StateSuccess({required this.selectedDate, required this.focusedMonth, final  List<LiveSession> sessions = const <LiveSession>[], this.hasLiveEntitlement = false, this.isJoining = false, this.isRefreshing = false, this.joiningSlotId, this.joinResult, this.requiresPremiumUpgrade = false, this.actionFailure}): _sessions = sessions,super._();
  

 final  DateTime selectedDate;
 final  DateTime focusedMonth;
 final  List<LiveSession> _sessions;
@JsonKey() List<LiveSession> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@JsonKey() final  bool hasLiveEntitlement;
@JsonKey() final  bool isJoining;
@JsonKey() final  bool isRefreshing;
 final  int? joiningSlotId;
 final  LiveJoin? joinResult;
@JsonKey() final  bool requiresPremiumUpgrade;
 final  Failure? actionFailure;

/// Create a copy of LiveSessionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateSuccessCopyWith<_StateSuccess> get copyWith => __$StateSuccessCopyWithImpl<_StateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateSuccess&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.focusedMonth, focusedMonth) || other.focusedMonth == focusedMonth)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.hasLiveEntitlement, hasLiveEntitlement) || other.hasLiveEntitlement == hasLiveEntitlement)&&(identical(other.isJoining, isJoining) || other.isJoining == isJoining)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.joiningSlotId, joiningSlotId) || other.joiningSlotId == joiningSlotId)&&(identical(other.joinResult, joinResult) || other.joinResult == joinResult)&&(identical(other.requiresPremiumUpgrade, requiresPremiumUpgrade) || other.requiresPremiumUpgrade == requiresPremiumUpgrade)&&(identical(other.actionFailure, actionFailure) || other.actionFailure == actionFailure));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDate,focusedMonth,const DeepCollectionEquality().hash(_sessions),hasLiveEntitlement,isJoining,isRefreshing,joiningSlotId,joinResult,requiresPremiumUpgrade,actionFailure);

@override
String toString() {
  return 'LiveSessionsState.success(selectedDate: $selectedDate, focusedMonth: $focusedMonth, sessions: $sessions, hasLiveEntitlement: $hasLiveEntitlement, isJoining: $isJoining, isRefreshing: $isRefreshing, joiningSlotId: $joiningSlotId, joinResult: $joinResult, requiresPremiumUpgrade: $requiresPremiumUpgrade, actionFailure: $actionFailure)';
}


}

/// @nodoc
abstract mixin class _$StateSuccessCopyWith<$Res> implements $LiveSessionsStateCopyWith<$Res> {
  factory _$StateSuccessCopyWith(_StateSuccess value, $Res Function(_StateSuccess) _then) = __$StateSuccessCopyWithImpl;
@useResult
$Res call({
 DateTime selectedDate, DateTime focusedMonth, List<LiveSession> sessions, bool hasLiveEntitlement, bool isJoining, bool isRefreshing, int? joiningSlotId, LiveJoin? joinResult, bool requiresPremiumUpgrade, Failure? actionFailure
});




}
/// @nodoc
class __$StateSuccessCopyWithImpl<$Res>
    implements _$StateSuccessCopyWith<$Res> {
  __$StateSuccessCopyWithImpl(this._self, this._then);

  final _StateSuccess _self;
  final $Res Function(_StateSuccess) _then;

/// Create a copy of LiveSessionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedDate = null,Object? focusedMonth = null,Object? sessions = null,Object? hasLiveEntitlement = null,Object? isJoining = null,Object? isRefreshing = null,Object? joiningSlotId = freezed,Object? joinResult = freezed,Object? requiresPremiumUpgrade = null,Object? actionFailure = freezed,}) {
  return _then(_StateSuccess(
selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,focusedMonth: null == focusedMonth ? _self.focusedMonth : focusedMonth // ignore: cast_nullable_to_non_nullable
as DateTime,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<LiveSession>,hasLiveEntitlement: null == hasLiveEntitlement ? _self.hasLiveEntitlement : hasLiveEntitlement // ignore: cast_nullable_to_non_nullable
as bool,isJoining: null == isJoining ? _self.isJoining : isJoining // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,joiningSlotId: freezed == joiningSlotId ? _self.joiningSlotId : joiningSlotId // ignore: cast_nullable_to_non_nullable
as int?,joinResult: freezed == joinResult ? _self.joinResult : joinResult // ignore: cast_nullable_to_non_nullable
as LiveJoin?,requiresPremiumUpgrade: null == requiresPremiumUpgrade ? _self.requiresPremiumUpgrade : requiresPremiumUpgrade // ignore: cast_nullable_to_non_nullable
as bool,actionFailure: freezed == actionFailure ? _self.actionFailure : actionFailure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

/// @nodoc


class _StateFailure extends LiveSessionsState {
  const _StateFailure({required this.failure, required this.selectedDate, required this.focusedMonth}): super._();
  

 final  Failure failure;
 final  DateTime selectedDate;
 final  DateTime focusedMonth;

/// Create a copy of LiveSessionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StateFailureCopyWith<_StateFailure> get copyWith => __$StateFailureCopyWithImpl<_StateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StateFailure&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.focusedMonth, focusedMonth) || other.focusedMonth == focusedMonth));
}


@override
int get hashCode => Object.hash(runtimeType,failure,selectedDate,focusedMonth);

@override
String toString() {
  return 'LiveSessionsState.failure(failure: $failure, selectedDate: $selectedDate, focusedMonth: $focusedMonth)';
}


}

/// @nodoc
abstract mixin class _$StateFailureCopyWith<$Res> implements $LiveSessionsStateCopyWith<$Res> {
  factory _$StateFailureCopyWith(_StateFailure value, $Res Function(_StateFailure) _then) = __$StateFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure, DateTime selectedDate, DateTime focusedMonth
});




}
/// @nodoc
class __$StateFailureCopyWithImpl<$Res>
    implements _$StateFailureCopyWith<$Res> {
  __$StateFailureCopyWithImpl(this._self, this._then);

  final _StateFailure _self;
  final $Res Function(_StateFailure) _then;

/// Create a copy of LiveSessionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? selectedDate = null,Object? focusedMonth = null,}) {
  return _then(_StateFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,focusedMonth: null == focusedMonth ? _self.focusedMonth : focusedMonth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
