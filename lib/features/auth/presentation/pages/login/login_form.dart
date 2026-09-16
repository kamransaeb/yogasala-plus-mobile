import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/core/utils/validators/email_validator.dart';
import 'package:yogasala_plus_mobile/core/utils/validators/login_password_input.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/login/login_bloc.dart';

/// The login form widget.
class LoginForm extends StatefulWidget {
  /// The constructor for the login form widget.
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, loginState) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            final loading = authState.isLoading;

            return Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'email'.tr(),
                    prefixIcon: const Icon(Icons.email_outlined),
                    errorText:
                        loginState.showErrors || loginState.email.isNotValid
                        ? 'invalid_email'.tr()
                        : null,
                  ),
                  onChanged: (value) => context.read<LoginBloc>().add(
                    LoginEvent.emailChanged(value),
                  ),
                ),
                AppSpacing.verticalSpacing16,
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'password'.tr(),
                    prefixIcon: const Icon(Icons.lock_outline),
                    errorText:
                        loginState.showErrors || loginState.password.isNotValid
                        ? LoginPassword.getErrorMessage(
                            loginState.password.error,
                          )
                        : null,
                  ),
                  onChanged: (value) => context.read<LoginBloc>().add(
                    LoginEvent.passwordChanged(value),
                  ),
                  onFieldSubmitted: (_) => context.read<LoginBloc>().add(
                    const LoginEvent.submitted(),
                  ),
                ),
                AppSpacing.verticalSpacing24,
                if (loading) const AppLoadingIndicator(),
                if (!loading)
                  AppButton(
                    size: AppButtonSize.large,
                    label: 'sign_in'.tr(),
                    expanded: true,
                    borderRadius: AppDimensions.borderRadius,
                    onPressed: loading || !loginState.isValid
                        ? null
                        : () => context.read<LoginBloc>().add(
                            const LoginEvent.submitted(),
                          ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
