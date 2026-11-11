import 'package:yogasala_plus_mobile/core/utils/entity_to_model_mapper.dart';
import 'package:yogasala_plus_mobile/features/categories/data/models/category_model.dart';

/// Domain category entity (maps to backend CategoryDTO).
class Category implements EntityToModelMapper<CategoryModel> {
  /// Creates a [Category].
  const Category({
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

  /// Localized name for [locale] (`tr` / `en`).
  String nameForLocale(String locale) => locale == 'tr' ? nameTr : nameEn;

  @override
  CategoryModel toModel() => CategoryModel(
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
