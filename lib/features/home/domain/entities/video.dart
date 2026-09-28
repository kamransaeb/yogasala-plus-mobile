import 'package:yogasala_plus_mobile/core/utils/entity_to_model_mapper.dart';
import 'package:yogasala_plus_mobile/features/home/data/models/video_model.dart';

/// Domain video entity.
class Video implements EntityToModelMapper<VideoModel> {
  /// Creates a [Video].
  const Video({
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

  /// Localized name for [locale] (`tr` / `en`).
  String nameForLocale(String locale) =>
      locale == 'tr' ? nameTr : nameEn;

  @override
  VideoModel toModel() => VideoModel(
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
