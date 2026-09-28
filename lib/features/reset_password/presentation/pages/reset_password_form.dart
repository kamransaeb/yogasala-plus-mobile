import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/reset_password/presentation/bloc/reset_password_bloc.dart';

/// Reset-password form — uncontrolled email; value lives in
/// [ResetPasswordBloc].
class ResetPasswordForm extends StatelessWidget {
  /// Creates a [ResetPasswordForm].
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _EmailInput(),
        AppSpacing.verticalSpacing24,
        _SendResetLinkButton(),
        AppSpacing.verticalSpacing16,
        _BackToLoginLink(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final displayError = context
        .select<ResetPasswordBloc, UserEmailValidationError?>(
          (bloc) => bloc.state.email.displayError,
        );

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'email'.tr(),
        prefixIcon: const Icon(Icons.email_outlined),
        errorText: UserEmailValidator.getErrorMessage(displayError)?.tr(),
      ),
      onChanged: (value) => context.read<ResetPasswordBloc>().add(
        ResetPasswordEvent.emailChanged(value),
      ),
      onFieldSubmitted: (_) => context.read<ResetPasswordBloc>().add(
        const ResetPasswordEvent.submitted(),
      ),
    );
  }
}

class _SendResetLinkButton extends StatelessWidget {
  const _SendResetLinkButton();

  @override
  Widget build(BuildContext context) {
    context.locale;

    final isValid = context.select<ResetPasswordBloc, bool>(
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
      label: 'reset'.tr(),
      expanded: true,
      onPressed: isValid
          ? () => context.read<ResetPasswordBloc>().add(
              const ResetPasswordEvent.submitted(),
            )
          : null,
    );
  }
}

class _BackToLoginLink extends StatelessWidget {
  const _BackToLoginLink();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      key: const Key('resetPasswordForm_backToLogin_textButton'),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () => context.router.maybePop(),
      child: Text(
        'back_to_login'.tr(),
        style: theme.textTheme.titleSmall?.copyWith(
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
