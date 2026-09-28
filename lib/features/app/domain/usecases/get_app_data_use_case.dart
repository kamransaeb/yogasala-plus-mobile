import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/app/domain/entities/app_data.dart';
import 'package:yogasala_plus_mobile/features/app/domain/repositories/app_data_repository.dart';

/// Fetches remote app configuration / force-update metadata.
@injectable
class GetAppDataUseCase implements BaseUseCase<AppData, GetAppDataParams> {
  /// Creates a [GetAppDataUseCase].
  const GetAppDataUseCase(this._appDataRepository);

  final AppDataRepository _appDataRepository;

  @override
  FutureOr<Either<Failure, AppData>> call(GetAppDataParams params) {
    return _appDataRepository.getAppData(appDataId: params.appDataId);
  }
}

/// Parameters for [GetAppDataUseCase].
class GetAppDataParams extends Equatable {
  /// Creates [GetAppDataParams].
  const GetAppDataParams({required this.appDataId});

  /// Platform-specific app-data row id (e.g. iOS=1, Android=2).
  final int appDataId;

  @override
  List<Object> get props => [appDataId];
}
