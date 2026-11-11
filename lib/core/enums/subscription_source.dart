import 'package:json_annotation/json_annotation.dart';

/// Backend subscription source short.
///
/// Wire: `0` REVENUECAT, `1` MANUAL.
enum SubscriptionSource {
  /// Store / RevenueCat webhook (`0`).
  @JsonValue(0)
  revenueCat(wireValue: 0, label: 'REVENUECAT'),

  /// Admin / complimentary (`1`).
  @JsonValue(1)
  manual(wireValue: 1, label: 'MANUAL');

  const SubscriptionSource({required this.wireValue, required this.label});

  /// Backend short ordinal.
  final int wireValue;

  /// Display label.
  final String label;

  /// Parses a backend short ordinal.
  static SubscriptionSource? fromWire(int? value) {
    for (final source in values) {
      if (source.wireValue == value) return source;
    }
    return null;
  }
}
