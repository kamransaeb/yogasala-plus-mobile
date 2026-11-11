import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yogasala_plus_mobile/features/categories/domain/entities/category.dart';

/// Repository for categories.
abstract class CategoriesRepository {
  /// Enabled categories.
  Future<Either<Failure, List<Category>>> getCategoriesEnabled();
}
