import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/video_player/domain/entities/playback.dart';

part 'playback_model.g.dart';

/// Serializable playback payload from the mobile user API (PlaybackDTO).
@JsonSerializable()
class PlaybackModel implements ModelToEntityMapper<Playback> {
  /// Creates a [PlaybackModel].
  const PlaybackModel({
    required this.videoId,
    required this.videoTitle,
    required this.playbackId,
    required this.playbackToken,
    required this.streamUrl,
    required this.envKey,
    required this.viewerUserId,
    this.thumbnailToken,
  });

  /// JSON constructor.
  factory PlaybackModel.fromJson(Map<String, dynamic> json) =>
      _$PlaybackModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$PlaybackModelToJson(this);

  /// Video id.
  final int videoId;

  /// Video title.
  final String videoTitle;

  /// Mux playback id.
  final String playbackId;

  /// Signed playback JWT.
  final String playbackToken;

  /// Signed thumbnail JWT.
  final String? thumbnailToken;

  /// HLS stream URL.
  final String streamUrl;

  /// Mux Data environment key.
  final String envKey;

  /// Viewer user id for Mux Data.
  final String viewerUserId;

  @override
  Playback toEntity() => Playback(
        videoId: videoId,
        videoTitle: videoTitle,
        playbackId: playbackId,
        playbackToken: playbackToken,
        thumbnailToken: thumbnailToken,
        streamUrl: streamUrl,
        envKey: envKey,
        viewerUserId: viewerUserId,
      );
}
