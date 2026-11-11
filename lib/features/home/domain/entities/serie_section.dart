import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';

/// A series with its playable videos (detail / playback context).
class SerieSection {
  /// Creates a [SerieSection].
  const SerieSection({
    required this.series,
    required this.videos,
  });

  /// Serie header.
  final Serie series;

  /// Videos in series order.
  final List<Video> videos;
}
