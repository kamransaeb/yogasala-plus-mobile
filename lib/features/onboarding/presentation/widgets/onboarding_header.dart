import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_spacing.dart';
import 'package:yogasala_plus_mobile/features/onboarding/presentation/widgets/onboarding_progress.dart';

/// Progress bar plus step title shown under the AppBar on onboarding pages.
class OnboardingHeader extends StatelessWidget {
  /// Creates an [OnboardingHeader].
  const OnboardingHeader({
    required this.percent,
    required this.title,
    super.key,
  });

  /// Progress fraction from `0.0` to `1.0`.
  final double percent;

  /// Localization key for the step title.
  final String title;

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OnboardingProgress(percent: percent),
        AppSpacing.verticalSpacing24,
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
