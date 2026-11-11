import 'dart:io';

import 'package:enterprise_core/enterprise_core.dart';
import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:enterprise_storage/enterprise_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yogasala_plus_mobile/core/constants/di_constants.dart';
import 'package:yogasala_plus_mobile/core/constants/storage_constants.dart';
import 'package:yogasala_plus_mobile/core/utils/app_version_comparator.dart';
import 'package:yogasala_plus_mobile/features/app/domain/entities/app_data.dart';
import 'package:yogasala_plus_mobile/features/app/domain/use_cases/get_app_data_use_case.dart';
import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/use_cases/get_or_create_user_yoga_sala_plus_use_case.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/use_cases/sync_user_time_zone_use_case.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/domain/use_cases/log_in_purchases_use_case.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/bloc/entitlements_bloc.dart';

part 'app_director_bloc.freezed.dart';
part 'app_director_event.dart';
part 'app_director_state.dart';

/// Owns bootstrap: AppData / force-update, auth, open-mobile profile.
@Injectable()
class AppDirectorBloc extends Bloc<AppDirectorEvent, AppDirectorState> {
  /// Creates an [AppDirectorBloc].
  AppDirectorBloc(
    this._logger,
    this._authBloc,
    this._getAppDataUseCase,
    this._getOrCreateUserYogaSalaPlusUseCase,
    this._syncUserTimeZoneUseCase,
    this._logInPurchasesUseCase,
    this._entitlementsBloc,
    @Named(DiConstants.sharedPrefs) this._prefs,
  ) : super(const AppDirectorState.initial()) {
    on<_EventLoaded>(_onLoaded);
    on<_EventFirstLaunchDisabled>(_onFirstLaunchDisabled);
  }

  final LoggerService _logger;
  final AuthBloc _authBloc;
  final GetAppDataUseCase _getAppDataUseCase;
  final GetOrCreateUserYogaSalaPlusUseCase _getOrCreateUserYogaSalaPlusUseCase;
  final SyncUserTimeZoneUseCase _syncUserTimeZoneUseCase;
  final LogInPurchasesUseCase _logInPurchasesUseCase;
  final EntitlementsBloc _entitlementsBloc;
  final LocalStorage _prefs;

