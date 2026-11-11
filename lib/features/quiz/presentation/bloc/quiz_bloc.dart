import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/enums/quiz_status.dart';
import 'package:yogasala_plus_mobile/errors/backend_error_codes.dart';
import 'package:yogasala_plus_mobile/features/points/domain/use_cases/get_user_points_use_case.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_answer.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_answer_result.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_question.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/use_cases/get_video_quiz_use_case.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/use_cases/submit_quiz_answer_use_case.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';
part 'quiz_bloc.freezed.dart';

/// Owns video quiz flow: load, answer one-by-one, results.
@injectable
class QuizBloc extends Bloc<QuizEvent, QuizState> {
  /// Creates a [QuizBloc] for [videoId].
  QuizBloc(
    this._getVideoQuiz,
    this._submitQuizAnswer,
    this._getUserPoints,
    @factoryParam this.videoId,
  ) : super(const QuizState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
    on<_EventAnswerSelected>(_onAnswerSelected, transformer: droppable());
    on<_EventNextRequested>(_onNextRequested);
  }

  /// Video whose quiz is being taken.
  final int videoId;

  final GetVideoQuizUseCase _getVideoQuiz;
  final SubmitQuizAnswerUseCase _submitQuizAnswer;
  final GetUserPointsUseCase _getUserPoints;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<QuizState> emit,
  ) async {
    emit(const QuizState.loading());

    final result = await _getVideoQuiz(GetVideoQuizParams(videoId: videoId));

    if (emit.isDone) return;

    await result.fold(
      (failure) async => emit(QuizState.failure(failure: failure)),
      (quiz) async {
        if (!quiz.hasQuestions) {
          emit(const QuizState.empty());
          return;
        }
        if (quiz.isCompleted) {
          final balance = await _loadPointsBalance();
          if (emit.isDone) return;
          emit(
            QuizState.success(
              quiz: quiz,
              showingResults: true,
              pointsBalance: balance,
            ),
          );
          return;
        }
        emit(_successFromQuiz(quiz));
      },
    );
  }

  Future<void> _onAnswerSelected(
    _EventAnswerSelected event,
    Emitter<QuizState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess || current.isSubmitting) return;

    final quiz = current.quizOrNull;
    if (quiz == null || quiz.isCompleted) return;

    final questionIndex = current.currentQuestionIndexOrZero;
    if (questionIndex < 0 || questionIndex >= quiz.questions.length) return;

    final question = quiz.questions[questionIndex];
    if (question.isAnswered) return;

    emit(
      QuizState.success(
        quiz: quiz,
        currentQuestionIndex: questionIndex,
        isSubmitting: true,
        pointsAwarded: current.pointsAwardedOrNull,
        pointsBalance: current.pointsBalanceOrNull,
      ),
    );

    final result = await _submitQuizAnswer(
      SubmitQuizAnswerParams(
        videoId: videoId,
        questionId: question.id,
        answerId: event.answerId,
      ),
    );

    if (emit.isDone) return;

    await result.fold(
      (failure) async {
        if (_answerConflictCodes.contains(failure.code)) {
          await _refreshQuizAfterConflict(
            emit: emit,
            fallbackQuiz: quiz,
            questionIndex: questionIndex,
            pointsAwarded: current.pointsAwardedOrNull,
            pointsBalance: current.pointsBalanceOrNull,
          );
          return;
        }

        emit(
          QuizState.success(
            quiz: quiz,
            currentQuestionIndex: questionIndex,
            pointsAwarded: current.pointsAwardedOrNull,
            pointsBalance: current.pointsBalanceOrNull,
            actionFailure: failure,
          ),
        );
      },
      (answerResult) async {
        final updatedQuestion = _applyAnswerResult(question, answerResult);
        final updatedQuestions = List<VideoQuizQuestion>.of(quiz.questions)
          ..[questionIndex] = updatedQuestion;
        final updatedQuiz = quiz.copyWith(
          versionId: answerResult.versionId,
          versionNumber: answerResult.versionNumber,
          attemptId: answerResult.attemptId,
          status: answerResult.status,
          answeredCount: answerResult.answeredCount,
          totalCount: answerResult.totalCount,
          correctCount: answerResult.correctCount,
          questions: updatedQuestions,
        );

        var pointsAwarded = answerResult.pointsAwarded;
        var pointsBalance = answerResult.pointsBalance;

        if (answerResult.status == QuizStatus.completed &&
            pointsBalance == null) {
          pointsBalance = await _loadPointsBalance();
          if (emit.isDone) return;
        }

        emit(
          QuizState.success(
            quiz: updatedQuiz,
            currentQuestionIndex: questionIndex,
            lastAnswerCorrect: answerResult.correct,
            pointsAwarded: pointsAwarded,
            pointsBalance: pointsBalance,
          ),
        );
      },
    );
  }

  void _onNextRequested(
    _EventNextRequested event,
    Emitter<QuizState> emit,
  ) {
    final current = state;
    if (!current.isSuccess) return;

    final quiz = current.quizOrNull;
    if (quiz == null) return;

    final pointsAwarded = current.pointsAwardedOrNull;
    final pointsBalance = current.pointsBalanceOrNull;

    if (quiz.isCompleted) {
      emit(
        QuizState.success(
          quiz: quiz,
          currentQuestionIndex: current.currentQuestionIndexOrZero,
          showingResults: true,
          pointsAwarded: pointsAwarded,
          pointsBalance: pointsBalance,
        ),
      );
      return;
    }

    final nextIndex = quiz.firstUnansweredIndex;
    if (nextIndex < 0) {
      emit(
        QuizState.success(
          quiz: quiz,
          currentQuestionIndex: current.currentQuestionIndexOrZero,
          showingResults: true,
          pointsAwarded: pointsAwarded,
          pointsBalance: pointsBalance,
        ),
      );
      return;
    }

    emit(
      QuizState.success(
        quiz: quiz,
        currentQuestionIndex: nextIndex,
        pointsAwarded: pointsAwarded,
        pointsBalance: pointsBalance,
      ),
    );
  }

  QuizState _successFromQuiz(VideoQuiz quiz) {
    if (quiz.isCompleted) {
      return QuizState.success(
        quiz: quiz,
        showingResults: true,
      );
    }

    final index = quiz.firstUnansweredIndex;
    return QuizState.success(
      quiz: quiz,
      currentQuestionIndex: index < 0 ? 0 : index,
    );
  }

  Future<void> _refreshQuizAfterConflict({
    required Emitter<QuizState> emit,
    required VideoQuiz fallbackQuiz,
    required int questionIndex,
    int? pointsAwarded,
    int? pointsBalance,
  }) async {
    final refresh = await _getVideoQuiz(
      GetVideoQuizParams(videoId: videoId),
    );
    if (emit.isDone) return;

    await refresh.fold(
      (refreshFailure) async => emit(
        QuizState.success(
          quiz: fallbackQuiz,
          currentQuestionIndex: questionIndex,
          pointsAwarded: pointsAwarded,
          pointsBalance: pointsBalance,
          actionFailure: refreshFailure,
        ),
      ),
      (fresh) async {
        if (fresh.isCompleted) {
          final balance = pointsBalance ?? await _loadPointsBalance();
          if (emit.isDone) return;
          emit(
            QuizState.success(
              quiz: fresh,
              showingResults: true,
              pointsAwarded: pointsAwarded,
              pointsBalance: balance,
            ),
          );
          return;
        }
        emit(_successFromQuiz(fresh));
      },
    );
  }

  Future<int?> _loadPointsBalance() async {
    final result = await _getUserPoints(const NoParams());
    return result.fold((_) => null, (balance) => balance.balance);
  }

  VideoQuizQuestion _applyAnswerResult(
    VideoQuizQuestion question,
    VideoQuizAnswerResult answerResult,
  ) {
    final updatedAnswers = question.answers.map((answer) {
      return VideoQuizAnswer(
        id: answer.id,
        answerEn: answer.answerEn,
        answerTr: answer.answerTr,
        sortOrder: answer.sortOrder,
        correct: answer.id == answerResult.correctAnswerId,
      );
    }).toList();

    return question.copyWith(
      selectedAnswerId: answerResult.selectedAnswerId,
      correctAnswerId: answerResult.correctAnswerId,
      answers: updatedAnswers,
    );
  }

  /// Answer was rejected because the quiz changed server-side; reload it.
  static const Set<String> _answerConflictCodes = {
    BackendErrorCodes.quizAlreadyCompleted,
    BackendErrorCodes.quizQuestionAlreadyAnswered,
    BackendErrorCodes.invalidQuizQuestionId,
  };
}
