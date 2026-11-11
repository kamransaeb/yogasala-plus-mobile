import 'package:yogasala_plus_mobile/core/utils/entity_to_model_mapper.dart';
import 'package:yogasala_plus_mobile/features/series/data/models/serie_model.dart';

/// Domain series entity (maps to backend SeriesDTO).
class Serie implements EntityToModelMapper<SerieModel> {
  /// Creates a [Serie].
  const Serie({
    required this.nameTr,
    required this.nameEn,
    required this.title,
    required this.descriptionTr,
    required this.descriptionEn,
    required this.free,
    required this.enabled,
    this.id,
    this.teacherId,
    this.categoryIds = const [],
    this.videoIds = const [],
    this.createDate,
    this.updateDate,
    this.imageUrl,
    this.totalDurationSeconds,
  });

  /// Server id.
  final int? id;

  /// Teacher id.
  final int? teacherId;

  /// Categories this series belongs to.
  final List<int> categoryIds;

  /// Ordered video ids in this series.
  final List<int> videoIds;

  /// Created at.
  final DateTime? createDate;

  /// Updated at.
  final DateTime? updateDate;

  /// Title.
  final String title;

  /// Display name (TR).
  final String nameTr;

  /// Display name (EN).
  final String nameEn;

  /// Description (TR).
  final String descriptionTr;

  /// Description (EN).
  final String descriptionEn;

  /// Cover image URL.
  final String? imageUrl;

  /// Whether the whole series is free.
  final bool free;

  /// Whether the series is enabled.
  final bool enabled;

  /// Total length of all episodes in seconds (from backend).
  final double? totalDurationSeconds;

  /// Episode count from [videoIds].
  int get episodeCount => videoIds.length;

  /// Total length as `HH:MM:SS`, if known.
  String? get totalDurationHhMmSs {
    final total = totalDurationSeconds;
    if (total == null) return null;
    final seconds = total.round().clamp(0, 99 * 60 * 60);
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final remainder = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${remainder.toString().padLeft(2, '0')}';
  }

  /// Localized name for [locale] (`tr` / `en`).
  String nameForLocale(String locale) => locale == 'tr' ? nameTr : nameEn;

  /// Whether this series is assigned to [categoryId].
  bool belongsToCategory(int categoryId) => categoryIds.contains(categoryId);

  /// Localized description for [locale] (`tr` / `en`).
  String descriptionForLocale(String locale) =>
      locale == 'tr' ? descriptionTr : descriptionEn;

  /// Copy with optional overrides.
  Serie copyWith({
    int? id,
    int? teacherId,
    List<int>? categoryIds,
    List<int>? videoIds,
    DateTime? createDate,
    DateTime? updateDate,
    String? title,
    String? nameTr,
    String? nameEn,
    String? descriptionTr,
    String? descriptionEn,
    String? imageUrl,
    bool? free,
    bool? enabled,
    double? totalDurationSeconds,
  }) {
    return Serie(
      id: id ?? this.id,
      teacherId: teacherId ?? this.teacherId,
      categoryIds: categoryIds ?? this.categoryIds,
      videoIds: videoIds ?? this.videoIds,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      title: title ?? this.title,
      nameTr: nameTr ?? this.nameTr,
      nameEn: nameEn ?? this.nameEn,
      descriptionTr: descriptionTr ?? this.descriptionTr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      imageUrl: imageUrl ?? this.imageUrl,
      free: free ?? this.free,
      enabled: enabled ?? this.enabled,
      totalDurationSeconds: totalDurationSeconds ?? this.totalDurationSeconds,
    );
  }

  @override
  SerieModel toModel() => SerieModel(
    id: id,
    teacherId: teacherId,
    categoryIds: categoryIds,
    videoIds: videoIds,
    createDate: createDate,
    updateDate: updateDate,
    title: title,
    nameTr: nameTr,
    nameEn: nameEn,
    descriptionTr: descriptionTr,
    descriptionEn: descriptionEn,
    imageUrl: imageUrl,
    free: free,
    enabled: enabled,
    totalDurationSeconds: totalDurationSeconds,
  );
}
