import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/points/domain/use_cases/get_user_points_use_case.dart';

part 'points_event.dart';
part 'points_state.dart';
part 'points_bloc.freezed.dart';

/// Loads and holds the current user's points balance.
///
/// Shared app-wide so features (video activity, quiz, profile) refresh one
/// balance instead of stale per-page instances.
@lazySingleton
class PointsBloc extends Bloc<PointsEvent, PointsState> {
  /// Creates a [PointsBloc].
  PointsBloc(this._getUserPoints) : super(const PointsState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
  }

  final GetUserPointsUseCase _getUserPoints;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<PointsState> emit,
  ) async {
    final previousBalance = state.balanceOrNull;
    // Soft refresh when we already have a balance (avoid profile flash).
    if (previousBalance == null) {
      emit(const PointsState.loading());
    }

    final result = await _getUserPoints(const NoParams());

    if (emit.isDone) return;

    result.fold(
      (failure) {
        if (previousBalance != null) {
          emit(PointsState.success(balance: previousBalance));
        } else {
          emit(PointsState.failure(failure: failure));
        }
      },
      (balance) => emit(PointsState.success(balance: balance.balance)),
    );
  }
}
