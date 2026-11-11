import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:yogasala_plus_mobile/features/home/presentation/widgets/home_serie_list_horizontal_box.dart';

/// Home categories tab: vertical list of category → series rows.
class HomeCategoriesTab extends StatelessWidget {
  /// Creates a [HomeCategoriesTab].
  const HomeCategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
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
            onRetry: () =>
                context.read<HomeBloc>().add(const HomeEvent.fetched()),
          );
        }

        final categorySections = state.categorySectionsOrEmpty;
        final teachersById = state.teachersByIdOrEmpty;
        if (categorySections.isEmpty) {
          return Center(child: Text('home_videos'.tr()));
        }

        final bottomInset = MediaQuery.paddingOf(context).bottom;

        return ListView.builder(
          padding: EdgeInsets.only(
            bottom: bottomInset > 0
                ? bottomInset
                : AppDimensions.p16 + kBottomNavigationBarHeight,
          ),
          itemCount: categorySections.length,
          itemBuilder: (context, index) {
            return HomeSerieListHorizontalBox(
              categorySection: categorySections[index],
              teachersById: teachersById,
            );
          },
        );
      },
    );
  }
}
