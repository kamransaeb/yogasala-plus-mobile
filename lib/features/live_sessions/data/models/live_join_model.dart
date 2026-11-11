import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/enums/live_provider.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/domain/entities/live_join.dart';

part 'live_join_model.g.dart';

/// Serializable join payload from `POST …/join`.
@JsonSerializable()
class LiveJoinModel implements ModelToEntityMapper<LiveJoin> {
  /// Creates a [LiveJoinModel].
  const LiveJoinModel({
    required this.slotId,
    required this.provider,
    required this.joinUrl,
    required this.occurrenceStart,
  });

  /// JSON constructor.
  factory LiveJoinModel.fromJson(Map<String, dynamic> json) =>
      _$LiveJoinModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$LiveJoinModelToJson(this);

  /// Slot id.
  final int slotId;

  /// Provider short (`0` ZOOM).
  final int provider;

  /// External join URL.
  @JsonKey(defaultValue: '')
  final String joinUrl;

  /// Occurrence start ISO.
  final String occurrenceStart;

  @override
  LiveJoin toEntity() {
    return LiveJoin(
      slotId: slotId,
      provider: LiveProvider.fromWire(provider) ?? LiveProvider.zoom,
      joinUrl: joinUrl,
      occurrenceStart: DateTime.parse(occurrenceStart),
    );
  }
}
