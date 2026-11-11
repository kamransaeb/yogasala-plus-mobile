import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/enums/mux_status.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';

part 'video_model.g.dart';

/// Serializable video payload from the mobile user API (VideoDTO).
@JsonSerializable()
class VideoModel implements ModelToEntityMapper<Video> {
  /// Creates a [VideoModel].
  const VideoModel({
    this.id,
    this.teacherId,
    this.sortOrder,
    this.createDate,
    this.updateDate,
    this.nameTr = '',
    this.nameEn = '',
    this.title = '',
    this.descriptionTr = '',
    this.descriptionEn = '',
    this.imageUrl,
    this.thumbnailUrl,
    this.enabled = false,
    this.muxStatus,
    this.muxDurationSeconds,
    this.favorited = false,
  });

  /// JSON constructor.
  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$VideoModelToJson(this);

  /// Server id.
  final int? id;

  /// Teacher id.
  final int? teacherId;

  /// Sort order within a series/category context.
  final int? sortOrder;

  /// Created at.
  final DateTime? createDate;

  /// Updated at.
  final DateTime? updateDate;

  /// Display name (TR).
  @JsonKey(defaultValue: '')
  final String nameTr;

  /// Display name (EN).
  @JsonKey(defaultValue: '')
  final String nameEn;

  /// Title.
  @JsonKey(defaultValue: '')
  final String title;

  /// Description (TR).
  @JsonKey(defaultValue: '')
  final String descriptionTr;

  /// Description (EN).
  @JsonKey(defaultValue: '')
  final String descriptionEn;

  /// Cover image URL.
  final String? imageUrl;

  /// Thumbnail URL.
  final String? thumbnailUrl;

  /// Whether the video is enabled.
  @JsonKey(defaultValue: false)
  final bool enabled;

  /// Mux processing status.
  final MuxStatus? muxStatus;

  /// Duration in seconds from Mux.
  final double? muxDurationSeconds;

  /// Whether the current user has favorited this video.
  @JsonKey(defaultValue: false)
  final bool favorited;

  @override
  Video toEntity() => Video(
        id: id,
        teacherId: teacherId,
        sortOrder: sortOrder,
        createDate: createDate,
        updateDate: updateDate,
        nameTr: nameTr,
        nameEn: nameEn,
        title: title,
        descriptionTr: descriptionTr,
        descriptionEn: descriptionEn,
        imageUrl: imageUrl,
        thumbnailUrl: thumbnailUrl,
        enabled: enabled,
        muxStatus: muxStatus,
        muxDurationSeconds: muxDurationSeconds,
        favorited: favorited,
      );
}
