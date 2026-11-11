import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/entities/subscription_package.dart';

/// One STANDARD / PREMIUM package card on the paywall.
class PaywallPlanCard extends StatelessWidget {
  /// Creates a [PaywallPlanCard].
  const PaywallPlanCard({
    required this.package,
    required this.onSubscribe,
    this.emphasized = true,
    this.busy = false,
    super.key,
  });

  /// Package to display.
  final SubscriptionPackage package;

  /// Whether this plan should stand out.
  final bool emphasized;

  /// Whether a purchase / restore is in flight.
  final bool busy;

  /// Subscribe tap.
  final VoidCallback onSubscribe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final borderColor = emphasized ? scheme.primary : scheme.outlineVariant;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.fullBorderRadius),
        border: Border.all(color: borderColor, width: emphasized ? 2 : 1),
        color: scheme.surfaceContainerLowest,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              package.plan.titleKey.tr(),
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: AppDimensions.p8),
            Text(
              package.plan.descriptionKey.tr(),
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: AppDimensions.p16),
            Text(
              package.priceString,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: scheme.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.p16),
            if (busy)
              const Center(
                child: AppLoadingIndicator(size: AppLoadingSize.small),
              )
            else
              AppButton(
                expanded: true,
                label: 'subscribe'.tr(),
                onPressed: onSubscribe,
              ),
          ],
        ),
      ),
    );
  }
}
