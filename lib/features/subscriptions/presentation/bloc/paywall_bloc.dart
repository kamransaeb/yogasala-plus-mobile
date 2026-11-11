import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_plan.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/entities/subscription_package.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/use_cases/get_subscription_packages_use_case.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/use_cases/purchase_subscription_use_case.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/use_cases/restore_purchases_use_case.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/bloc/entitlements_bloc.dart';

part 'paywall_event.dart';
part 'paywall_state.dart';
part 'paywall_bloc.freezed.dart';

/// Owns paywall offerings, purchase, and restore.
@injectable
class PaywallBloc extends Bloc<PaywallEvent, PaywallState> {
  /// Creates a [PaywallBloc].
  PaywallBloc(
    this._getPackages,
    this._purchaseSubscription,
    this._restorePurchases,
    this._entitlementsBloc,
  ) : super(const PaywallState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
    on<_EventPurchaseRequested>(
      _onPurchaseRequested,
      transformer: droppable(),
    );
    on<_EventRestoreRequested>(
      _onRestoreRequested,
      transformer: droppable(),
    );
  }

  final GetSubscriptionPackagesUseCase _getPackages;
  final PurchaseSubscriptionUseCase _purchaseSubscription;
  final RestorePurchasesUseCase _restorePurchases;
  final EntitlementsBloc _entitlementsBloc;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<PaywallState> emit,
  ) async {
    emit(const PaywallState.loading());

    final result = await _getPackages(const NoParams());

    if (emit.isDone) return;

    result.fold(
      (failure) => emit(PaywallState.failure(failure: failure)),
      (packages) => emit(
        PaywallState.success(
          packages: packages,
          highlightPlan: event.highlightPlan,
        ),
      ),
    );
  }

  Future<void> _onPurchaseRequested(
    _EventPurchaseRequested event,
    Emitter<PaywallState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess || current.isPurchasing || current.isRestoring) {
      return;
    }

    emit(
      PaywallState.success(
        packages: current.packagesOrEmpty,
        highlightPlan: current.highlightPlanOrNull,
        isPurchasing: true,
      ),
    );

    final result = await _purchaseSubscription(
      PurchaseSubscriptionParams(packageId: event.packageId),
    );

    if (emit.isDone) return;

    await result.fold(
      (failure) async {
        emit(
          PaywallState.success(
            packages: current.packagesOrEmpty,
            highlightPlan: current.highlightPlanOrNull,
            actionFailure: failure,
          ),
        );
      },
      (_) async {
        await _refreshEntitlementsWithRetry();
        emit(
          PaywallState.success(
            packages: current.packagesOrEmpty,
            highlightPlan: current.highlightPlanOrNull,
            purchaseCompleted: true,
          ),
        );
      },
    );
  }

  Future<void> _onRestoreRequested(
    _EventRestoreRequested event,
    Emitter<PaywallState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess || current.isPurchasing || current.isRestoring) {
      return;
    }

    emit(
      PaywallState.success(
        packages: current.packagesOrEmpty,
        highlightPlan: current.highlightPlanOrNull,
        isRestoring: true,
      ),
    );

    final result = await _restorePurchases(const NoParams());

    if (emit.isDone) return;

    await result.fold(
      (failure) async {
        emit(
          PaywallState.success(
            packages: current.packagesOrEmpty,
            highlightPlan: current.highlightPlanOrNull,
            actionFailure: failure,
          ),
        );
      },
      (_) async {
        await _refreshEntitlementsWithRetry();
        emit(
          PaywallState.success(
            packages: current.packagesOrEmpty,
            highlightPlan: current.highlightPlanOrNull,
            restoreCompleted: true,
          ),
        );
      },
    );
  }

  /// Webhook may lag briefly after store purchase / restore.
  Future<void> _refreshEntitlementsWithRetry() async {
    for (var attempt = 0; attempt < 3; attempt++) {
      _entitlementsBloc.add(const EntitlementsEvent.fetched());
      await _entitlementsBloc.stream.firstWhere(
        (s) => !s.isLoading,
      );
      if (_entitlementsBloc.state.hasVideo ||
          _entitlementsBloc.state.hasLive) {
        return;
      }
      await Future<void>.delayed(Duration(milliseconds: 400 * (attempt + 1)));
    }
  }
}
