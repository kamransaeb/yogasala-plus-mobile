import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/domain/entities/serie.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/use_cases/get_teacher_by_id_use_case.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/use_cases/get_teacher_series_use_case.dart';

part 'teacher_event.dart';
part 'teacher_state.dart';
part 'teacher_bloc.freezed.dart';

/// Owns teacher detail: load by id and paginated series.
@injectable
class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  /// Creates a [TeacherBloc] for [teacherId].
  TeacherBloc(
    this._getTeacherById,
    this._getTeacherSeries,
    @factoryParam this.teacherId,
  ) : super(const TeacherState.initial()) {
    on<_EventFetched>(_onFetched, transformer: restartable());
    on<_EventNextPageRequested>(
      _onNextPageRequested,
      transformer: droppable(),
    );
  }

  /// Teacher to load.
  final int teacherId;

  final GetTeacherByIdUseCase _getTeacherById;
  final GetTeacherSeriesUseCase _getTeacherSeries;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<TeacherState> emit,
  ) async {
    emit(const TeacherState.loading());

    final teacherResult = await _getTeacherById(
      GetTeacherByIdParams(id: teacherId),
    );

    if (emit.isDone) return;

    final teacher = teacherResult.fold<Teacher?>(
      (failure) {
        emit(TeacherState.failure(failure: failure));
        return null;
      },
      (value) => value,
    );
    if (teacher == null) return;

    final seriesResult = await _getTeacherSeries(
      GetTeacherSeriesParams(id: teacherId),
    );

    if (emit.isDone) return;

    seriesResult.fold(
      (failure) => emit(
        TeacherState.success(
          teacher: teacher,
          actionFailure: failure,
        ),
      ),
      (seriePage) => emit(
        TeacherState.success(
          teacher: teacher,
          series: seriePage.content,
          page: seriePage.page,
          totalPages: seriePage.totalPages,
        ),
      ),
    );
  }

  Future<void> _onNextPageRequested(
    _EventNextPageRequested event,
    Emitter<TeacherState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess || current.isLoadingMore || !current.hasMore) {
      return;
    }

    final teacher = current.teacherOrNull;
    if (teacher == null) return;

    final previousSeries = current.seriesOrEmpty;
    final nextPage = current.pageOrZero + 1;

    emit(
      TeacherState.success(
        teacher: teacher,
        series: previousSeries,
        page: current.pageOrZero,
        totalPages: current.totalPagesOrZero,
        isLoadingMore: true,
      ),
    );

    final result = await _getTeacherSeries(
      GetTeacherSeriesParams(id: teacherId, page: nextPage),
    );

    if (emit.isDone) return;

    result.fold(
      (failure) => emit(
        TeacherState.success(
          teacher: teacher,
          series: previousSeries,
          page: current.pageOrZero,
          totalPages: current.totalPagesOrZero,
          actionFailure: failure,
        ),
      ),
      (seriePage) => emit(
        TeacherState.success(
          teacher: teacher,
          series: [...previousSeries, ...seriePage.content],
          page: seriePage.page,
          totalPages: seriePage.totalPages,
        ),
      ),
    );
  }
}
