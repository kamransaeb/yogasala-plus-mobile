import 'package:yogasala_plus_mobile/features/home/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video_category.dart';

/// A home feed row: one category and its videos.
class VideoCategorySection {
  /// Creates a [VideoCategorySection].
  const VideoCategorySection({
    required this.category,
    required this.videos,
  });

  /// Category header.
  final VideoCategory category;

  /// Videos in this category (display order).
  final List<Video> videos;
}
