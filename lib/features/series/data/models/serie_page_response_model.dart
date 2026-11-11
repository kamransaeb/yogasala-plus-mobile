import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/features/series/data/models/serie_model.dart';

part 'serie_page_response_model.g.dart';

/// Paginated series list payload (`PageResponse<SerieDTO>`).
@JsonSerializable()
class SeriePageResponseModel {
  /// Creates a [SeriePageResponseModel].
  const SeriePageResponseModel({
    this.content = const [],
    this.page = 0,
    this.size = 0,
    this.totalElements = 0,
    this.totalPages = 0,
  });

  /// JSON constructor.
  factory SeriePageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SeriePageResponseModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$SeriePageResponseModelToJson(this);

  /// Page items.
  @JsonKey(defaultValue: <SerieModel>[])
  final List<SerieModel> content;

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
