import 'package:json_annotation/json_annotation.dart';

/// YogaSala Plus subscription plans (RevenueCat + backend).
///
/// Wire: `0` STANDARD, `1` PREMIUM.
enum SubscriptionPlan {
  /// VIDEO entitlement only (`0`).
  @JsonValue(0)
  standard(
    wireValue: 0,
    label: 'STANDARD',
    titleKey: 'plan_standard',
    descriptionKey: 'plan_standard_description',
  ),

  /// VIDEO + LIVE entitlements (`1`).
  @JsonValue(1)
  premium(
    wireValue: 1,
    label: 'PREMIUM',
    titleKey: 'plan_premium',
    descriptionKey: 'plan_premium_description',
  );

  const SubscriptionPlan({
    required this.wireValue,
    required this.label,
    required this.titleKey,
    required this.descriptionKey,
  });

  /// Backend short ordinal.
  final int wireValue;

  /// Display / product label (`STANDARD` / `PREMIUM`).
  final String label;

  /// Localization key for the plan title.
  final String titleKey;

  /// Localization key for the plan description.
  final String descriptionKey;

  /// Parses a backend short ordinal.
  static SubscriptionPlan? fromWire(int? value) {
    for (final plan in values) {
      if (plan.wireValue == value) return plan;
    }
    return null;
  }

  /// Parses a query param or legacy label (`0` / `1` / `STANDARD` / `PREMIUM`).
  static SubscriptionPlan? parse(String? raw) {
    if (raw == null) return null;
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return null;
    final asInt = int.tryParse(trimmed);
    if (asInt != null) return fromWire(asInt);
    return fromProductId(trimmed);
  }

  /// Detects plan from a RevenueCat package / product identifier.
  static SubscriptionPlan? fromProductId(String raw) {
    final id = raw.toUpperCase();
    if (id.contains('PREMIUM')) return SubscriptionPlan.premium;
    if (id.contains('STANDARD')) return SubscriptionPlan.standard;
    return null;
  }
}
