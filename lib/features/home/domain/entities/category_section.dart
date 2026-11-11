import 'package:yogasala_plus_mobile/features/categories/domain/entities/category.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';

/// A home feed row: one category and its paginated playable series.
class CategorySection {
  /// Creates a [CategorySection].
  const CategorySection({
    required this.category,
    required this.series,
    this.page = 0,
    this.totalPages = 0,
    this.isLoadingMore = false,
  });

  /// Category header.
  final Category category;

  /// Serie in this category (display order).
  final List<Serie> series;

  /// Zero-based page index of the last loaded page.
  final int page;

  /// Total page count for this category.
  final int totalPages;

  /// Whether the next page is being fetched.
  final bool isLoadingMore;

  /// Whether another page can be loaded.
  bool get hasMore => page + 1 < totalPages;

  /// Copy with optional overrides.
  CategorySection copyWith({
    Category? category,
    List<Serie>? series,
    int? page,
    int? totalPages,
    bool? isLoadingMore,
  }) {
    return CategorySection(
      category: category ?? this.category,
      series: series ?? this.series,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
