import 'package:json_annotation/json_annotation.dart';
import 'package:yogasala_plus_mobile/features/points/data/models/user_points_leaderboard_entry_model.dart';

part 'user_points_leaderboard_page_response_model.g.dart';

/// Paginated leaderboard payload (`PageResponse<UserPointsLeaderboardDTO>`).
@JsonSerializable()
class UserPointsLeaderboardPageResponseModel {
  /// Creates a [UserPointsLeaderboardPageResponseModel].
  const UserPointsLeaderboardPageResponseModel({
    this.content = const [],
    this.page = 0,
    this.size = 0,
    this.totalElements = 0,
    this.totalPages = 0,
  });

  /// JSON constructor.
  factory UserPointsLeaderboardPageResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UserPointsLeaderboardPageResponseModelFromJson(json);

  /// To JSON.
  Map<String, dynamic> toJson() =>
      _$UserPointsLeaderboardPageResponseModelToJson(this);

  /// Page items.
  @JsonKey(defaultValue: <UserPointsLeaderboardEntryModel>[])
  final List<UserPointsLeaderboardEntryModel> content;

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
