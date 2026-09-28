import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/login/presentation/bloc/login_bloc.dart';

/// Login form — uncontrolled fields; values live in [LoginBloc].
///
/// Split widgets + context.select so typing one field does not rebuild the
/// others. Auth side-effects (Flushbar, navigation) stay on the login page.
class LoginForm extends StatelessWidget {
  /// Creates a [LoginForm].
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _EmailInput(),
        AppSpacing.verticalSpacing16,
        _PasswordInput(),
        AppSpacing.verticalSpacing24,
        _LoginButton(),
        AppSpacing.verticalSpacing16,
        _SignUpButton(),
        AppSpacing.verticalSpacing16,
        _ResetPasswordButton(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    context.locale; // subscribe to EasyLocalization
    final displayError = context.select<LoginBloc, UserEmailValidationError?>(
      (bloc) => bloc.state.email.displayError,
    );

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      initialValue: context.read<LoginBloc>().state.email.value,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'email'.tr(),
        prefixIcon: const Icon(Icons.email_outlined),
        errorText: UserEmailValidator.getErrorMessage(displayError)?.tr(),
      ),
      onChanged: (value) => context.read<LoginBloc>().add(
        LoginEvent.emailChanged(value),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    context.locale; // subscribe to EasyLocalization
    final displayError = context
        .select<LoginBloc, UserPasswordValidationError?>(
          (bloc) => bloc.state.password.displayError,
        );

    return TextFormField(
      initialValue: context.read<LoginBloc>().state.password.value,
      obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'password'.tr(),
        prefixIcon: const Icon(Icons.lock_outline),
        errorText: UserPasswordValidator.getErrorMessage(displayError)?.tr(),
      ),
      onChanged: (value) => context.read<LoginBloc>().add(
        LoginEvent.passwordChanged(value),
      ),
      onFieldSubmitted: (_) => context.read<LoginBloc>().add(
        const LoginEvent.submitted(),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    context.locale; // subscribe to EasyLocalization

    final isValid = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.isValid,
    );
    final loading = context.select<AuthBloc, bool>(
      (bloc) => bloc.state.isLoading,
    );

    if (loading) {
      return const AppLoadingIndicator();
    }

    return AppButton(
      size: AppButtonSize.large,
      label: 'login'.tr(),
      expanded: true,
      onPressed: isValid
          ? () => context.read<LoginBloc>().add(const LoginEvent.submitted())
          : null,
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    context.locale; // subscribe to EasyLocalization

    return AppButton(
      key: const Key('loginForm_signUpButton_elevatedButton'),
      size: AppButtonSize.large,
      label: 'sign_up'.tr(),
      expanded: true,
      variant: AppButtonVariant.outlined,
      onPressed: () => context.router.push(const SignUpRoute()),
    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  const _ResetPasswordButton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${'forgot_password'.tr()}?',
          style: theme.textTheme.bodySmall,
        ),
        AppSpacing.horizontalSpacing4,
        TextButton(
          key: const Key('loginForm_resetPassword_textButton'),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () => context.router.push(const ResetPasswordRoute()),
          child: Text(
            'reset'.tr(),
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
