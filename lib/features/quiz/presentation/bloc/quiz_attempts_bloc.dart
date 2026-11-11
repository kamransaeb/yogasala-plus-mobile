import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_attempt_summary.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/use_cases/get_quiz_attempts_use_case.dart';

part 'quiz_attempts_event.dart';
part 'quiz_attempts_state.dart';
part 'quiz_attempts_bloc.freezed.dart';

/// Owns the profile "My Quizzes" list: paginated completed attempts.
@injectable
class QuizAttemptsBloc extends Bloc<QuizAttemptsEvent, QuizAttemptsState> {
  /// Creates a [QuizAttemptsBloc].
  QuizAttemptsBloc(this._getQuizAttempts)
      : super(const QuizAttemptsState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
    on<_EventNextPageRequested>(
      _onNextPageRequested,
      transformer: droppable(),
    );
  }

  final GetQuizAttemptsUseCase _getQuizAttempts;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<QuizAttemptsState> emit,
  ) async {
    await _loadPage(
      emit: emit,
      page: 0,
      append: false,
      showFullLoading: true,
    );
  }

  Future<void> _onNextPageRequested(
    _EventNextPageRequested event,
    Emitter<QuizAttemptsState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess || current.isLoadingMore || !current.hasMore) {
      return;
    }

    await _loadPage(
      emit: emit,
      page: current.pageOrZero + 1,
      append: true,
      showFullLoading: false,
    );
  }

  Future<void> _loadPage({
    required Emitter<QuizAttemptsState> emit,
    required int page,
    required bool append,
    required bool showFullLoading,
  }) async {
    final previous = state.attemptsOrEmpty;

    if (showFullLoading && !append) {
      emit(const QuizAttemptsState.loading());
    } else if (append && state.isSuccess) {
      emit(
        QuizAttemptsState.success(
          attempts: previous,
          page: state.pageOrZero,
          totalPages: state.totalPagesOrZero,
          isLoadingMore: true,
        ),
      );
    }

    final result = await _getQuizAttempts(GetQuizAttemptsParams(page: page));

    if (emit.isDone) return;

    result.fold(
      (failure) {
        if (append && previous.isNotEmpty) {
          emit(
            QuizAttemptsState.success(
              attempts: previous,
              page: state.pageOrZero,
              totalPages: state.totalPagesOrZero,
              actionFailure: failure,
            ),
          );
        } else {
          emit(QuizAttemptsState.failure(failure: failure));
        }
      },
      (attemptPage) {
        final attempts = append
            ? [...previous, ...attemptPage.content]
            : attemptPage.content;
        emit(
          QuizAttemptsState.success(
            attempts: attempts,
            page: attemptPage.page,
            totalPages: attemptPage.totalPages,
          ),
        );
      },
    );
  }
}
