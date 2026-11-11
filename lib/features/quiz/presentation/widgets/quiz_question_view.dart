import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_question.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/widgets/quiz_answer_option.dart';

/// One quiz question page: prompt, options, progress, next when answered.
class QuizQuestionView extends StatelessWidget {
  /// Creates a [QuizQuestionView].
  const QuizQuestionView({
    required this.quiz,
    required this.question,
    required this.questionIndex,
    required this.isSubmitting,
    this.lastAnswerCorrect,
    super.key,
  });

  /// Full quiz (for progress).
  final VideoQuiz quiz;

  /// Question to show.
  final VideoQuizQuestion question;

  /// Zero-based index in [VideoQuiz.questions].
  final int questionIndex;

  /// Whether a submit is in flight.
  final bool isSubmitting;

  /// Correctness of the last submit for this question, if any.
  final bool? lastAnswerCorrect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = context.watch<AppBloc>().state.locale;
    final locked = question.isAnswered || isSubmitting;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.p24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'quiz_progress'.tr(
                    args: [
                      '${quiz.answeredCount}',
                      '${quiz.totalCount}',
                    ],
                  ),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppDimensions.p8),
                Text(
                  'quiz_question_number'.tr(
                    args: [
                      '${questionIndex + 1}',
                      '${quiz.totalCount}',
                    ],
                  ),
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: AppDimensions.p16),
                Text(
                  question.questionForLocale(locale),
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: AppDimensions.p24),
                for (var i = 0; i < question.answers.length; i++) ...[
                  if (i > 0) const SizedBox(height: AppDimensions.p12),
                  QuizAnswerOption(
                    answer: question.answers[i],
                    locale: locale,
                    locked: locked,
                    selectedAnswerId: question.selectedAnswerId,
                    correctAnswerId: question.correctAnswerId,
                    onTap: isSubmitting
                        ? null
                        : () => context.read<QuizBloc>().add(
                            QuizEvent.answerSelected(
                              answerId: question.answers[i].id,
                            ),
                          ),
                  ),
                ],
                if (question.isAnswered && lastAnswerCorrect != null) ...[
                  const SizedBox(height: AppDimensions.p16),
                  Text(
                    lastAnswerCorrect!
                        ? 'quiz_answer_correct'.tr()
                        : 'quiz_answer_incorrect'.tr(),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: lastAnswerCorrect!
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.error,
                    ),
                  ),
                ],
                if (isSubmitting) ...[
                  const SizedBox(height: AppDimensions.p24),
                  const Center(child: AppLoadingIndicator()),
                ],
              ],
            ),
          ),
        ),
        if (question.isAnswered)
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                AppDimensions.p16,
                AppDimensions.p8,
                AppDimensions.p16,
                bottomInset > 0 ? AppDimensions.p8 : AppDimensions.p16,
              ),
              child: AppButton(
                expanded: true,
                size: AppButtonSize.large,

                boxColor: theme.colorScheme.primary,
                label: quiz.answeredCount >= quiz.totalCount
                    ? 'quiz_see_results'.tr()
                    : 'next'.tr(),
                onPressed: () => context.read<QuizBloc>().add(
                  const QuizEvent.nextRequested(),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
