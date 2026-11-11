import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_day.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/entities/user_activity_streak.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/use_cases/get_user_activity_streak_use_case.dart';
import 'package:yogasala_plus_mobile/features/activity/domain/use_cases/get_user_activity_use_case.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';
part 'calendar_bloc.freezed.dart';

/// Owns the activity calendar tab: month navigation and day markers.
@injectable
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  /// Creates a [CalendarBloc].
  CalendarBloc(
    this._getUserActivity,
    this._getUserActivityStreak,
  ) : super(const CalendarState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
    on<_EventMonthChanged>(_onMonthChanged, transformer: restartable());
  }

  final GetUserActivityUseCase _getUserActivity;
  final GetUserActivityStreakUseCase _getUserActivityStreak;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<CalendarState> emit,
  ) async {
    final now = DateTime.now();
    await _loadMonth(
      emit: emit,
      focusedMonth: DateTime(now.year, now.month),
      showFullLoading: true,
    );
  }

  Future<void> _onMonthChanged(
    _EventMonthChanged event,
    Emitter<CalendarState> emit,
  ) async {
    await _loadMonth(
      emit: emit,
      focusedMonth: DateTime(event.year, event.month),
      showFullLoading: false,
    );
  }

  Future<void> _loadMonth({
    required Emitter<CalendarState> emit,
    required DateTime focusedMonth,
    required bool showFullLoading,
  }) async {
    final previousDays = state.daysByDateOrEmpty;
    final previousStreak = state.streakOrNull;

    if (showFullLoading) {
      emit(const CalendarState.loading());
    } else if (state.isSuccess) {
      emit(
        CalendarState.success(
          focusedMonth: focusedMonth,
          daysByDate: previousDays,
          streak: previousStreak,
          isRefreshing: true,
        ),
      );
    } else {
      emit(const CalendarState.loading());
    }

    final from = DateTime(focusedMonth.year, focusedMonth.month);
    final to = DateTime(focusedMonth.year, focusedMonth.month + 1, 0);

    final activityFuture = _getUserActivity(
      GetUserActivityParams(
        from: _formatApiDate(from),
        to: _formatApiDate(to),
      ),
    );
    final streakFuture = _getUserActivityStreak(const NoParams());

    final activityResult = await activityFuture;
    final streakResult = await streakFuture;

    if (emit.isDone) return;

    final streak = streakResult.fold(
      (_) => previousStreak ?? const UserActivityStreak(currentStreak: 0),
      (value) => value,
    );

    activityResult.fold(
      (failure) {
        if (!showFullLoading && previousDays.isNotEmpty) {
          emit(
            CalendarState.success(
              focusedMonth: focusedMonth,
              daysByDate: previousDays,
              streak: streak,
              actionFailure: failure,
            ),
          );
        } else {
          emit(CalendarState.failure(failure: failure));
        }
      },
      (days) {
        final map = <DateTime, UserActivityDay>{
          for (final day in days)
            DateTime(day.date.year, day.date.month, day.date.day): day,
        };
        emit(
          CalendarState.success(
            focusedMonth: focusedMonth,
            daysByDate: map,
            streak: streak,
          ),
        );
      },
    );
  }

  static String _formatApiDate(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }
}
