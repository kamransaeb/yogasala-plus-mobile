import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/home/domain/entities/video_category.dart';
import 'package:yogasala_plus_mobile/features/home/domain/repositories/videos_repository.dart';

/// Loads enabled video categories for the home feed.
@injectable
class GetVideosCategoryListEnabledUseCase
    extends BaseUseCase<List<VideoCategory>, NoParams> {
  /// Creates a [GetVideosCategoryListEnabledUseCase].
  GetVideosCategoryListEnabledUseCase(this._repository);

  final VideosRepository _repository;

  @override
  Future<Either<Failure, List<VideoCategory>>> call(NoParams params) {
    return _repository.getVideosCategoryListEnabled();
  }
}
