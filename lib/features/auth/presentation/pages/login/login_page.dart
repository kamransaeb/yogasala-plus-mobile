import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/constants/assets_icons.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/navigation/route_guards.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/pages/login/login_form.dart';

/// Login screen — page-scoped [LoginBloc], session via root [AuthBloc].
@RoutePage()
class LoginPage extends StatelessWidget {
  /// Creates a [LoginPage].
  const LoginPage({super.key, this.onResult});

  /// Used by [AuthGuard] when login is pushed over a protected route.
  final void Function({bool? success})? onResult;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginBloc>(),
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
                previous != current &&
                current.maybeWhen(
                  failure: (_) => true,
                  authenticated: (_) => true,
                  orElse: () => false,
                ),
            listener: (context, state) {
              state.maybeWhen(
                failure: (failure) {
                  // Reset submission status only, keep field text in
                  // controllers.
                  context.read<LoginBloc>().add(const LoginEvent.authFailed());
                  unawaited(
                    Flushbar<void>(
                      duration: const Duration(seconds: 3),
                      title: 'failure'.tr(),
                      message: ErrorMapper.toUserMessage(failure).tr(),
                      flushbarPosition: FlushbarPosition.TOP,
                    ).show(context),
                  );
                },
                authenticated: (_) {
                  onResult?.call(success: true);
                  // If opened without guard (rare), fall-back:
                  if (onResult == null) {
                    unawaited(
                      context.router.replace(const PostsDemoRoute()),
                    ); // or your app shell
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
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSpacing.verticalSpacing48,
                SvgPicture.asset(
                  AssetsIcons.yogaSalaPlusLogo,
                  height: AppDimensions.iconSizeExtraExtraExtraLarge,
                ),
                AppSpacing.verticalSpacing8,
                Text(
                  'please_sign_in_to_account'.tr(),
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
