import 'package:json_annotation/json_annotation.dart';

/// Backend subscription status short.
///
/// Wire: `0` ACTIVE, `1` GRACE, `2` EXPIRED, `3` REVOKED.
enum SubscriptionStatus {
  /// Access granted (`0`).
  @JsonValue(0)
  active(wireValue: 0, label: 'ACTIVE', grantsAccess: true),

  /// Billing grace; access still granted (`1`).
  @JsonValue(1)
  grace(wireValue: 1, label: 'GRACE', grantsAccess: true),

  /// Period ended (`2`).
  @JsonValue(2)
  expired(wireValue: 2, label: 'EXPIRED', grantsAccess: false),

  /// Manually / store revoked (`3`).
  @JsonValue(3)
  revoked(wireValue: 3, label: 'REVOKED', grantsAccess: false);

  const SubscriptionStatus({
    required this.wireValue,
    required this.label,
    required this.grantsAccess,
  });

  /// Backend short ordinal.
  final int wireValue;

  /// Display label.
  final String label;

  /// Whether this status unlocks entitlements.
  final bool grantsAccess;

  /// Parses a backend short ordinal.
  static SubscriptionStatus? fromWire(int? value) {
    for (final status in values) {
      if (status.wireValue == value) return status;
    }
    return null;
  }
}
