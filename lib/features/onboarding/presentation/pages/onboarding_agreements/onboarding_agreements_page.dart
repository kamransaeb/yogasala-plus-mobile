import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_agreements/onboarding_agreements_bloc.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/pages/onboarding_agreements/onboarding_agreements_form.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

/// Onboarding step 5 — KVKK / consent agreements and profile completion.
@RoutePage()
class OnboardingAgreementsPage extends StatelessWidget {
  /// Creates a [OnboardingAgreementsPage].
  const OnboardingAgreementsPage({required this.userYogaSalaPlus, super.key});

  /// Profile being completed.
  final UserYogaSalaPlus userYogaSalaPlus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<OnboardingAgreementsBloc>()
            ..add(OnboardingAgreementsEvent.fetched(userYogaSalaPlus)),
      child: BlocListener<OnboardingAgreementsBloc, OnboardingAgreementsState>(
        listenWhen: (previous, current) =>
            previous.status != current.status &&
            (current.status == FormzSubmissionStatus.success ||
                current.status == FormzSubmissionStatus.failure),
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            unawaited(
              context.router.replaceAll([const MainShellRoute()]),
            );
            return;
          }
          final failure = state.failure;
          if (failure == null) return;
          unawaited(
            Flushbar<void>(
              duration: const Duration(seconds: 3),
              title: 'failure'.tr(),
              message: ErrorMapper.toUserMessage(failure),
              flushbarPosition: FlushbarPosition.TOP,
            ).show(context),
          );
        },
        child: Scaffold(
          appBar: AppBar(),
          body: const Padding(
            padding: EdgeInsets.fromLTRB(
              AppDimensions.pagePadding,
              AppDimensions.pagePadding,
              AppDimensions.pagePadding,
              0,
            ),
            child: OnboardingAgreementsForm(),
          ),
        ),
      ),
    );
  }
}
