import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/bloc/onboarding_agreements/onboarding_agreements_bloc.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/widgets/onboarding_header.dart';

/// Agreements form for onboarding step 5 (progress 5/5).
class OnboardingAgreementsForm extends StatelessWidget {
  /// Creates a [OnboardingAgreementsForm].
  const OnboardingAgreementsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context
        .select<OnboardingAgreementsBloc, FormzSubmissionStatus>(
          (bloc) => bloc.state.status,
        );
    final loadingTexts =
        status == FormzSubmissionStatus.inProgress &&
        context
            .select<OnboardingAgreementsBloc, String>(
              (bloc) => bloc.state.kvkkText,
            )
            .isEmpty;

    return Column(
      children: [
        OnboardingHeader(
          percent: 5 / 5,
          title: 'kvkk_privacy_policy'.tr(),
        ),
        if (loadingTexts)
          const Expanded(child: Center(child: AppLoadingIndicator()))
        else ...[
          AppSpacing.verticalSpacing16,
          const Expanded(child: _AgreementsBody()),
          AppSpacing.verticalSpacing16,
          const _CompleteButton(),
        ],
      ],
    );
  }
}

class _AgreementsBody extends StatelessWidget {
  const _AgreementsBody();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final kvkkText = context.select<OnboardingAgreementsBloc, String>(
      (bloc) => bloc.state.kvkkText,
    );
    final consentText = context.select<OnboardingAgreementsBloc, String>(
      (bloc) => bloc.state.consentText,
    );
    final kvkkAgreed = context.select<OnboardingAgreementsBloc, bool>(
      (bloc) => bloc.state.kvkkAgreed,
    );
    final consentAgreed = context.select<OnboardingAgreementsBloc, bool>(
      (bloc) => bloc.state.consentAgreed,
    );

    return ListView(
      children: [
        Text(
          'kvkk_privacy_policy'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        AppSpacing.verticalSpacing8,
        _ScrollableTextBox(text: kvkkText),
        CheckboxListTile(
          value: kvkkAgreed,
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text('read_and_understood'.tr()),
          onChanged: (value) => context.read<OnboardingAgreementsBloc>().add(
            OnboardingAgreementsEvent.kvkkAgreed(agreed: value ?? false),
          ),
        ),
        AppSpacing.verticalSpacing16,
        Text(
          'user_consent_confirmation_form'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        AppSpacing.verticalSpacing8,
        _ScrollableTextBox(text: consentText),
        CheckboxListTile(
          value: consentAgreed,
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text('read_and_understood'.tr()),
          onChanged: (value) => context.read<OnboardingAgreementsBloc>().add(
            OnboardingAgreementsEvent.consentAgreed(agreed: value ?? false),
          ),
        ),
      ],
    );
  }
}

class _ScrollableTextBox extends StatelessWidget {
  const _ScrollableTextBox({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      padding: const EdgeInsets.all(AppDimensions.contentPadding),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(
          AppDimensions.textFieldBorderRadius,
        ),
      ),
      child: SingleChildScrollView(
        child: Text(text, style: theme.textTheme.bodySmall),
      ),
    );
  }
}

class _CompleteButton extends StatelessWidget {
  const _CompleteButton();

  @override
  Widget build(BuildContext context) {
    context.locale;
    final isValid = context.select<OnboardingAgreementsBloc, bool>(
      (bloc) => bloc.state.isValid,
    );
    final status = context
        .select<OnboardingAgreementsBloc, FormzSubmissionStatus>(
          (bloc) => bloc.state.status,
        );
    final submitting =
        status == FormzSubmissionStatus.inProgress &&
        context
            .select<OnboardingAgreementsBloc, String>(
              (bloc) => bloc.state.kvkkText,
            )
            .isNotEmpty;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppDimensions.pagePadding),
        child: submitting
            ? const AppLoadingIndicator()
            : AppButton(
                size: AppButtonSize.large,
                label: 'complete'.tr(),
                expanded: true,
                onPressed: isValid
                    ? () => context.read<OnboardingAgreementsBloc>().add(
                        const OnboardingAgreementsEvent.completed(),
                      )
                    : null,
              ),
      ),
    );
  }
}