  Future<void> _onLoaded(
    _EventLoaded event,
    Emitter<AppDirectorState> emit,
  ) async {
    _logger.i('AppDirectorBloc _onLoaded');
    _logger.i('state.isLoading: $state');
    // Ignore while in-flight or already decided (page rebuilds / remounts).
    if (state.isLoading || state.isUpdateRequired || state.isSuccess) return;

    emit(
      AppDirectorState.loading(
        isFirstLaunch: state.isFirstLaunch,
        isAppUpdate: state.isAppUpdate,
        storeUrlEn: state.storeUrlEn,
        storeUrlTr: state.storeUrlTr,
      ),
    );

    final appDataResult = await _loadAppData(emit);
    if (appDataResult == null) return;

    final (isFirstLaunch, appData, isAppUpdateOk) = appDataResult;
    if (!isAppUpdateOk) {
      emit(
        AppDirectorState.updateRequired(
          isFirstLaunch: isFirstLaunch,
          storeUrlEn: appData.storeUrlEn,
          storeUrlTr: appData.storeUrlTr,
        ),
      );
      return;
    }

    _logger.d('Checking auth status');
    _authBloc.add(const AuthEvent.checkStatusRequested());
    final authState = await _authBloc.stream.firstWhere(
      (s) => !s.isChecking && s.hasAuthDecision,
    );
    _logger.d('Auth status: ${authState.isAuthenticated}');
    if (!authState.isAuthenticated) {
      _logger.d('Open-mobile skipped: user is not authenticated');
      emit(
        AppDirectorState.failure(
          failure: const UnauthorizedAccessFailure(
            message: 'user_not_authenticated',
          ),
          isFirstLaunch: isFirstLaunch,
          storeUrlEn: appData.storeUrlEn,
          storeUrlTr: appData.storeUrlTr,
        ),
      );
      return;
    }

    _logger.d('Getting or creating user yoga sala plus open mobile');
    final result = await _getOrCreateUserYogaSalaPlusUseCase(
      const NoParams(),
    );
    await result.fold<Future<void>>(
      (failure) async {
        emit(
          AppDirectorState.failure(
            failure: failure,
            isFirstLaunch: isFirstLaunch,
            storeUrlEn: appData.storeUrlEn,
            storeUrlTr: appData.storeUrlTr,
          ),
        );
        _logger.d(
          'Getting or creating user yoga sala plus open mobile failed',
        );
      },
      (userYogaSalaPlus) async {
        if (userYogaSalaPlus.forceLogout) {
          _authBloc.add(const AuthEvent.logoutRequested());
          emit(
            AppDirectorState.failure(
              failure: const UnauthorizedAccessFailure(
                message: 'user_not_authenticated',
              ),
              isFirstLaunch: isFirstLaunch,
              storeUrlEn: appData.storeUrlEn,
              storeUrlTr: appData.storeUrlTr,
            ),
          );
          return;
        }

        final syncedUser = await _syncUserTimeZoneSilently(userYogaSalaPlus);
        await _syncPurchasesAndEntitlements(authState);
        emit(
          AppDirectorState.success(
            userYogaSalaPlus: syncedUser,
            isFirstLaunch: isFirstLaunch,
            storeUrlEn: appData.storeUrlEn,
            storeUrlTr: appData.storeUrlTr,
          ),
        );
        _logger.d(
          'Getting or creating user yoga sala plus open mobile success',
        );
      },
    );
  }

  /// Identifies RevenueCat with Firebase uid and refreshes backend entitlements.
  Future<void> _syncPurchasesAndEntitlements(AuthState authState) async {
    final uid = authState.user?.id;
    if (uid == null || uid.isEmpty) return;

    final loginResult = await _logInPurchasesUseCase(
      LogInPurchasesParams(appUserId: uid),
    );
    loginResult.fold(
      (failure) => _logger.w(
        'RevenueCat logIn failed: ${failure.message}',
      ),
      (_) {},
    );

    _entitlementsBloc.add(const EntitlementsEvent.fetched());
  }

  /// Syncs OS IANA zone to the profile; failures are ignored (non-blocking).
  Future<UserYogaSalaPlus> _syncUserTimeZoneSilently(
    UserYogaSalaPlus user,
  ) async {
    final result = await _syncUserTimeZoneUseCase(
      SyncUserTimeZoneParams(user: user),
    );
    return result.fold(
      (failure) {
        _logger.w(
          'Silent time zone sync failed: ${failure.message}',
        );
        return user;
      },
      (synced) => synced,
    );
  }

