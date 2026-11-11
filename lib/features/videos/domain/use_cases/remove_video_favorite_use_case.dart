import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/repositories/videos_repository.dart';

/// Removes a video from the current user's favorites.
@injectable
class RemoveVideoFavoriteUseCase
    extends BaseUseCase<void, RemoveVideoFavoriteParams> {
  /// Creates a [RemoveVideoFavoriteUseCase].
  RemoveVideoFavoriteUseCase(this._repository);

  final VideosRepository _repository;

  @override
  Future<Either<Failure, void>> call(RemoveVideoFavoriteParams params) {
    return _repository.removeVideoFavorite(params.id);
  }
}

/// Params for [RemoveVideoFavoriteUseCase].
class RemoveVideoFavoriteParams extends Equatable {
  /// Creates params.
  const RemoveVideoFavoriteParams({required this.id});

  /// Video id.
  final int id;

  @override
  List<Object> get props => [id];
}
