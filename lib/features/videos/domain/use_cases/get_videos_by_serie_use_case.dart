import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/repositories/videos_repository.dart';

/// Loads playable videos for one series.
@injectable
class GetVideosBySerieUseCase
    extends BaseUseCase<List<Video>, GetVideosBySerieParams> {
  /// Creates a [GetVideosBySerieUseCase].
  GetVideosBySerieUseCase(this._repository);

  final VideosRepository _repository;

  @override
  Future<Either<Failure, List<Video>>> call(GetVideosBySerieParams params) {
    return _repository.getVideosBySerie(params.serieId);
  }
}

/// Params for [GetVideosBySerieUseCase].
class GetVideosBySerieParams extends Equatable {
  /// Creates params.
  const GetVideosBySerieParams({required this.serieId});

  /// Serie id.
  final int serieId;

  @override
  List<Object> get props => [serieId];
}
