import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/features/quiz/data/models/video_quiz_attempt_summary_model.dart';

part 'video_quiz_attempt_page_response_model.g.dart';

/// Paginated quiz attempts (`PageResponse<VideoQuizAttemptSummary>`).
@JsonSerializable()
class VideoQuizAttemptPageResponseModel {
  /// Creates a [VideoQuizAttemptPageResponseModel].
  const VideoQuizAttemptPageResponseModel({
    this.content = const [],
    this.page = 0,
    this.size = 0,
    this.totalElements = 0,
    this.totalPages = 0,
  });

  /// JSON constructor.
  factory VideoQuizAttemptPageResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$VideoQuizAttemptPageResponseModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() =>
      _$VideoQuizAttemptPageResponseModelToJson(this);

  /// Page items.
  @JsonKey(defaultValue: <VideoQuizAttemptSummaryModel>[])
  final List<VideoQuizAttemptSummaryModel> content;

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
