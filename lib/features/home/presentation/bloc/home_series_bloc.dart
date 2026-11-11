import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/series/domain/use_cases/get_series_use_case.dart';

part 'home_series_event.dart';
part 'home_series_state.dart';
part 'home_series_bloc.freezed.dart';

EventTransformer<E> _debounceRestartable<E>(Duration duration) {
  // debounce(500ms) -> After each keystroke wait 500ms, only the last query is
  // kept.
  // switchMap(mapper) -> When a new event arrives, the previous event is
  // cancelled.
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

/// Owns the home series tab: paginated list, search, and load-more.
@injectable
class HomeSeriesBloc extends Bloc<HomeSeriesEvent, HomeSeriesState> {
  /// Creates a [HomeSeriesBloc].
  HomeSeriesBloc(this._getSeries) : super(const HomeSeriesState.initial()) {
    on<_EventFetched>(
      _onFetched,
      // Only the latest fetched runs. A new fetched cancels an in-flight one.
      // Useful for refresh so you don’t finish an old load after a newer one
      transformer: restartable(),
    );
    on<_EventQueryChanged>(
      _onQueryChanged,
      // debounce the events and only the latest event is processed
      transformer: _debounceRestartable(const Duration(milliseconds: 500)),
    );
    on<_EventNextPageRequested>(
      _onNextPageRequested,
      // drop the events if the previous event is not processed
      transformer: droppable(),
    );
  }

  final GetSeriesUseCase _getSeries;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<HomeSeriesState> emit,
  ) async {
    await _loadPage(
      emit: emit,
      page: 0,
      query: state.queryOrEmpty,
      append: false,
      showFullLoading: true,
    );
  }

  Future<void> _onQueryChanged(
    _EventQueryChanged event,
    Emitter<HomeSeriesState> emit,
  ) async {
    final query = event.query;
    final previous = state;
    final showFullLoading =
        !previous.isSuccess || previous.seriesOrEmpty.isEmpty;

    if (previous.isSuccess && !showFullLoading) {
      emit(
        HomeSeriesState.success(
          series: previous.seriesOrEmpty,
          query: query,
          page: previous.pageOrZero,
          totalPages: previous.totalPagesOrZero,
        ),
      );
    }

    await _loadPage(
      emit: emit,
      page: 0,
      query: query,
      append: false,
      showFullLoading: showFullLoading,
    );
  }

  Future<void> _onNextPageRequested(
    _EventNextPageRequested event,
    Emitter<HomeSeriesState> emit,
  ) async {
    final current = state;
    // current.hasMore is true if the current page is not the last page
    // !current.hasMore Already on the last page (page + 1 >= totalPages).
    // Nothing left to fetch.
    if (!current.isSuccess || current.isLoadingMore || !current.hasMore) {
      return;
    }

    await _loadPage(
      emit: emit,
      page: current.pageOrZero + 1,
      query: current.queryOrEmpty,
      append: true,
      showFullLoading: false,
    );
  }

  Future<void> _loadPage({
    required Emitter<HomeSeriesState> emit,
    required int page,
    required String query,
    required bool append,
    required bool showFullLoading,
  }) async {
    final trimmedQuery = query.trim();
    final name = trimmedQuery.isEmpty ? null : trimmedQuery;
    final previousSeries = state.seriesOrEmpty;

    if (showFullLoading && !append) {
      emit(const HomeSeriesState.loading());
    } else if (append && state.isSuccess) {
      emit(
        HomeSeriesState.success(
          series: previousSeries,
          query: query,
          page: state.pageOrZero,
          totalPages: state.totalPagesOrZero,
          isLoadingMore: true,
        ),
      );
    }

    final result = await _getSeries(
      GetSeriesParams(page: page, name: name),
    );

    if (emit.isDone) return;

    result.fold(
      (failure) {
        if (append && previousSeries.isNotEmpty) {
          emit(
            HomeSeriesState.success(
              series: previousSeries,
              query: query,
              page: state.pageOrZero,
              totalPages: state.totalPagesOrZero,
              actionFailure: failure,
              // Freezed then uses the default -> isLoadingMore is false
              //isLoadingMore:
            ),
          );
        } else {
          emit(HomeSeriesState.failure(failure: failure));
        }
      },
      (seriePage) {
        final series = append
            ? [...previousSeries, ...seriePage.content]
            : seriePage.content;
        emit(
          HomeSeriesState.success(
            series: series,
            query: query,
            page: seriePage.page,
            totalPages: seriePage.totalPages,
          ),
        );
      },
    );
  }
}
