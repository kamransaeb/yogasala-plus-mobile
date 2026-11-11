import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/repositories/videos_repository.dart';

/// Loads a video with [Video.favorited] for the current user.
@injectable
class GetVideoFavoriteUseCase
    extends BaseUseCase<Video, GetVideoFavoriteParams> {
  /// Creates a [GetVideoFavoriteUseCase].
  GetVideoFavoriteUseCase(this._repository);

  final VideosRepository _repository;

  @override
  Future<Either<Failure, Video>> call(GetVideoFavoriteParams params) {
    return _repository.getVideoFavorite(params.id);
  }
}

/// Params for [GetVideoFavoriteUseCase].
class GetVideoFavoriteParams extends Equatable {
  /// Creates params.
  const GetVideoFavoriteParams({required this.id});

  /// Video id.
  final int id;

  @override
  List<Object> get props => [id];
}
