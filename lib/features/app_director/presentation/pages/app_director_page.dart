import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/app_director/presentation/widgets/update_app_dialog.dart';
import 'package:yogasala_plus_mobile/features/app_director/presentation/bloc/app_director_bloc.dart';

/// Unguarded bootstrap route: AppData → auth → Login or Profile.
///
/// Lives under the router [Navigator], so Flushbar / dialogs use page context.
@RoutePage()
class AppDirectorPage extends StatelessWidget {
  /// Creates a [AppDirectorPage].
  const AppDirectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    getIt.get<LoggerService>().i('AppDirectorPage build');
    // Cold start and Login → return (route remount). Bloc ignores if busy /
    // already decided (success / force-update).

    return BlocProvider(
      create: (_) =>
          getIt<AppDirectorBloc>()..add(const AppDirectorEvent.loaded()),
      child: BlocConsumer<AppDirectorBloc, AppDirectorState>(
        listenWhen: (previous, current) =>
            previous.isFailure != current.isFailure ||
            previous.isSuccess != current.isSuccess ||
            previous.isUpdateRequired != current.isUpdateRequired,
        listener: (context, state) {
          if (state.isUpdateRequired) {
            unawaited(
              showUpdateAppDialog(
                context,
                storeUrlEn: state.storeUrlEn,
                storeUrlTr: state.storeUrlTr,
              ),
            );
            return;
          }

          if (state.isFailure) {
            final failure = state.failureOrNull;
            if (failure is UnauthorizedAccessFailure) {
              unawaited(context.router.replaceAll([LoginRoute()]));
              return;
            }
            if (failure != null) {
              unawaited(
                Flushbar<void>(
                  duration: const Duration(seconds: 3),
                  title: 'failure'.tr(),
                  message: ErrorMapper.toUserMessage(failure),
                  flushbarPosition: FlushbarPosition.TOP,
                ).show(context),
              );
            }
            if (state.isAppUpdate) {
              final bloc = context.read<AppDirectorBloc>();
              unawaited(
                Future<void>.delayed(
                  const Duration(seconds: 5),
                  () => bloc.add(const AppDirectorEvent.loaded()),
                ),
              );
            } else {
              unawaited(
                showUpdateAppDialog(
                  context,
                  storeUrlEn: state.storeUrlEn,
                  storeUrlTr: state.storeUrlTr,
                ),
              );
            }
          }

          if (state.isSuccess) {
            final user = state.maybeMap(
              success: (s) => s.userYogaSalaPlus,
              orElse: () => null,
            );
            // Incomplete profile → onboarding wizard (name → … → agreements).
            if (user != null && !user.profileCompleted) {
              unawaited(
                context.router.replace(
                  OnboardingNameSurnameRoute(userYogaSalaPlus: user),
                ),
              );
            } else {
              unawaited(context.router.replace(const MainShellRoute()));
            }
          }
        },
        builder: (context, state) {
          return state.isSuccess
              ? const Scaffold(body: SizedBox.shrink())
              : const Scaffold(body: Center(child: AppLoadingIndicator()));
        },
      ),
    );
  }
}
