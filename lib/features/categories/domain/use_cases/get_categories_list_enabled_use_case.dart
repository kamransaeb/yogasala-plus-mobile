import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/categories/domain/entities/category.dart';
import 'package:yogasala_plus_mobile/features/categories/domain/repositories/categories_repository.dart';

/// Loads enabled categories for the home feed.
@injectable
class GetCategoriesListEnabledUseCase
    extends BaseUseCase<List<Category>, NoParams> {
  /// Creates a [GetCategoriesListEnabledUseCase].
  GetCategoriesListEnabledUseCase(this._repository);

  final CategoriesRepository _repository;

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) {
    return _repository.getCategoriesEnabled();
  }
}
