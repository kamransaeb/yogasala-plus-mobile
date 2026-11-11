import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/widgets/quiz_answer_option.dart';

/// Read-only quiz summary after [VideoQuiz.isCompleted].
class QuizResultsView extends StatelessWidget {
  /// Creates a [QuizResultsView].
  const QuizResultsView({
    required this.quiz,
    this.pointsAwarded,
    this.pointsBalance,
    super.key,
  });

  /// Completed quiz.
  final VideoQuiz quiz;

  /// Points awarded when the quiz first completed, if known.
  final int? pointsAwarded;

  /// Current points balance, if known.
  final int? pointsBalance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = context.watch<AppBloc>().state.locale;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(
        AppDimensions.p24,
        AppDimensions.p16,
        AppDimensions.p24,
        bottomInset > 0 ? bottomInset : AppDimensions.p16,
      ),
      itemCount: quiz.questions.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.p24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('quiz_results'.tr(), style: theme.textTheme.titleLarge),
                // if (quiz.versionNumber != null) ...[
                //   const SizedBox(height: AppDimensions.p8),
                //   Text(
                //     'quiz_version'.tr(args: ['${quiz.versionNumber}']),
                //     style: theme.textTheme.bodyMedium?.copyWith(
                //       color: theme.colorScheme.onSurfaceVariant,
                //     ),
                //   ),
                // ],
                const SizedBox(height: AppDimensions.p8),
                Text(
                  'quiz_score'.tr(
                    args: [
                      '${quiz.correctCount}',
                      '${quiz.totalCount}',
                    ],
                  ),
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: AppDimensions.p8),
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
                if (pointsAwarded != null) ...[
                  const SizedBox(height: AppDimensions.p8),
                  Text(
                    'quiz_points_awarded'.tr(args: ['$pointsAwarded']),
                    style: theme.textTheme.titleMedium,
                  ),
                ],
                if (pointsBalance != null) ...[
                  const SizedBox(height: AppDimensions.p8),
                  Text(
                    'points_balance'.tr(args: ['$pointsBalance']),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          );
        }

        final question = quiz.questions[index - 1];
        final selectedId = question.selectedAnswerId;
        final correctId = question.correctAnswerId;
        final isCorrect =
            selectedId != null && correctId != null && selectedId == correctId;

        return Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.p24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgIcon(
                    asset: isCorrect ? AppIcons.dialogOk : AppIcons.dialogError,
                    color: isCorrect ? AppColors.green : AppColors.red,
                    //size: AppDimensions.iconSizeMedium,
                  ),
                  // Icon(
                  //   isCorrect ? Icons.check_circle : Icons.cancel,
                  //   color: isCorrect ? AppColors.green : AppColors.red,
                  //   size: AppDimensions.iconSizeMedium,
                  // ),
                  const SizedBox(width: AppDimensions.p8),
                  Expanded(
                    child: Text(
                      'quiz_question_number'.tr(
                        args: ['$index', '${quiz.totalCount}'],
                      ),
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.p8),
              Text(
                question.questionForLocale(locale),
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: AppDimensions.p12),
              for (var i = 0; i < question.answers.length; i++) ...[
                if (i > 0) const SizedBox(height: AppDimensions.p8),
                QuizAnswerOption(
                  answer: question.answers[i],
                  locale: locale,
                  locked: true,
                  selectedAnswerId: selectedId,
                  correctAnswerId: correctId,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
