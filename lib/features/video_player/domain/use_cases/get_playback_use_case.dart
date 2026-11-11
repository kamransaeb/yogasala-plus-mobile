import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/video_player/domain/entities/playback.dart';
import 'package:yogasala_plus_mobile/features/video_player/domain/repositories/playback_repository.dart';

/// Loads signed Mux playback for a video.
@injectable
class GetPlaybackUseCase extends BaseUseCase<Playback, GetPlaybackParams> {
  /// Creates a [GetPlaybackUseCase].
  GetPlaybackUseCase(this._repository);

  final PlaybackRepository _repository;

  @override
  Future<Either<Failure, Playback>> call(GetPlaybackParams params) {
    return _repository.getPlayback(
      videoId: params.videoId,
      serieId: params.serieId,
    );
  }
}

/// Params for [GetPlaybackUseCase].
class GetPlaybackParams extends Equatable {
  /// Creates params.
  const GetPlaybackParams({
    required this.videoId,
    this.serieId,
  });

  /// Video id.
  final int videoId;

  /// Optional series context for access checks.
  final int? serieId;

  @override
  List<Object?> get props => [videoId, serieId];
}
