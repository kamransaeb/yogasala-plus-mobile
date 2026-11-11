import 'package:json_annotation/json_annotation.dart';

/// Live session provider short.
///
/// Wire: `0` ZOOM.
enum LiveProvider {
  /// Zoom join URL (`0`).
  @JsonValue(0)
  zoom(wireValue: 0, label: 'ZOOM');

  const LiveProvider({required this.wireValue, required this.label});

  /// Backend short ordinal.
  final int wireValue;

  /// Display label.
  final String label;

  /// Parses a backend short ordinal.
  static LiveProvider? fromWire(int? value) {
    for (final provider in values) {
      if (provider.wireValue == value) return provider;
    }
    return null;
  }
}
