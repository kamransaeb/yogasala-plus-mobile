import 'package:auto_route/auto_route.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/theme_toggle_button.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/teachers/presentation/bloc/teacher_bloc.dart';
import 'package:yogasala_plus_mobile/features/teachers/presentation/widgets/teacher_content.dart';

/// Teacher detail: photo and name.
@RoutePage()
class TeacherPage extends StatelessWidget {
  /// Creates a [TeacherPage] for [teacherId].
  const TeacherPage({
    @PathParam('teacherId') required this.teacherId,
    super.key,
  });

  /// Teacher id to load.
  final int teacherId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<TeacherBloc>(param1: teacherId)
            ..add(const TeacherEvent.fetched()),
      child: const _TeacherView(),
    );
  }
}

class _TeacherView extends StatelessWidget {
  const _TeacherView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: BlocBuilder<TeacherBloc, TeacherState>(
        //   buildWhen: (previous, current) =>
        //       previous.teacherOrNull != current.teacherOrNull,
        //   builder: (context, state) {
        //     final teacher = state.teacherOrNull;
        //     if (teacher == null) return const SizedBox.shrink();
        //     return Text(
        //       teacher.fullName,
        //       overflow: TextOverflow.ellipsis,
        //     );
        //   },
        // ),
        actions: const [],
      ),
      body: BlocConsumer<TeacherBloc, TeacherState>(
        listenWhen: (previous, current) =>
            previous.failureOrNull != current.failureOrNull ||
            previous.actionFailureOrNull != current.actionFailureOrNull,
        listener: (context, state) {
          final failure = state.failureOrNull ?? state.actionFailureOrNull;
          if (failure == null) return;
          AppFlushbar.showFailure(context, failure);
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
              onRetry: () =>
                  context.read<TeacherBloc>().add(const TeacherEvent.fetched()),
            );
          }

          final teacher = state.teacherOrNull;
          if (teacher == null) {
            return const SizedBox.shrink();
          }

          return TeacherContent(teacher: teacher);
        },
      ),
    );
  }
}
