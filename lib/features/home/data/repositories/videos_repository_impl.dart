import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/home/data/datasources/videos_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video_category.dart';
import 'package:yogasala_plus_mobile/features/home/domain/repositories/videos_repository.dart';

/// Implementation of [VideosRepository].
@LazySingleton(as: VideosRepository)
class VideosRepositoryImpl implements VideosRepository {
  /// Creates a [VideosRepositoryImpl].
  VideosRepositoryImpl(this._remote, this._errorHandler);

  final VideosRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, List<VideoCategory>>>
  getVideosCategoryListEnabled() async {
    try {
      final models = await _remote.getVideosCategoryListEnabled();
      return Right(models.map((e) => e.toEntity()).toList());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getVideosCategoryListEnabled',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Video>>> getVideosListEnabledByCategoryIds(
    List<int> videosCategoryIdList,
  ) async {
    try {
      final models = await _remote.getVideosListEnabledByCategoryIds(
        videosCategoryIdList,
      );
      return Right(models.map((e) => e.toEntity()).toList());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getVideosListEnabledByCategoryIds',
        ),
      );
    }
  }
}
