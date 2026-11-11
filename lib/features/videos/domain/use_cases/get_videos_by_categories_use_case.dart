import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/repositories/videos_repository.dart';

/// Loads playable videos for the given category ids.
@injectable
class GetVideosByCategoriesUseCase
    extends BaseUseCase<List<Video>, GetVideosByCategoriesParams> {
  /// Creates a [GetVideosByCategoriesUseCase].
  GetVideosByCategoriesUseCase(this._repository);

  final VideosRepository _repository;

  @override
  Future<Either<Failure, List<Video>>> call(
    GetVideosByCategoriesParams params,
  ) {
    return _repository.getVideosByCategories(params.categoryIds);
  }
}

/// Params for [GetVideosByCategoriesUseCase].
class GetVideosByCategoriesParams extends Equatable {
  /// Creates params.
  const GetVideosByCategoriesParams({required this.categoryIds});

  /// Category ids to filter by.
  final List<int> categoryIds;

  @override
  List<Object> get props => [categoryIds];
}
