import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/repositories/videos_repository.dart';

/// Loads playable videos for one category.
@injectable
class GetVideosByCategoryUseCase
    extends BaseUseCase<List<Video>, GetVideosByCategoryParams> {
  /// Creates a [GetVideosByCategoryUseCase].
  GetVideosByCategoryUseCase(this._repository);

  final VideosRepository _repository;

  @override
  Future<Either<Failure, List<Video>>> call(GetVideosByCategoryParams params) {
    return _repository.getVideosByCategory(params.categoryId);
  }
}

/// Params for [GetVideosByCategoryUseCase].
class GetVideosByCategoryParams extends Equatable {
  /// Creates params.
  const GetVideosByCategoryParams({required this.categoryId});

  /// Category id.
  final int categoryId;

  @override
  List<Object> get props => [categoryId];
}
