import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';

/// Linear onboarding progress bar. [percent] is expected in the inclusive
/// range `0.0`–`1.0` (e.g. step 1 of 5 → `0.2`).
class OnboardingProgress extends StatelessWidget {
  /// Creates a [OnboardingProgress].
  const OnboardingProgress({required this.percent, super.key});

  /// Progress fraction from `0.0` to `1.0`.
  final double percent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LinearProgressIndicator(
      value: percent.clamp(0.0, 1.0),
      minHeight: 4,
      borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
      backgroundColor: theme.colorScheme.surfaceContainerHigh,
      color: theme.colorScheme.primary,
    );
  }
}
