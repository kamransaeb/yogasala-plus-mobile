import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/entities/teacher.dart';
import 'package:yogasala_plus_mobile/features/teachers/domain/use_cases/get_teachers_use_case.dart';

part 'home_teachers_event.dart';
part 'home_teachers_state.dart';
part 'home_teachers_bloc.freezed.dart';

/// Owns the home teachers tab: paginated list and load-more.
@injectable
class HomeTeachersBloc extends Bloc<HomeTeachersEvent, HomeTeachersState> {
  /// Creates a [HomeTeachersBloc].
  HomeTeachersBloc(this._getTeachers)
      : super(const HomeTeachersState.initial()) {
    on<_EventFetched>(
      _onFetched,
      transformer: restartable(),
    );
    on<_EventNextPageRequested>(
      _onNextPageRequested,
      transformer: droppable(),
    );
  }

  final GetTeachersUseCase _getTeachers;

  Future<void> _onFetched(
    _EventFetched event,
    Emitter<HomeTeachersState> emit,
  ) async {
    await _loadPage(
      emit: emit,
      page: 0,
      append: false,
      showFullLoading: true,
    );
  }

  Future<void> _onNextPageRequested(
    _EventNextPageRequested event,
    Emitter<HomeTeachersState> emit,
  ) async {
    final current = state;
    if (!current.isSuccess || current.isLoadingMore || !current.hasMore) {
      return;
    }

    await _loadPage(
      emit: emit,
      page: current.pageOrZero + 1,
      append: true,
      showFullLoading: false,
    );
  }

  Future<void> _loadPage({
    required Emitter<HomeTeachersState> emit,
    required int page,
    required bool append,
    required bool showFullLoading,
  }) async {
    final previousTeachers = state.teachersOrEmpty;

    if (showFullLoading && !append) {
      emit(const HomeTeachersState.loading());
    } else if (append && state.isSuccess) {
      emit(
        HomeTeachersState.success(
          teachers: previousTeachers,
          page: state.pageOrZero,
          totalPages: state.totalPagesOrZero,
          isLoadingMore: true,
        ),
      );
    }

    final result = await _getTeachers(GetTeachersParams(page: page));

    if (emit.isDone) return;

    result.fold(
      (failure) {
        if (append && previousTeachers.isNotEmpty) {
          emit(
            HomeTeachersState.success(
              teachers: previousTeachers,
              page: state.pageOrZero,
              totalPages: state.totalPagesOrZero,
              actionFailure: failure,
            ),
          );
        } else {
          emit(HomeTeachersState.failure(failure: failure));
        }
      },
      (teacherPage) {
        final teachers = append
            ? [...previousTeachers, ...teacherPage.content]
            : teacherPage.content;
        emit(
          HomeTeachersState.success(
            teachers: teachers,
            page: teacherPage.page,
            totalPages: teacherPage.totalPages,
          ),
        );
      },
    );
  }
}
