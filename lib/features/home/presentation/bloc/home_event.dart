part of 'home_bloc.dart';

/// Events for [HomeBloc].
@freezed
abstract class HomeEvent with _$HomeEvent {
  const HomeEvent._();

  /// Load categories, teachers, and first page of series per category.
  const factory HomeEvent.fetched() = _EventFetched;

  /// Load the next series page for [categoryId]'s horizontal row.
  const factory HomeEvent.categorySeriesNextPageRequested({
    required int categoryId,
  }) = _EventCategorySeriesNextPageRequested;
}
