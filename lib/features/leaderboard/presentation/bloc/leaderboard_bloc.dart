import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:enterprise_storage/enterprise_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/constants/di_constants.dart';
import 'package:yogasala_plus_mobile/core/constants/storage_constants.dart';
import 'package:yogasala_plus_mobile/features/points/domain/entities/user_points_leaderboard_entry.dart';
import 'package:yogasala_plus_mobile/features/points/domain/use_cases/get_leaderboard_use_case.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';
part 'leaderboard_bloc.freezed.dart';

/// Owns the leaderboard tab: paginated list and load-more.
@injectable
class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  /// Creates a [LeaderboardBloc].
  LeaderboardBloc(
    this._getLeaderboard,
    @Named(DiConstants.sharedPrefs) this._prefs,
  ) : super(const LeaderboardState.initial()) {
    on<_EventFetched>(
      _onFetched,
      transformer: restartable(),
    );
    on<_EventNextPageRequested>(
      _onNextPageRequested,
      transformer: droppable(),
    );
  }

  final GetLeaderboardUseCase _getLeaderboard;
  final LocalStorage _prefs;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<LeaderboardState> emit,
  ) async {
    await _loadPage(
      emit: emit,
      page: 0,
      append: false,
      showFullLoading: true,
    );
  }

  Future<void> _onNextPageRequested(
    _EventNextPageRequested event,
    Emitter<LeaderboardState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess || current.isLoadingMore || !current.hasMore) {
      return;
    }

    await _loadPage(
      emit: emit,
      page: current.pageOrZero + 1,
      append: true,
      showFullLoading: false,
    );
  }

  Future<(int?, int?, int?)> _readBadgeThresholds() async {
    final badgeLevelOne = await _prefs.read<int>(
      StorageConstants.badgeLevelOne,
    );
    final badgeLevelTwo = await _prefs.read<int>(
      StorageConstants.badgeLevelTwo,
    );
    final badgeLevelThree = await _prefs.read<int>(
      StorageConstants.badgeLevelThree,
    );
    return (badgeLevelOne, badgeLevelTwo, badgeLevelThree);
  }

  Future<void> _loadPage({
    required Emitter<LeaderboardState> emit,
    required int page,
    required bool append,
    required bool showFullLoading,
  }) async {
    final previousEntries = state.entriesOrEmpty;
    final previousBadgeOne = state.badgeLevelOneOrNull;
    final previousBadgeTwo = state.badgeLevelTwoOrNull;
    final previousBadgeThree = state.badgeLevelThreeOrNull;

    if (showFullLoading && !append) {
      emit(const LeaderboardState.loading());
    } else if (append && state.isSuccess) {
      emit(
        LeaderboardState.success(
          entries: previousEntries,
          page: state.pageOrZero,
          totalPages: state.totalPagesOrZero,
          isLoadingMore: true,
          badgeLevelOne: previousBadgeOne,
          badgeLevelTwo: previousBadgeTwo,
          badgeLevelThree: previousBadgeThree,
        ),
      );
    }

    final thresholdsFuture = append
        ? Future.value(
            (previousBadgeOne, previousBadgeTwo, previousBadgeThree),
          )
        : _readBadgeThresholds();

    final result = await _getLeaderboard(GetLeaderboardParams(page: page));
    final thresholds = await thresholdsFuture;

    if (emit.isDone) return;

    result.fold(
      (failure) {
        if (append && previousEntries.isNotEmpty) {
          emit(
            LeaderboardState.success(
              entries: previousEntries,
              page: state.pageOrZero,
              totalPages: state.totalPagesOrZero,
              actionFailure: failure,
              badgeLevelOne: previousBadgeOne,
              badgeLevelTwo: previousBadgeTwo,
              badgeLevelThree: previousBadgeThree,
            ),
          );
        } else {
          emit(LeaderboardState.failure(failure: failure));
        }
      },
      (leaderboardPage) {
        final entries = append
            ? [...previousEntries, ...leaderboardPage.content]
            : leaderboardPage.content;
        emit(
          LeaderboardState.success(
            entries: entries,
            page: leaderboardPage.page,
            totalPages: leaderboardPage.totalPages,
            badgeLevelOne: thresholds.$1,
            badgeLevelTwo: thresholds.$2,
            badgeLevelThree: thresholds.$3,
          ),
        );
      },
    );
  }
}
