import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/constants/app_dimensions.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/series/presentation/bloc/serie_bloc.dart';
import 'package:yogasala_plus_mobile/features/series/presentation/widgets/serie_episode_tile.dart';
import 'package:yogasala_plus_mobile/features/series/presentation/widgets/serie_header.dart';

/// Serie detail: hero image, title, description, episode list.
@RoutePage()
class SeriePage extends StatelessWidget {
  /// Creates a [SeriePage] for [serieId].
  const SeriePage({
    @PathParam('serieId') required this.serieId,
    super.key,
  });

  /// Serie id to load.
  final int serieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<SerieBloc>(param1: serieId)..add(const SerieEvent.fetched()),
      child: const _SerieView(),
    );
  }
}

class _SerieView extends StatelessWidget {
  const _SerieView();

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<AppBloc>().state.locale;

    return Scaffold(
      appBar: AppBar(
        // title: BlocBuilder<SerieBloc, SerieState>(
        //   buildWhen: (previous, current) =>
        //       previous.serieOrNull != current.serieOrNull,
        //   builder: (context, state) {
        //     final serie = state.serieOrNull;
        //     if (serie == null) return const SizedBox.shrink();
        //     return Text(
        //       serie.nameForLocale(locale),
        //       overflow: TextOverflow.ellipsis,
        //     );
        //   },
        // ),
      ),
      body: BlocConsumer<SerieBloc, SerieState>(
        listenWhen: (previous, current) =>
            previous.isFailure != current.isFailure,
        listener: (context, state) {
          final failure = state.failureOrNull;
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
                  context.read<SerieBloc>().add(const SerieEvent.fetched()),
            );
          }

          final serie = state.serieOrNull;
          if (serie == null) {
            return const SizedBox.shrink();
          }

          final videos = state.videosOrEmpty;
          final teacher = state.teacherOrNull;

          return ListView.builder(
            padding: EdgeInsets.only(
              bottom: MediaQuery.paddingOf(context).bottom + AppDimensions.p16,
            ),
            itemCount: 1 + (videos.isEmpty ? 1 : videos.length),
            itemBuilder: (context, index) {
              if (index == 0) {
                return SerieHeader(serie: serie, teacher: teacher);
              }
              if (videos.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(AppDimensions.p24),
                  child: Center(child: Text('series_episodes_empty'.tr())),
                );
              }
              final episodeIndex = index - 1;
              return SerieEpisodeTile(
                video: videos[episodeIndex],
                episodeNumber: episodeIndex + 1,
                serieId: context.read<SerieBloc>().serieId,
              );
            },
          );
        },
      ),
    );
  }
}
