import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/features/videos/data/models/video_model.dart';

part 'video_page_response_model.g.dart';

/// Paginated video list payload (`PageResponse<VideoDTO>`).
@JsonSerializable()
class VideoPageResponseModel {
  /// Creates a [VideoPageResponseModel].
  const VideoPageResponseModel({
    this.content = const [],
    this.page = 0,
    this.size = 0,
    this.totalElements = 0,
    this.totalPages = 0,
  });

  /// JSON constructor.
  factory VideoPageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VideoPageResponseModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() => _$VideoPageResponseModelToJson(this);

  /// Page items.
  @JsonKey(defaultValue: <VideoModel>[])
  final List<VideoModel> content;

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
