import 'package:yogasala_plus_mobile/core/utils/entity_to_model_mapper.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/models/teacher_model.dart';

/// Domain teacher entity (maps to backend TeacherDTO).
class Teacher implements EntityToModelMapper<TeacherModel> {
  /// Creates a [Teacher].
  const Teacher({
    required this.name,
    required this.surname,
    required this.enabled,
    this.id,
    this.imageUrl,
    this.bioTr,
    this.bioEn,
    this.createDate,
    this.updateDate,
  });

  /// Server id.
  final int? id;

  /// First name.
  final String name;

  /// Last name.
  final String surname;

  /// Profile image URL.
  final String? imageUrl;

  /// Biography (TR).
  final String? bioTr;

  /// Biography (EN).
  final String? bioEn;

  /// Whether the teacher is enabled.
  final bool enabled;

  /// Created at.
  final DateTime? createDate;

  /// Updated at.
  final DateTime? updateDate;

  /// Display name as `name surname` (trimmed parts only).
  String get fullName {
    final parts = [
      name.trim(),
      surname.trim(),
    ].where((part) => part.isNotEmpty);
    return parts.join(' ');
  }

  /// Localized bio for [locale] (`tr` / `en`).
  String bioForLocale(String locale) {
    final tr = bioTr?.trim() ?? '';
    final en = bioEn?.trim() ?? '';
    if (locale == 'tr') {
      return tr.isNotEmpty ? tr : en;
    }
    return en.isNotEmpty ? en : tr;
  }

  @override
  TeacherModel toModel() => TeacherModel(
        id: id,
        name: name,
        surname: surname,
        imageUrl: imageUrl,
        bioTr: bioTr,
        bioEn: bioEn,
        enabled: enabled,
        createDate: createDate,
        updateDate: updateDate,
      );
}
