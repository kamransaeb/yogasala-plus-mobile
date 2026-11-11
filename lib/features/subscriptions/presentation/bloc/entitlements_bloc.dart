import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/entities/user_entitlements.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/use_cases/get_user_entitlements_use_case.dart';

part 'entitlements_event.dart';
part 'entitlements_state.dart';
part 'entitlements_bloc.freezed.dart';

/// Shared entitlements cache refreshed after login / purchase / restore.
@lazySingleton
class EntitlementsBloc extends Bloc<EntitlementsEvent, EntitlementsState> {
  /// Creates an [EntitlementsBloc].
  EntitlementsBloc(this._getUserEntitlements)
      : super(const EntitlementsState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
    on<_EventCleared>(_onCleared);
  }

  final GetUserEntitlementsUseCase _getUserEntitlements;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<EntitlementsState> emit,
  ) async {
    final previous = state.entitlementsOrNull;
    if (previous == null) {
      emit(const EntitlementsState.loading());
    }

    final result = await _getUserEntitlements(const NoParams());

    if (emit.isDone) return;

    result.fold(
      (failure) {
        if (previous != null) {
          emit(EntitlementsState.success(entitlements: previous));
        } else {
          emit(EntitlementsState.failure(failure: failure));
        }
      },
      (entitlements) =>
          emit(EntitlementsState.success(entitlements: entitlements)),
    );
  }

  void _onCleared(
    _EventCleared event,
    Emitter<EntitlementsState> emit,
  ) {
    emit(const EntitlementsState.initial());
  }
}
