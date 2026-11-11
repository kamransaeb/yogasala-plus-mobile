import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/use_cases/get_quiz_attempt_by_id_use_case.dart';

part 'quiz_attempt_detail_event.dart';
part 'quiz_attempt_detail_state.dart';
part 'quiz_attempt_detail_bloc.freezed.dart';

/// Owns a single completed quiz attempt detail.
@injectable
class QuizAttemptDetailBloc
    extends Bloc<QuizAttemptDetailEvent, QuizAttemptDetailState> {
  /// Creates a [QuizAttemptDetailBloc] for [attemptId].
  QuizAttemptDetailBloc(
    this._getQuizAttemptById,
    @factoryParam this.attemptId,
  ) : super(const QuizAttemptDetailState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
  }

  /// Attempt to load.
  final int attemptId;

  final GetQuizAttemptByIdUseCase _getQuizAttemptById;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<QuizAttemptDetailState> emit,
  ) async {
    emit(const QuizAttemptDetailState.loading());

    final result = await _getQuizAttemptById(
      GetQuizAttemptByIdParams(attemptId: attemptId),
    );

    if (emit.isDone) return;

    result.fold(
      (failure) => emit(QuizAttemptDetailState.failure(failure: failure)),
      (quiz) {
        if (!quiz.isCompleted || !quiz.hasQuestions) {
          emit(
            QuizAttemptDetailState.failure(
              failure: NotFoundFailure(
                resourceType: 'QuizAttempt',
                identifier: '$attemptId',
              ),
            ),
          );
          return;
        }
        emit(QuizAttemptDetailState.success(quiz: quiz));
      },
    );
  }
}
