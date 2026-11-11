import 'package:yogasala_plus_mobile/core/enums/subscription_plan.dart';

/// Store package shown on the paywall (mapped from RevenueCat).
class SubscriptionPackage {
  /// Creates a [SubscriptionPackage].
  const SubscriptionPackage({
    required this.packageId,
    required this.plan,
    required this.priceString,
    required this.title,
    this.description = '',
  });

  /// RevenueCat package identifier (used to purchase).
  final String packageId;

  /// STANDARD or PREMIUM.
  final SubscriptionPlan plan;

  /// Localized price from the store (e.g. `$9.99`).
  final String priceString;

  /// Store product title.
  final String title;

  /// Store product description.
  final String description;
}
