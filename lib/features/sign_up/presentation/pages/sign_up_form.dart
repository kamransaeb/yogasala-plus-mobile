import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/sign_up/presentation/bloc/sign_up_bloc.dart';

/// Sign-up form — uncontrolled fields; values live in [SignUpBloc].
///
/// Split widgets + context.select so typing one field does not rebuild the
/// others. Auth side-effects (Flushbar, navigation) stay on the sign-up page.
class SignUpForm extends StatelessWidget {
  /// Creates a [SignUpForm].
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _EmailInput(),
        AppSpacing.verticalSpacing16,
        _PasswordInput(),
        AppSpacing.verticalSpacing16,
        _ConfirmedPasswordInput(),
        AppSpacing.verticalSpacing24,
        _SignUpButton(),
        AppSpacing.verticalSpacing16,
        _LoginLink(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final displayError = context.select<SignUpBloc, UserEmailValidationError?>(
      (bloc) => bloc.state.email.displayError,
    );

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'email'.tr(),
        prefixIcon: const Icon(Icons.email_outlined),
        errorText: UserEmailValidator.getErrorMessage(displayError)?.tr(),
      ),
      onChanged: (value) => context.read<SignUpBloc>().add(
        SignUpEvent.emailChanged(value),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final displayError = context
        .select<SignUpBloc, UserPasswordValidationError?>(
          (bloc) => bloc.state.password.displayError,
        );

    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'password'.tr(),
        prefixIcon: const Icon(Icons.lock_outline),
        errorText: UserPasswordValidator.getErrorMessage(displayError)?.tr(),
      ),
      onChanged: (value) => context.read<SignUpBloc>().add(
        SignUpEvent.passwordChanged(value),
      ),
    );
  }
}

class _ConfirmedPasswordInput extends StatelessWidget {
  const _ConfirmedPasswordInput();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final displayError = context
        .select<SignUpBloc, ConfirmedPasswordValidationError?>(
          (bloc) => bloc.state.confirmedPassword.displayError,
        );

    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'confirm_password'.tr(),
        prefixIcon: const Icon(Icons.lock_outline),
        errorText: ConfirmedPasswordValidator.getErrorMessage(
          displayError,
        )?.tr(),
      ),
      onChanged: (value) => context.read<SignUpBloc>().add(
        SignUpEvent.confirmedPasswordChanged(value),
      ),
      onFieldSubmitted: (_) => context.read<SignUpBloc>().add(
        const SignUpEvent.submitted(),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    context.locale;

    final isValid = context.select<SignUpBloc, bool>(
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
      label: 'sign_up'.tr(),
      expanded: true,
      onPressed: isValid
          ? () => context.read<SignUpBloc>().add(const SignUpEvent.submitted())
          : null,
    );
  }
}

class _LoginLink extends StatelessWidget {
  const _LoginLink();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${'already_have_an_account'.tr()}?',
          style: theme.textTheme.bodySmall,
        ),
        AppSpacing.horizontalSpacing4,
        TextButton(
          key: const Key('signUpForm_login_textButton'),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () => context.router.maybePop(),
          child: Text(
            'login'.tr(),
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
