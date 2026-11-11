import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_teachers_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_teacher_list_tile.dart';

/// Home teachers tab: paginated teachers list with infinite scroll.
class HomeTeachersTab extends StatefulWidget {
  /// Creates a [HomeTeachersTab].
  const HomeTeachersTab({super.key});

  @override
  State<HomeTeachersTab> createState() => _HomeTeachersTabState();
}

class _HomeTeachersTabState extends State<HomeTeachersTab> {
  late final ScrollController _scrollController;
  late HomeTeachersBloc _bloc;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = context.read<HomeTeachersBloc>();
    // First paint (e.g. swipe) before a tab-button press.
    if (_bloc.state.maybeMap(initial: (_) => true, orElse: () => false)) {
      _bloc.add(const HomeTeachersEvent.fetched());
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - 200) return;

    final state = _bloc.state;
    if (!state.isSuccess || state.isLoadingMore || !state.hasMore) return;

    _bloc.add(const HomeTeachersEvent.nextPageRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTeachersBloc, HomeTeachersState>(
      listenWhen: (previous, current) =>
          previous.failureOrNull != current.failureOrNull ||
          previous.actionFailureOrNull != current.actionFailureOrNull,
      listener: (context, state) {
        final failure = state.failureOrNull ?? state.actionFailureOrNull;
        if (failure == null) return;
        AppFlushbar.showFailure(context, failure);
      },
      builder: (context, state) {
        final showLoading = state.maybeMap(
          initial: (_) => true,
          loading: (_) => true,
          orElse: () => false,
        );
        if (showLoading) {
          return const Center(child: AppLoadingIndicator());
        }
        if (state.isFailure) {
          return FailureView(
            failure: state.failureOrNull!,
            onRetry: () => context.read<HomeTeachersBloc>().add(
              const HomeTeachersEvent.fetched(),
            ),
          );
        }

        final teachers = state.teachersOrEmpty;
        final bottomInset = MediaQuery.paddingOf(context).bottom;
        final loadingMore = state.isLoadingMore;

        if (teachers.isEmpty) {
          return Center(child: Text('teachers'.tr()));
        }

        return ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.only(
            bottom: bottomInset > 0
                ? bottomInset
                : AppDimensions.p16 + kBottomNavigationBarHeight,
          ),
          itemCount: teachers.length + (loadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= teachers.length) {
              return const Padding(
                padding: EdgeInsets.all(AppDimensions.p24),
                child: Center(child: AppLoadingIndicator()),
              );
            }
            return HomeTeacherListTile(teacher: teachers[index]);
          },
        );
      },
    );
  }
}
