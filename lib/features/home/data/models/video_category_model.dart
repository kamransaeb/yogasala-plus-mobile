import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video_category.dart';

part 'video_category_model.g.dart';

/// Serializable video category payload from the mobile client API.
@JsonSerializable()
class VideoCategoryModel implements ModelToEntityMapper<VideoCategory> {
  /// Creates a [VideoCategoryModel].
  const VideoCategoryModel({
    required this.nameTr,
    required this.nameEn,
    required this.title,
    required this.descriptionTr,
    required this.descriptionEn,
    required this.enabled,
    this.id,
    this.createDate,
    this.updateDate,
  });

  /// JSON constructor.
  factory VideoCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$VideoCategoryModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$VideoCategoryModelToJson(this);

  /// Server id.
  final int? id;

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

  /// Whether the category is enabled.
  final bool enabled;

  @override
  VideoCategory toEntity() => VideoCategory(
        id: id,
        createDate: createDate,
        updateDate: updateDate,
        nameTr: nameTr,
        nameEn: nameEn,
        title: title,
        descriptionTr: descriptionTr,
        descriptionEn: descriptionEn,
        enabled: enabled,
      );
}
