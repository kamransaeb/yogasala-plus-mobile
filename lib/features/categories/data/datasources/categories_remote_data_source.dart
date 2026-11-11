import 'package:yogasala_plus_mobile/features/categories/data/models/category_model.dart';

/// Remote data source for categories.
abstract class CategoriesRemoteDataSource {
  /// Enabled categories.
  Future<List<CategoryModel>> getCategoriesEnabled();
}
