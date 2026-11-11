import 'package:auto_route/auto_route.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/core/widgets/buttons/theme_toggle_button.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/app/presentation/bloc/app_bloc.dart';
import 'package:yogasala_plus_mobile/features/videos/presentation/bloc/video_bloc.dart';
import 'package:yogasala_plus_mobile/features/videos/presentation/pages/video_content.dart';

/// Video (episode) detail: image, teacher, name, description, next/prev.
@RoutePage()
class VideoPage extends StatelessWidget {
  /// Creates a [VideoPage] for [videoId] within [serieId].
  const VideoPage({
    @PathParam('videoId') required this.videoId,
    @PathParam('serieId') required this.serieId,
    super.key,
  });

  /// Episode id to load.
  final int videoId;

  /// Parent series id (episode list + playback context).
  final int serieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Recreate when path params change (next/prev replace same route type).
      key: ValueKey('video-$serieId-$videoId'),
      create: (_) => getIt<VideoBloc>(
        param1: videoId,
        param2: serieId,
      )..add(const VideoEvent.fetched()),
      child: const _VideoView(),
    );
  }
}

class _VideoView extends StatelessWidget {
  const _VideoView();

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<AppBloc>().state.locale;

    return Scaffold(
      appBar: AppBar(
        // title: BlocBuilder<VideoBloc, VideoState>(
        //   buildWhen: (previous, current) =>
        //       previous.videoOrNull != current.videoOrNull,
        //   builder: (context, state) {
        //     final video = state.videoOrNull;
        //     if (video == null) return const SizedBox.shrink();
        //     return Text(
        //       video.nameForLocale(locale),
        //       overflow: TextOverflow.ellipsis,
        //     );
        //   },
        // ),
        actions: const [],
      ),
      body: BlocConsumer<VideoBloc, VideoState>(
        listenWhen: (previous, current) =>
            previous.isFailure != current.isFailure ||
            previous.favoriteFailureOrNull != current.favoriteFailureOrNull,
        listener: (context, state) {
          final failure = state.failureOrNull ?? state.favoriteFailureOrNull;
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
                  context.read<VideoBloc>().add(const VideoEvent.fetched()),
            );
          }

          final video = state.videoOrNull;
          if (video == null) {
            return const SizedBox.shrink();
          }

          return VideoContent(
            video: video,
            teacher: state.teacherOrNull,
            previousVideo: state.previousVideoOrNull,
            nextVideo: state.nextVideoOrNull,
            serieId: context.read<VideoBloc>().serieId,
            serieFree: state.serieFree,
            hasQuiz: state.hasQuiz,
            isFavoriteBusy: state.isFavoriteBusy,
          );
        },
      ),
    );
  }
}
