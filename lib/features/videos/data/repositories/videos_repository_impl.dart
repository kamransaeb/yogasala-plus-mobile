import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/videos/data/datasources/videos_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video_page.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/repositories/videos_repository.dart';

/// Implementation of [VideosRepository].
@LazySingleton(as: VideosRepository)
class VideosRepositoryImpl implements VideosRepository {
  /// Creates a [VideosRepositoryImpl].
  VideosRepositoryImpl(this._remote, this._errorHandler);

  final VideosRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, List<Video>>> getVideosBySerie(int serieId) async {
    try {
      final models = await _remote.getVideosBySerie(serieId);
      return Right(models.map((e) => e.toEntity()).toList());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getVideosBySerie',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Video>>> getVideosByCategory(
    int categoryId,
  ) async {
    try {
      final models = await _remote.getVideosByCategory(categoryId);
      return Right(models.map((e) => e.toEntity()).toList());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getVideosByCategory',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Video>>> getVideosByCategories(
    List<int> categoryIds,
  ) async {
    try {
      final models = await _remote.getVideosByCategories(categoryIds);
      return Right(models.map((e) => e.toEntity()).toList());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getVideosByCategories',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Video>> getVideoFavorite(int id) async {
    try {
      final model = await _remote.getVideoFavorite(id);
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getVideoFavorite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addVideoFavorite(int id) async {
    try {
      await _remote.addVideoFavorite(id);
      return const Right(null);
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'addVideoFavorite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeVideoFavorite(int id) async {
    try {
      await _remote.removeVideoFavorite(id);
      return const Right(null);
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'removeVideoFavorite',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, VideoPage>> getFavoriteVideos({
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await _remote.getFavoriteVideos(page: page, size: size);
      return Right(
        VideoPage(
          content: response.content.map((e) => e.toEntity()).toList(),
          page: response.page,
          size: response.size,
          totalElements: response.totalElements,
          totalPages: response.totalPages,
        ),
      );
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getFavoriteVideos',
        ),
      );
    }
  }
}
