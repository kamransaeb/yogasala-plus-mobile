import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/home/domain/repositories/videos_repository.dart';

/// Loads enabled videos for the given category ids.
@injectable
class GetVideosListEnabledByCategoryIdsUseCase
    extends BaseUseCase<List<Video>, GetVideosListEnabledByCategoryIdsParams> {
  /// Creates a [GetVideosListEnabledByCategoryIdsUseCase].
  GetVideosListEnabledByCategoryIdsUseCase(this._repository);

  final VideosRepository _repository;

  @override
  Future<Either<Failure, List<Video>>> call(
    GetVideosListEnabledByCategoryIdsParams params,
  ) {
    return _repository.getVideosListEnabledByCategoryIds(
      params.videosCategoryIdList,
    );
  }
}

/// Params for [GetVideosListEnabledByCategoryIdsUseCase].
class GetVideosListEnabledByCategoryIdsParams extends Equatable {
  /// Creates params.
  const GetVideosListEnabledByCategoryIdsParams({
    required this.videosCategoryIdList,
  });

  /// Category ids to filter by.
  final List<int> videosCategoryIdList;

  @override
  List<Object> get props => [videosCategoryIdList];
}
