import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:yogasala_plus_mobile/core/constants/app_assets_icons.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/locale_buttons.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:yogasala_plus_mobile/features/sign_up/presentation/pages/sign_up_form.dart';

/// Sign-up screen — page-scoped [SignUpBloc], session via root [AuthBloc].
@RoutePage()
class SignUpPage extends StatelessWidget {
  /// Creates a [SignUpPage].
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignUpBloc>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<SignUpBloc, SignUpState>(
            listenWhen: (previous, current) =>
                previous.status != current.status &&
                current.status == FormzSubmissionStatus.success,
            listener: (context, state) {
              context.read<AuthBloc>().add(
                AuthEvent.signUpRequested(
                  email: state.email.value.trim(),
                  password: state.password.value,
                ),
              );
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listenWhen: (previous, current) =>
                previous.maybeMap(loading: (_) => true, orElse: () => false) &&
                current.maybeMap(
                  signUpFailure: (_) => true,
                  signUpSuccess: (_) => true,
                  orElse: () => false,
                ),
            listener: (context, state) {
              if (!(ModalRoute.of(context)?.isCurrent ?? false)) return;
              final signUpBloc = context.read<SignUpBloc>();
              state.maybeMap(
                signUpFailure: (s) {
                  signUpBloc.add(const SignUpEvent.authFailed());
                  unawaited(
                    Flushbar<void>(
                      duration: const Duration(seconds: 3),
                      title: 'failure'.tr(),
                      message: ErrorMapper.toUserMessage(s.failure),
                      flushbarPosition: FlushbarPosition.TOP,
                    ).show(context),
                  );
                },
                signUpSuccess: (s) {
                  final router = context.router;
                  unawaited(
                    Flushbar<void>(
                      duration: const Duration(seconds: 3),
                      title: 'success'.tr(),
                      message: 'success_send_sign_up'.tr(),
                      flushbarPosition: FlushbarPosition.TOP,
                    ).show(context),
                  );
                  unawaited(
                    Future.delayed(const Duration(seconds: 3), () {
                      unawaited(
                        router.replace(
                          LoginRoute(
                            email: s.email,
                            password: s.password,
                          ),
                        ),
                      );
                    }),
                  );
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('sign_up'.tr()),
            actions: [
              const LocaleButtons(),
              BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState) {
                  final status = themeState.currentThemeStatus;
                  return IconButton(
                    tooltip: status.displayName,
                    icon: Icon(status.icon),
                    onPressed: () => context.read<ThemeBloc>().add(
                      const ThemeEvent.toggleRequested(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSpacing.verticalSpacing48,
                SvgPicture.asset(
                  AppAssetsIcons.yogaSalaPlusLogo,
                  height: AppDimensions.iconSizeExtraExtraExtraLarge,
                ),
                AppSpacing.verticalSpacing8,
                Text(
                  'please_sign_up_to_account'.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                AppSpacing.verticalSpacing48,
                const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
