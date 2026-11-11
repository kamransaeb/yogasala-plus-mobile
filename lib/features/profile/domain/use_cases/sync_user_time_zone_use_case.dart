import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/core/constants/time_zone_constants.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/repositories/user_yoga_sala_plus_repository.dart';

/// Silently syncs the OS IANA zone to the user profile when it differs.
@injectable
class SyncUserTimeZoneUseCase
    extends BaseUseCase<UserYogaSalaPlus, SyncUserTimeZoneParams> {
  /// Creates a [SyncUserTimeZoneUseCase].
  SyncUserTimeZoneUseCase(this._repository);

  final UserYogaSalaPlusRepository _repository;

  @override
  Future<Either<Failure, UserYogaSalaPlus>> call(
    SyncUserTimeZoneParams params,
  ) async {
    final user = params.user;
    final stored =
        user.timeZone?.trim().isNotEmpty == true
            ? user.timeZone!.trim()
            : TimeZoneConstants.defaultTimeZone;

    String osZone;
    try {
      osZone = (await FlutterTimezone.getLocalTimezone()).identifier.trim();
    } on Object {
      osZone = TimeZoneConstants.defaultTimeZone;
    }
    if (osZone.isEmpty) {
      osZone = TimeZoneConstants.defaultTimeZone;
    }

    if (osZone == stored) {
      return Right(user);
    }

    return _repository.updateUserTimeZone(osZone);
  }
}

/// Params for [SyncUserTimeZoneUseCase].
class SyncUserTimeZoneParams extends Equatable {
  /// Creates params.
  const SyncUserTimeZoneParams({required this.user});

  /// Current user profile.
  final UserYogaSalaPlus user;

  @override
  List<Object> get props => [user.id, user.timeZone ?? ''];
}
