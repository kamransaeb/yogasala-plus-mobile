import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/models/teacher_model.dart';

part 'teacher_page_response_model.g.dart';

/// Paginated teachers list payload (`PageResponse<TeacherDTO>`).
@JsonSerializable()
class TeacherPageResponseModel {
  /// Creates a [TeacherPageResponseModel].
  const TeacherPageResponseModel({
    this.content = const [],
    this.page = 0,
    this.size = 0,
    this.totalElements = 0,
    this.totalPages = 0,
  });

  /// JSON constructor.
  factory TeacherPageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherPageResponseModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$TeacherPageResponseModelToJson(this);

  /// Page items.
  @JsonKey(defaultValue: <TeacherModel>[])
  final List<TeacherModel> content;

  /// Zero-based page index.
  @JsonKey(defaultValue: 0)
  final int page;

  /// Page size.
  @JsonKey(defaultValue: 0)
  final int size;

  /// Total item count.
  @JsonKey(defaultValue: 0)
  final int totalElements;

  /// Total page count.
  @JsonKey(defaultValue: 0)
  final int totalPages;
}
