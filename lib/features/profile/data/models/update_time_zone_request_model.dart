import 'package:json_annotation/json_annotation.dart';

part 'update_time_zone_request_model.g.dart';

/// Body for `PUT .../time-zone`.
@JsonSerializable()
class UpdateTimeZoneRequestModel {
  /// Creates an [UpdateTimeZoneRequestModel].
  const UpdateTimeZoneRequestModel({required this.timeZone});

  /// JSON constructor.
  factory UpdateTimeZoneRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateTimeZoneRequestModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$UpdateTimeZoneRequestModelToJson(this);

  /// IANA time zone id (e.g. `Europe/Istanbul`).
  final String timeZone;
}
