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
import 'package:yogasala_plus_mobile/core/widgets/buttons/locale_buttons.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/theme_toggle_button.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/login/presentation/bloc/login_bloc.dart';
import 'package:yogasala_plus_mobile/features/login/presentation/pages/login_form.dart';

/// Login screen — page-scoped [LoginBloc], session via root [AuthBloc].
@RoutePage()
class LoginPage extends StatelessWidget {
  /// Creates a [LoginPage].
  const LoginPage({super.key, this.onResult, this.email, this.password});

  /// Used by AuthGuard when login is pushed over a protected route.
  final void Function({bool? success})? onResult;

  /// Used to pre-fill the email and password fields.
  final String? email;

  /// Used to pre-fill the password field.
  final String? password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(param1: email, param2: password),
      child: MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listenWhen: (previous, current) =>
                previous.status != current.status &&
                current.status == FormzSubmissionStatus.success,
            listener: (context, state) {
              context.read<AuthBloc>().add(
                AuthEvent.loginRequested(
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
                  failure: (_) => true,
                  authenticated: (_) => true,
                  orElse: () => false,
                ),
            listener: (context, state) {
              if (!(ModalRoute.of(context)?.isCurrent ?? false)) return;
              state.maybeMap(
                failure: (s) {
                  // Reset submission status only, keep field text in
                  // controllers.
                  context.read<LoginBloc>().add(const LoginEvent.authFailed());
                  unawaited(
                    Flushbar<void>(
                      duration: const Duration(seconds: 3),
                      title: 'failure'.tr(),
                      message: ErrorMapper.toUserMessage(s.failure),
                      flushbarPosition: FlushbarPosition.TOP,
                    ).show(context),
                  );
                },
                authenticated: (_) {
                  onResult?.call(success: true);
                  // If opened without guard (rare), fall-back:
                  if (onResult == null) {
                    unawaited(
                      context.router.replace(const AppDirectorRoute()),
                    );
                  }
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('login'.tr()),
            actions: const [
              LocaleButtons(),
              ThemeToggleButton(),
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
                  'please_login_to_account'.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                AppSpacing.verticalSpacing48,
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
