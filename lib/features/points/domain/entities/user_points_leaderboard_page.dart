import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_leaderboard_entry.dart';

/// One page of the points leaderboard.
class UserPointsLeaderboardPage {
  /// Creates a [UserPointsLeaderboardPage].
  const UserPointsLeaderboardPage({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
  });

  /// Entries on this page.
  final List<UserPointsLeaderboardEntry> content;

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  /// Total entry count across all pages.
  final int totalElements;

  /// Total page count.
  final int totalPages;

  /// Whether another page can be requested.
  bool get hasMore => page + 1 < totalPages;
}
