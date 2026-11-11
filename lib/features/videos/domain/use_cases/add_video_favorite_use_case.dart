import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/repositories/videos_repository.dart';

/// Marks a video as favorite for the current user.
@injectable
class AddVideoFavoriteUseCase
    extends BaseUseCase<void, AddVideoFavoriteParams> {
  /// Creates an [AddVideoFavoriteUseCase].
  AddVideoFavoriteUseCase(this._repository);

  final VideosRepository _repository;

  @override
  Future<Either<Failure, void>> call(AddVideoFavoriteParams params) {
    return _repository.addVideoFavorite(params.id);
  }
}

/// Params for [AddVideoFavoriteUseCase].
class AddVideoFavoriteParams extends Equatable {
  /// Creates params.
  const AddVideoFavoriteParams({required this.id});

  /// Video id.
  final int id;

  @override
  List<Object> get props => [id];
}
