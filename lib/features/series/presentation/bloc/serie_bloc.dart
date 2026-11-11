import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/series/domain/use_cases/get_serie_by_id_use_case.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/use_cases/get_teacher_by_id_use_case.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/entities/video.dart';
import 'package:yogasala_plus_mobile/features/videos/domain/use_cases/get_videos_by_serie_use_case.dart';

part 'serie_event.dart';
part 'serie_state.dart';
part 'serie_bloc.freezed.dart';

/// Owns serie detail: header, teacher, and ordered episode videos.
@injectable
class SerieBloc extends Bloc<SerieEvent, SerieState> {
  /// Creates a [SerieBloc] for [serieId].
  SerieBloc(
    this._getSerieById,
    this._getVideosBySerie,
    this._getTeacherById,
    @factoryParam this.serieId,
  ) : super(const SerieState.initial()) {
    on<_EventFetched>(_onFetched);
  }

  /// Serie to load.
  final int serieId;

  final GetSerieByIdUseCase _getSerieById;
  final GetVideosBySerieUseCase _getVideosBySerie;
  final GetTeacherByIdUseCase _getTeacherById;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<SerieState> emit,
  ) async {
    emit(const SerieState.loading());

    final serieResult = await _getSerieById(
      GetSerieByIdParams(id: serieId),
    );

    await serieResult.fold(
      (failure) async => emit(SerieState.failure(failure: failure)),
      (serie) async {
        final teacherId = serie.teacherId;
        final videosFuture = _getVideosBySerie(
          GetVideosBySerieParams(serieId: serieId),
        );
        final teacherFuture = teacherId == null
            ? null
            : _getTeacherById(GetTeacherByIdParams(id: teacherId));

        final videosResult = await videosFuture;
        final teacherResult = teacherFuture == null
            ? null
            : await teacherFuture;

        final videosFailure = videosResult.fold((f) => f, (_) => null);
        if (videosFailure != null) {
          emit(SerieState.failure(failure: videosFailure));
          return;
        }

        final videos = videosResult.getOrElse(() => const <Video>[]);
        // Teacher is optional for the detail page; ignore fetch failures.
        final teacher = teacherResult?.fold((_) => null, (t) => t);

        emit(
          SerieState.success(
            serie: serie,
            videos: videos,
            teacher: teacher,
          ),
        );
      },
    );
  }
}
