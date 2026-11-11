import 'package:json_annotation/json_annotation.dart';

/// Backend entitlement short.
///
/// Wire: `0` VIDEO, `1` LIVE.
enum Entitlement {
  /// Paid VOD playback (`0`).
  @JsonValue(0)
  video(wireValue: 0, label: 'VIDEO'),

  /// Live class join (`1`).
  @JsonValue(1)
  live(wireValue: 1, label: 'LIVE');

  const Entitlement({required this.wireValue, required this.label});

  /// Backend short ordinal.
  final int wireValue;

  /// Display label.
  final String label;

  /// Parses a backend short ordinal.
  static Entitlement? fromWire(int? value) {
    for (final entitlement in values) {
      if (entitlement.wireValue == value) return entitlement;
    }
    return null;
  }
}
