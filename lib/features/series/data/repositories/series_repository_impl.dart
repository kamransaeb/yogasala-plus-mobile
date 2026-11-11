import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/data/datasources/series_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie_page.dart';
import 'package:yogasala_plus_mobile/features/series/domain/repositories/series_repository.dart';

/// Implementation of [SeriesRepository].
@LazySingleton(as: SeriesRepository)
class SeriesRepositoryImpl implements SeriesRepository {
  /// Creates a [SeriesRepositoryImpl].
  SeriesRepositoryImpl(this._remote, this._errorHandler);

  final SeriesRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, SeriePage>> getSeriesByCategory({
    required int categoryId,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await _remote.getSeriesByCategory(
        categoryId: categoryId,
        page: page,
        size: size,
      );
      return Right(
        SeriePage(
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
          reason: 'getSeriesByCategory',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Serie>>> getSeriesByCategories(
    List<int> categoryIds,
  ) async {
    try {
      final models = await _remote.getSeriesByCategories(categoryIds);
      return Right(models.map((e) => e.toEntity()).toList());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getSeriesByCategories',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SeriePage>> getSeries({
    int page = 0,
    int size = 20,
    String? name,
  }) async {
    try {
      final response = await _remote.getSeries(
        page: page,
        size: size,
        name: name,
      );
      return Right(
        SeriePage(
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
          reason: 'getSeries',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Serie>> getSerieById(int id) async {
    try {
      final model = await _remote.getSerieById(id);
      return Right(model.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getSerieById',
        ),
      );
    }
  }
}
