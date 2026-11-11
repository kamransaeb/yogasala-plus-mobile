import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/categories/domain/entities/category.dart';

part 'category_model.g.dart';

/// Serializable category payload from the mobile user API (CategoryDTO).
@JsonSerializable()
class CategoryModel implements ModelToEntityMapper<Category> {
  /// Creates a [CategoryModel].
  const CategoryModel({
    this.id,
    this.createDate,
    this.updateDate,
    this.nameTr = '',
    this.nameEn = '',
    this.title = '',
    this.descriptionTr = '',
    this.descriptionEn = '',
    this.enabled = false,
  });

  /// JSON constructor.
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  /// Server id.
  final int? id;

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

  /// Whether the category is enabled.
  @JsonKey(defaultValue: false)
  final bool enabled;

  @override
  Category toEntity() => Category(
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
