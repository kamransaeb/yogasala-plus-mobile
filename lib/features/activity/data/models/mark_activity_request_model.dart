import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/enums/activity_type.dart';

part 'mark_activity_request_model.g.dart';

/// Body for `POST /mobile/user/activity`.
@JsonSerializable()
class MarkActivityRequestModel {
  /// Creates a [MarkActivityRequestModel].
  const MarkActivityRequestModel({required this.type});

  /// JSON constructor.
  factory MarkActivityRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MarkActivityRequestModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$MarkActivityRequestModelToJson(this);

  /// Activity type (`0` video / `1` live).
  final ActivityType type;
}
