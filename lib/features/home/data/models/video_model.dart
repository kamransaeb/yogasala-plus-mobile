import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video.dart';

part 'video_model.g.dart';

/// Serializable video payload from the mobile client API.
@JsonSerializable()
class VideoModel implements ModelToEntityMapper<Video> {
  /// Creates a [VideoModel].
  const VideoModel({
    required this.nameTr,
    required this.nameEn,
    required this.title,
    required this.descriptionTr,
    required this.descriptionEn,
    required this.free,
    required this.enabled,
    this.id,
    this.videosCategoryId,
    this.createDate,
    this.updateDate,
    this.imageUrl,
    this.videoUrl,
    this.minutes,
  });

  /// JSON constructor.
  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$VideoModelToJson(this);

  /// Server id.
  final int? id;

  /// Parent category id.
  final int? videosCategoryId;

  /// Created at.
  final DateTime? createDate;

  /// Updated at.
  final DateTime? updateDate;

  /// Display name (TR).
  final String nameTr;

  /// Display name (EN).
  final String nameEn;

  /// Title.
  final String title;

  /// Description (TR).
  final String descriptionTr;

  /// Description (EN).
  final String descriptionEn;

  /// Thumbnail URL.
  final String? imageUrl;

  /// Playback URL.
  final String? videoUrl;

  /// Whether the video is free.
  final bool free;

  /// Whether the video is enabled.
  final bool enabled;

  /// Duration in minutes.
  final int? minutes;

  @override
  Video toEntity() => Video(
        id: id,
        videosCategoryId: videosCategoryId,
        createDate: createDate,
        updateDate: updateDate,
        nameTr: nameTr,
        nameEn: nameEn,
        title: title,
        descriptionTr: descriptionTr,
        descriptionEn: descriptionEn,
        imageUrl: imageUrl,
        videoUrl: videoUrl,
        free: free,
        enabled: enabled,
        minutes: minutes,
      );
}
