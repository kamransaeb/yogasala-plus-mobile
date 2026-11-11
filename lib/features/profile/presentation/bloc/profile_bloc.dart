import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:enterprise_storage/enterprise_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/constants/di_constants.dart';
import 'package:yogasala_plus_mobile/core/constants/storage_constants.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/use_cases/get_user_yoga_sala_plus_mobile_user_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

/// Owns the profile tab user header data and badge thresholds.
@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  /// Creates a [ProfileBloc].
  ProfileBloc(
    this._getUser,
    @Named(DiConstants.sharedPrefs) this._prefs,
  ) : super(const ProfileState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
  }

  final GetUserYogaSalaPlusMobileUserUseCase _getUser;
  final LocalStorage _prefs;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());

    final result = await _getUser(const NoParams());

    if (emit.isDone) return;

    final badgeLevelOne = await _prefs.read<int>(
      StorageConstants.badgeLevelOne,
    );
    final badgeLevelTwo = await _prefs.read<int>(
      StorageConstants.badgeLevelTwo,
    );
    final badgeLevelThree = await _prefs.read<int>(
      StorageConstants.badgeLevelThree,
    );

    if (emit.isDone) return;

    result.fold(
      (failure) => emit(ProfileState.failure(failure: failure)),
      (user) => emit(
        ProfileState.success(
          user: user,
          badgeLevelOne: badgeLevelOne,
          badgeLevelTwo: badgeLevelTwo,
          badgeLevelThree: badgeLevelThree,
        ),
      ),
    );
  }
}
