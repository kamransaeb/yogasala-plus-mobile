import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/categories/data/datasources/categories_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/categories/domain/entities/category.dart';
import 'package:yogasala_plus_mobile/features/categories/domain/repositories/categories_repository.dart';

/// Implementation of [CategoriesRepository].
@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  /// Creates a [CategoriesRepositoryImpl].
  CategoriesRepositoryImpl(this._remote, this._errorHandler);

  final CategoriesRemoteDataSource _remote;
  final ErrorHandler _errorHandler;

  @override
  Future<Either<Failure, List<Category>>> getCategoriesEnabled() async {
    try {
      final models = await _remote.getCategoriesEnabled();
      return Right(models.map((e) => e.toEntity()).toList());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getCategoriesEnabled',
        ),
      );
    }
  }
}
