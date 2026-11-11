import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video_page.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/repositories/videos_repository.dart';

/// Loads a page of the current user's favorite videos.
@injectable
class GetFavoriteVideosUseCase
    extends BaseUseCase<VideoPage, GetFavoriteVideosParams> {
  /// Creates a [GetFavoriteVideosUseCase].
  GetFavoriteVideosUseCase(this._repository);

  final VideosRepository _repository;

  @override
  Future<Either<Failure, VideoPage>> call(GetFavoriteVideosParams params) {
    return _repository.getFavoriteVideos(
      page: params.page,
      size: params.size,
    );
  }
}

/// Params for [GetFavoriteVideosUseCase].
class GetFavoriteVideosParams extends Equatable {
  /// Creates params.
  const GetFavoriteVideosParams({
    this.page = 0,
    this.size = 20,
  });

  /// Zero-based page index.
  final int page;

  /// Page size.
  final int size;

  @override
  List<Object> get props => [page, size];
}
