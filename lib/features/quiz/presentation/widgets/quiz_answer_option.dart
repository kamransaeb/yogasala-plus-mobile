import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_colors.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_icons.dart';
import 'package:yogasala_plus_mobile/core/widgets/svg_icon.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_answer.dart';

/// One selectable (or locked) answer row for a quiz question.
class QuizAnswerOption extends StatelessWidget {
  /// Creates a [QuizAnswerOption].
  const QuizAnswerOption({
    required this.answer,
    required this.locale,
    required this.locked,
    required this.selectedAnswerId,
    required this.correctAnswerId,
    this.onTap,
    super.key,
  });

  /// Answer to display.
  final VideoQuizAnswer answer;

  /// App locale (`tr` / `en`).
  final String locale;

  /// Whether the question is already answered (no further taps).
  final bool locked;

  /// Selected answer id when locked / after submit.
  final int? selectedAnswerId;

  /// Correct answer id when revealed.
  final int? correctAnswerId;

  /// Called when the user taps an unlocked option.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = selectedAnswerId == answer.id;
    final isCorrectOption =
        correctAnswerId != null && answer.id == correctAnswerId;
    final showCorrect = locked && isCorrectOption;
    final showIncorrect = locked && isSelected && !isCorrectOption;

    final Color borderColor;
    final Color fillColor;
    if (showCorrect) {
      borderColor = AppColors.green;
      fillColor = AppColors.green.withValues(alpha: 0.12);
    } else if (showIncorrect) {
      borderColor = AppColors.red;
      fillColor = AppColors.red.withValues(alpha: 0.12);
    } else if (isSelected && !locked) {
      borderColor = theme.colorScheme.onSurface;
      fillColor = theme.colorScheme.surfaceContainerHighest;
    } else {
      borderColor = theme.colorScheme.outlineVariant;
      fillColor = theme.colorScheme.surface;
    }

    return Material(
      color: fillColor,
      borderRadius: BorderRadius.circular(AppDimensions.p12),
      child: InkWell(
        onTap: locked ? null : onTap,
        borderRadius: BorderRadius.circular(AppDimensions.p12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppDimensions.p16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.p12),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  answer.answerForLocale(locale),
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              if (showCorrect)
                const SvgIcon(asset: AppIcons.dialogOk, color: AppColors.green)
              else if (showIncorrect)
                const SvgIcon(
                  asset: AppIcons.dialogError,
                  color: AppColors.red,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
