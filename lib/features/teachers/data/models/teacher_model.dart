import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/core/utils/model_to_entity_mapper.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';

part 'teacher_model.g.dart';

/// Serializable teacher payload from the mobile user API (TeacherDTO).
@JsonSerializable()
class TeacherModel implements ModelToEntityMapper<Teacher> {
  /// Creates a [TeacherModel].
  const TeacherModel({
    this.id,
    this.name = '',
    this.surname = '',
    this.imageUrl,
    this.bioTr,
    this.bioEn,
    this.enabled = false,
    this.createDate,
    this.updateDate,
  });

  /// JSON constructor.
  factory TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$TeacherModelToJson(this);

  /// Server id.
  final int? id;

  /// First name.
  @JsonKey(defaultValue: '')
  final String name;

  /// Last name.
  @JsonKey(defaultValue: '')
  final String surname;

  /// Profile image URL.
  final String? imageUrl;

  /// Biography (TR).
  final String? bioTr;

  /// Biography (EN).
  final String? bioEn;

  /// Whether the teacher is enabled.
  @JsonKey(defaultValue: false)
  final bool enabled;

  /// Created at.
  final DateTime? createDate;

  /// Updated at.
  final DateTime? updateDate;

  @override
  Teacher toEntity() => Teacher(
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
