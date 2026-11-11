import 'package:auto_route/auto_route.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/theme_toggle_button.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/errors/backend_error_codes.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/bloc/quiz_attempt_detail_bloc.dart';
import 'package:yogasala_plus_mobile/features/quiz/presentation/widgets/quiz_results_view.dart';

/// Read-only detail for one completed quiz attempt (pinned version).
@RoutePage()
class QuizAttemptDetailPage extends StatelessWidget {
  /// Creates a [QuizAttemptDetailPage] for [attemptId].
  const QuizAttemptDetailPage({
    @PathParam('attemptId') required this.attemptId,
    super.key,
  });

  /// Attempt id to load.
  final int attemptId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<QuizAttemptDetailBloc>(param1: attemptId)
            ..add(const QuizAttemptDetailEvent.fetched()),
      child: const _QuizAttemptDetailView(),
    );
  }
}

class _QuizAttemptDetailView extends StatelessWidget {
  const _QuizAttemptDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('quiz_attempt_detail'.tr()),
        actions: const [],
      ),
      body: BlocConsumer<QuizAttemptDetailBloc, QuizAttemptDetailState>(
        listenWhen: (previous, current) =>
            previous.failureOrNull != current.failureOrNull,
        listener: (context, state) {
          final failure = state.failureOrNull;
          if (failure == null) return;
          AppFlushbar.showFailure(context, failure);
          final code = failure.code;
          if (code == BackendErrorCodes.invalidQuizAttemptId ||
              code == BackendErrorCodes.quizAttemptNotCompleted) {
            context.router.maybePop();
          }
        },
        builder: (context, state) {
          final showLoading = state.maybeMap(
            initial: (_) => true,
            loading: (_) => true,
            orElse: () => false,
          );
          if (showLoading) {
            return const Center(child: AppLoadingIndicator());
          }
          if (state.isFailure) {
            return FailureView(
              failure: state.failureOrNull!,
              onRetry: () => context.read<QuizAttemptDetailBloc>().add(
                const QuizAttemptDetailEvent.fetched(),
              ),
            );
          }

          final quiz = state.quizOrNull;
          if (quiz == null) return const SizedBox.shrink();

          return QuizResultsView(quiz: quiz);
        },
      ),
    );
  }
}
