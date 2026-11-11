import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_serie_list_box_image.dart';
import 'package:yogasala_plus_mobile/features/quiz/domain/entities/video_quiz_attempt_summary.dart';

/// One completed quiz attempt row in "My Quizzes".
class QuizAttemptListTile extends StatelessWidget {
  /// Creates a [QuizAttemptListTile].
  const QuizAttemptListTile({required this.attempt, super.key});

  /// Attempt summary.
  final VideoQuizAttemptSummary attempt;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = context.watch<AppBloc>().state.locale;
    final name = attempt.videoNameForLocale(locale);
    const imageSize = AppDimensions.tileListImageSize;
    final completed = DateFormat.yMMMd(
      context.locale.toString(),
    ).add_jm().format(attempt.completedAt.toLocal());

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.p16,
        vertical: AppDimensions.p8,
      ),
      leading: SizedBox(
        width: imageSize,
        height: imageSize,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            AppDimensions.halfBorderRadius,
          ),
          child: HomeSerieListBoxImage(
            width: imageSize,
            height: imageSize,
            imageUrl: attempt.videoImageUrl,
          ),
        ),
      ),
      title: Text(
        name.isEmpty ? '—' : name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.titleMedium,
      ),
      subtitle: Text(
        [
          'quiz_score'.tr(
            args: [
              '${attempt.correctCount}',
              '${attempt.totalCount}',
            ],
          ),
          //'quiz_version'.tr(args: ['${attempt.versionNumber}']),
          completed,
        ].join(' · '),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.bodySmall,
      ),
      onTap: () => context.router.push(
        QuizAttemptDetailRoute(attemptId: attempt.attemptId),
      ),
    );
  }
}