  /// Loads AppData; returns null if a failure state was already emitted.
  Future<(bool isFirstLaunch, AppData appData, bool isAppUpdateOk)?>
  _loadAppData(
    Emitter<AppDirectorState> emit,
  ) async {
    try {
      final isFirstLaunch =
          await _prefs.read<bool>(StorageConstants.isFirstLaunch) ?? true;
      final appDataId = Platform.isIOS ? 1 : 2;
      _logger.d('AppDirector loading appDataId=$appDataId');

      final result = await _getAppDataUseCase(
        GetAppDataParams(appDataId: appDataId),
      );

      return await result.fold<Future<(bool, AppData, bool)?>>(
        (failure) async {
          _logger.e('AppDirector getAppData failed', error: failure);
          emit(
            AppDirectorState.failure(
              failure: failure,
              isFirstLaunch: isFirstLaunch,
              storeUrlEn: state.storeUrlEn,
              storeUrlTr: state.storeUrlTr,
            ),
          );
          return null;
        },
        (appData) async {
          await _persistAppData(appData);
          final packageInfo = await PackageInfo.fromPlatform();
          final isOutdated = AppVersionComparator.isLocalOutdated(
            localVersion: packageInfo.version,
            localBuild: packageInfo.buildNumber,
            remoteVersion: appData.appVersion,
            remoteBuild: appData.buildNumber,
          );
          final forceUpdate = appData.forceUpdate ?? false;
          // Block only when behind remote min version/build and force-update.
          final isAppUpdateOk = !isOutdated || !forceUpdate;
          await _prefs.write(StorageConstants.isAppUpdateOk, isAppUpdateOk);
          _logger.d(
            'AppDirector appData ok '
            'local=${packageInfo.version}+${packageInfo.buildNumber} '
            'remote=${appData.appVersion}+${appData.buildNumber} '
            'isOutdated=$isOutdated forceUpdate=$forceUpdate '
            'isAppUpdateOk=$isAppUpdateOk',
          );
          return (isFirstLaunch, appData, isAppUpdateOk);
        },
      );
    } on Object catch (error, stackTrace) {
      _logger.e(
        'AppDirector loadAppData failed',
        error: error,
        stackTrace: stackTrace,
      );
      emit(
        AppDirectorState.failure(
          failure: UnknownFailure(
            message: 'app_data_load_failed',
            details: {'error': error.toString()},
          ),
          isFirstLaunch: state.isFirstLaunch,
          storeUrlEn: state.storeUrlEn,
          storeUrlTr: state.storeUrlTr,
        ),
      );
      return null;
    }
  }

  Future<void> _persistAppData(AppData appData) async {
    await Future.wait([
      _prefs.write(StorageConstants.remoteAppVersion, appData.appVersion),
      _prefs.write(StorageConstants.remoteBuildNumber, appData.buildNumber),
      _prefs.write(StorageConstants.storeUrlEn, appData.storeUrlEn),
      _prefs.write(StorageConstants.storeUrlTr, appData.storeUrlTr),
      if (appData.badgeLevelOne != null)
        _prefs.write(StorageConstants.badgeLevelOne, appData.badgeLevelOne),
      if (appData.badgeLevelTwo != null)
        _prefs.write(StorageConstants.badgeLevelTwo, appData.badgeLevelTwo),
      if (appData.badgeLevelThree != null)
        _prefs.write(
          StorageConstants.badgeLevelThree,
          appData.badgeLevelThree,
        ),
      if (appData.kvkkPrivacyPolicyEn != null)
        _prefs.write(
          StorageConstants.kvkkPrivacyPolicyEn,
          appData.kvkkPrivacyPolicyEn,
        ),
      if (appData.kvkkPrivacyPolicyTr != null)
        _prefs.write(
          StorageConstants.kvkkPrivacyPolicyTr,
          appData.kvkkPrivacyPolicyTr,
        ),
      if (appData.userConsentConfirmationFormEn != null)
        _prefs.write(
          StorageConstants.userConsentConfirmationFormEn,
          appData.userConsentConfirmationFormEn,
        ),
      if (appData.userConsentConfirmationFormTr != null)
        _prefs.write(
          StorageConstants.userConsentConfirmationFormTr,
          appData.userConsentConfirmationFormTr,
        ),
    ]);
  }

  Future<void> _onFirstLaunchDisabled(
    _EventFirstLaunchDisabled event,
    Emitter<AppDirectorState> emit,
  ) async {
    if (!state.isFirstLaunch) return;

    await _prefs.write(StorageConstants.isFirstLaunch, false);
    emit(
      state.maybeMap(
        success: (s) => s.copyWith(isFirstLaunch: false),
        loading: (s) => s.copyWith(isFirstLaunch: false),
        failure: (s) => s.copyWith(isFirstLaunch: false),
        initial: (s) => s.copyWith(isFirstLaunch: false),
        updateRequired: (s) => s.copyWith(isFirstLaunch: false),
        orElse: () => state,
      ),
    );
  }
}
