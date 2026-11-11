import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/categories/domain/entities/category.dart';
import 'package:yogasala_plus_mobile/features/categories/domain/use_cases/get_categories_list_enabled_use_case.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/category_section.dart';
import 'package:yogasala_plus_mobile/features/series/domain/use_cases/get_series_by_category_use_case.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher_page.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/use_cases/get_teachers_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

/// Owns the authenticated home feed:
/// vertical categories → each row is a horizontal paginated series list.
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// Creates a [HomeBloc].
  HomeBloc(
    this._getCategoryListEnabled,
    this._getSeriesByCategory,
    this._getTeachers,
  ) : super(const HomeState.initial()) {
    on<_EventFetched>(
      _onFetched,
      transformer: restartable(),
    );
    on<_EventCategorySeriesNextPageRequested>(
      _onCategorySeriesNextPageRequested,
      transformer: droppable(),
    );
  }

  /// Large enough first page for series teacher-label lookups on categories.
  static const _teachersLookupPageSize = 100;

  final GetCategoriesListEnabledUseCase _getCategoryListEnabled;
  final GetSeriesByCategoryUseCase _getSeriesByCategory;
  final GetTeachersUseCase _getTeachers;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());

    final settled = await Future.wait([
      _getCategoryListEnabled(const NoParams()),
      _getTeachers(
        const GetTeachersParams(size: _teachersLookupPageSize),
      ),
    ]);

    final categoriesResult = settled[0] as Either<Failure, List<Category>>;
    final teachersResult = settled[1] as Either<Failure, TeacherPage>;

    final categoriesFailure = categoriesResult.fold((f) => f, (_) => null);
    if (categoriesFailure != null) {
      emit(HomeState.failure(failure: categoriesFailure));
      return;
    }

    final teachersFailure = teachersResult.fold((f) => f, (_) => null);
    if (teachersFailure != null) {
      emit(HomeState.failure(failure: teachersFailure));
      return;
    }

    final categories = categoriesResult.getOrElse(() => const <Category>[]);
    final teachersById = <int, Teacher>{
      for (final teacher in teachersResult
          .getOrElse(() => throw StateError('teacherPage'))
          .content)
        if (teacher.id != null) teacher.id!: teacher,
    };

    final withIds = categories.where((c) => c.id != null).toList();
    if (withIds.isEmpty) {
      emit(HomeState.success(teachersById: teachersById));
      return;
    }

    // One paginated request per category, in parallel.
    final settledCategorySeries = await Future.wait(
      withIds.map(
        (category) => _getSeriesByCategory(
          GetSeriesByCategoryParams(categoryId: category.id!),
        ),
      ),
    );

    if (emit.isDone) return;

    final categorySections = <CategorySection>[];
    for (var i = 0; i < withIds.length; i++) {
      final seriesResult = settledCategorySeries[i];
      final failureOrNull = seriesResult.fold((f) => f, (_) => null);
      if (failureOrNull != null) {
        emit(HomeState.failure(failure: failureOrNull));
        return;
      }

      final seriePage = seriesResult.getOrElse(
        () => throw StateError('seriePage'),
      );
      if (seriePage.content.isEmpty) continue;

      categorySections.add(
        CategorySection(
          category: withIds[i],
          series: seriePage.content,
          page: seriePage.page,
          totalPages: seriePage.totalPages,
        ),
      );
    }

    emit(
      HomeState.success(
        categorySections: categorySections,
        teachersById: teachersById,
      ),
    );
  }

  Future<void> _onCategorySeriesNextPageRequested(
    _EventCategorySeriesNextPageRequested event,
    Emitter<HomeState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess) return;

    final sections = List<CategorySection>.of(current.categorySectionsOrEmpty);
    final index = sections.indexWhere(
      (s) => s.category.id == event.categoryId,
    );
    if (index < 0) return;

    final section = sections[index];
    if (section.isLoadingMore || !section.hasMore) return;

    sections[index] = section.copyWith(isLoadingMore: true);
    emit(
      HomeState.success(
        categorySections: sections,
        teachersById: current.teachersByIdOrEmpty,
      ),
    );

    final result = await _getSeriesByCategory(
      GetSeriesByCategoryParams(
        categoryId: event.categoryId,
        page: section.page + 1,
      ),
    );

    if (emit.isDone) return;

    final latest = state;
    if (!latest.isSuccess) return;

    final latestSections =
        List<CategorySection>.of(latest.categorySectionsOrEmpty);
    final latestIndex = latestSections.indexWhere(
      (s) => s.category.id == event.categoryId,
    );
    if (latestIndex < 0) return;

    result.fold(
      (failure) {
        latestSections[latestIndex] = latestSections[latestIndex].copyWith(
          isLoadingMore: false,
        );
        emit(
          HomeState.success(
            categorySections: latestSections,
            teachersById: latest.teachersByIdOrEmpty,
            actionFailure: failure,
          ),
        );
      },
      (seriePage) {
        final previous = latestSections[latestIndex];
        latestSections[latestIndex] = previous.copyWith(
          series: [...previous.series, ...seriePage.content],
          page: seriePage.page,
          totalPages: seriePage.totalPages,
          isLoadingMore: false,
        );
        emit(
          HomeState.success(
            categorySections: latestSections,
            teachersById: latest.teachersByIdOrEmpty,
          ),
        );
      },
    );
  }
}
