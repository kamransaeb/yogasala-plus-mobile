import 'package:yogasala_plus_mobile/core/enums/mux_status.dart';
import 'package:yogasala_plus_mobile/core/utils/entity_to_model_mapper.dart';
import 'package:yogasala_plus_mobile/features/videos/data/models/video_model.dart';

/// Domain video entity (maps to backend VideoDTO).
class Video implements EntityToModelMapper<VideoModel> {
  /// Creates a [Video].
  const Video({
    required this.nameTr,
    required this.nameEn,
    required this.title,
    required this.descriptionTr,
    required this.descriptionEn,
    required this.enabled,
    this.id,
    this.teacherId,
    this.sortOrder,
    this.createDate,
    this.updateDate,
    this.imageUrl,
    this.thumbnailUrl,
    this.muxStatus,
    this.muxDurationSeconds,
    this.favorited = false,
  });

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
  final String nameTr;

  /// Display name (EN).
  final String nameEn;

  /// Title.
  final String title;

  /// Description (TR).
  final String descriptionTr;

  /// Description (EN).
  final String descriptionEn;

  /// Cover image URL.
  final String? imageUrl;

  /// Thumbnail URL.
  final String? thumbnailUrl;

  /// Whether the video is enabled.
  final bool enabled;

  /// Mux processing status.
  final MuxStatus? muxStatus;

  /// Duration in seconds from Mux.
  final double? muxDurationSeconds;

  /// Whether the current user has favorited this video.
  final bool favorited;

  /// Duration in whole minutes (ceil), if known.
  int? get minutes {
    final seconds = muxDurationSeconds;
    if (seconds == null) return null;
    return (seconds / 60).ceil();
  }

  /// Total length as `HH:MM:SS`, if known.
  String? get durationHhMmSs {
    final total = muxDurationSeconds;
    if (total == null) return null;
    final seconds = total.round().clamp(0, 99 * 60 * 60);
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final remainder = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${remainder.toString().padLeft(2, '0')}';
  }

  /// Preferred image for cards (thumbnail, else cover).
  String? get displayImageUrl => imageUrl ?? thumbnailUrl;

  /// Localized name for [locale] (`tr` / `en`).
  String nameForLocale(String locale) => locale == 'tr' ? nameTr : nameEn;

  /// Localized description for [locale] (`tr` / `en`).
  String descriptionForLocale(String locale) =>
      locale == 'tr' ? descriptionTr : descriptionEn;

  /// Copy with optional overrides.
  Video copyWith({
    int? id,
    int? teacherId,
    int? sortOrder,
    DateTime? createDate,
    DateTime? updateDate,
    String? nameTr,
    String? nameEn,
    String? title,
    String? descriptionTr,
    String? descriptionEn,
    String? imageUrl,
    String? thumbnailUrl,
    bool? enabled,
    MuxStatus? muxStatus,
    double? muxDurationSeconds,
    bool? favorited,
  }) {
    return Video(
      id: id ?? this.id,
      teacherId: teacherId ?? this.teacherId,
      sortOrder: sortOrder ?? this.sortOrder,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      nameTr: nameTr ?? this.nameTr,
      nameEn: nameEn ?? this.nameEn,
      title: title ?? this.title,
      descriptionTr: descriptionTr ?? this.descriptionTr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      imageUrl: imageUrl ?? this.imageUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      enabled: enabled ?? this.enabled,
      muxStatus: muxStatus ?? this.muxStatus,
      muxDurationSeconds: muxDurationSeconds ?? this.muxDurationSeconds,
      favorited: favorited ?? this.favorited,
    );
  }

  @override
  VideoModel toModel() => VideoModel(
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
