import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';

part 'serie_model.g.dart';

/// Serializable series payload from the mobile user API (SeriesDTO).
@JsonSerializable()
class SerieModel implements ModelToEntityMapper<Serie> {
  /// Creates a [SerieModel].
  const SerieModel({
    this.id,
    this.teacherId,
    this.categoryIds = const [],
    this.videoIds = const [],
    this.createDate,
    this.updateDate,
    this.title = '',
    this.nameTr = '',
    this.nameEn = '',
    this.descriptionTr = '',
    this.descriptionEn = '',
    this.imageUrl,
    this.free = false,
    this.enabled = false,
    this.totalDurationSeconds,
  });

  /// JSON constructor.
  factory SerieModel.fromJson(Map<String, dynamic> json) =>
      _$SerieModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$SerieModelToJson(this);

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
  @JsonKey(defaultValue: '')
  final String title;

  /// Display name (TR).
  @JsonKey(defaultValue: '')
  final String nameTr;

  /// Display name (EN).
  @JsonKey(defaultValue: '')
  final String nameEn;

  /// Description (TR).
  @JsonKey(defaultValue: '')
  final String descriptionTr;

  /// Description (EN).
  @JsonKey(defaultValue: '')
  final String descriptionEn;

  /// Cover image URL.
  final String? imageUrl;

  /// Whether the whole series is free.
  @JsonKey(defaultValue: false)
  final bool free;

  /// Whether the series is enabled.
  @JsonKey(defaultValue: false)
  final bool enabled;

  /// Total length of all episodes in seconds (from backend).
  final double? totalDurationSeconds;

  @override
  Serie toEntity() => Serie(
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
