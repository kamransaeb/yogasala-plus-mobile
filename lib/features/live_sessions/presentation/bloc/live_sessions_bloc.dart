import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_join.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_session.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/use_cases/get_live_sessions_use_case.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/use_cases/join_live_session_use_case.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/bloc/entitlements_bloc.dart';

part 'live_sessions_event.dart';
part 'live_sessions_state.dart';
part 'live_sessions_bloc.freezed.dart';

/// Owns the Live tab: day calendar + upcoming sessions + join.
@injectable
class LiveSessionsBloc extends Bloc<LiveSessionsEvent, LiveSessionsState> {
  /// Creates a [LiveSessionsBloc].
  LiveSessionsBloc(
    this._getLiveSessions,
    this._joinLiveSession,
    this._entitlementsBloc,
  ) : super(const LiveSessionsState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
    on<_EventDateSelected>(_onDateSelected, transformer: restartable());
    on<_EventMonthChanged>(_onMonthChanged);
    on<_EventJoinRequested>(
      _onJoinRequested,
      transformer: droppable(),
    );
  }

  final GetLiveSessionsUseCase _getLiveSessions;
  final JoinLiveSessionUseCase _joinLiveSession;
  final EntitlementsBloc _entitlementsBloc;

  static const int _maxLookaheadDays = 28;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<LiveSessionsState> emit,
  ) async {
    final selected = _dateOnly(
      event.date ?? state.selectedDateOrNull ?? DateTime.now(),
    );
    final focused = state.focusedMonthOrNull ??
        DateTime(selected.year, selected.month);
    await _loadForDate(
      emit: emit,
      selectedDate: selected,
      focusedMonth: focused,
      showFullLoading: !state.isSuccess,
    );
  }

  Future<void> _onDateSelected(
    _EventDateSelected event,
    Emitter<LiveSessionsState> emit,
  ) async {
    final selected = DateTime(event.year, event.month, event.day);
    await _loadForDate(
      emit: emit,
      selectedDate: selected,
      focusedMonth: DateTime(selected.year, selected.month),
      showFullLoading: false,
    );
  }

  void _onMonthChanged(
    _EventMonthChanged event,
    Emitter<LiveSessionsState> emit,
  ) {
    final focused = DateTime(event.year, event.month);
    final selected = state.selectedDateOrNull ?? _dateOnly(DateTime.now());

    state.maybeMap(
      success: (s) {
        emit(
          s.copyWith(
            focusedMonth: focused,
            joinResult: null,
            actionFailure: null,
            requiresPremiumUpgrade: false,
          ),
        );
      },
      loading: (s) {
        emit(
          LiveSessionsState.loading(
            selectedDate: selected,
            focusedMonth: focused,
          ),
        );
      },
      failure: (s) {
        emit(
          LiveSessionsState.failure(
            failure: s.failure,
            selectedDate: selected,
            focusedMonth: focused,
          ),
        );
      },
      orElse: () {
        emit(
          LiveSessionsState.loading(
            selectedDate: selected,
            focusedMonth: focused,
          ),
        );
      },
    );
  }

  Future<void> _loadForDate({
    required Emitter<LiveSessionsState> emit,
    required DateTime selectedDate,
    required DateTime focusedMonth,
    required bool showFullLoading,
  }) async {
    final previousSessions = state.sessionsOrEmpty;
    final previousHasLive = state.hasLiveEntitlement;

    if (showFullLoading || !state.isSuccess) {
      emit(
        LiveSessionsState.loading(
          selectedDate: selectedDate,
          focusedMonth: focusedMonth,
        ),
      );
    } else {
      emit(
        LiveSessionsState.success(
          selectedDate: selectedDate,
          focusedMonth: focusedMonth,
          sessions: previousSessions,
          hasLiveEntitlement: previousHasLive,
          isRefreshing: true,
        ),
      );
    }

    final result = await _getLiveSessions(
      GetLiveSessionsParams(days: _daysForDate(selectedDate)),
    );

    if (emit.isDone) return;

    result.fold(
      (failure) {
        if (!showFullLoading && state.isSuccess) {
          emit(
            LiveSessionsState.success(
              selectedDate: selectedDate,
              focusedMonth: focusedMonth,
              sessions: previousSessions,
              hasLiveEntitlement: previousHasLive,
              actionFailure: failure,
            ),
          );
        } else {
          emit(
            LiveSessionsState.failure(
              failure: failure,
              selectedDate: selectedDate,
              focusedMonth: focusedMonth,
            ),
          );
        }
      },
      (sessions) {
        emit(
          LiveSessionsState.success(
            selectedDate: selectedDate,
            focusedMonth: focusedMonth,
            sessions: _sessionsOnDate(sessions, selectedDate),
            hasLiveEntitlement: _entitlementsBloc.state.hasLive,
          ),
        );
      },
    );
  }

  Future<void> _onJoinRequested(
    _EventJoinRequested event,
    Emitter<LiveSessionsState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess || current.isJoining) return;

    final selectedDate = current.selectedDateOrNull!;
    final focusedMonth = current.focusedMonthOrNull!;

    if (!_entitlementsBloc.state.hasLive) {
      emit(
        LiveSessionsState.success(
          selectedDate: selectedDate,
          focusedMonth: focusedMonth,
          sessions: current.sessionsOrEmpty,
          requiresPremiumUpgrade: true,
        ),
      );
      return;
    }

    emit(
      LiveSessionsState.success(
        selectedDate: selectedDate,
        focusedMonth: focusedMonth,
        sessions: current.sessionsOrEmpty,
        hasLiveEntitlement: true,
        isJoining: true,
        joiningSlotId: event.slotId,
      ),
    );

    final result = await _joinLiveSession(
      JoinLiveSessionParams(
        slotId: event.slotId,
        occurrenceStart: event.occurrenceStart,
      ),
    );

    if (emit.isDone) return;

    result.fold(
      (failure) {
        emit(
          LiveSessionsState.success(
            selectedDate: selectedDate,
            focusedMonth: focusedMonth,
            sessions: current.sessionsOrEmpty,
            hasLiveEntitlement: true,
            actionFailure: failure,
          ),
        );
      },
      (join) {
        emit(
          LiveSessionsState.success(
            selectedDate: selectedDate,
            focusedMonth: focusedMonth,
            sessions: current.sessionsOrEmpty,
            hasLiveEntitlement: true,
            joinResult: join,
          ),
        );
      },
    );
  }

  /// Lookahead window so the API includes [selectedDate] (clamped 1–28).
  static int _daysForDate(DateTime selectedDate) {
    final today = _dateOnly(DateTime.now());
    final selected = _dateOnly(selectedDate);
    if (selected.isBefore(today)) {
      return 1;
    }
    final diff = selected.difference(today).inDays + 1;
    if (diff < 1) return 1;
    if (diff > _maxLookaheadDays) return _maxLookaheadDays;
    return diff;
  }

  static List<LiveSession> _sessionsOnDate(
    List<LiveSession> sessions,
    DateTime selectedDate,
  ) {
    final key = _dateOnly(selectedDate);
    return sessions
        .where((session) => _dateOnly(session.startsAt.toLocal()) == key)
        .toList();
  }

  static DateTime _dateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);
}
