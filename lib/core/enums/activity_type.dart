import 'package:json_annotation/json_annotation.dart';

/// Activity logged on a user activity day.
///
/// Wire values: `0` VIDEO, `1` LIVE.
enum ActivityType {
  /// On-demand video practice (`0`).
  @JsonValue(0)
  video(wireValue: 0),

  /// Live session (`1`).
  @JsonValue(1)
  live(wireValue: 1);

  const ActivityType({required this.wireValue});

  /// Backend integer value.
  final int wireValue;

  /// Parses a wire int; returns null if unknown.
  static ActivityType? fromWire(int? value) {
    for (final type in values) {
      if (type.wireValue == value) return type;
    }
    return null;
  }
}
