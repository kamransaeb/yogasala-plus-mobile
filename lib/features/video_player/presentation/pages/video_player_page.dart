import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:enterprise_ui/enterprise_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:yogasala_plus_mobile/core/enums/subscription_plan.dart';
import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/app_flushbar.dart';
import 'package:yogasala_plus_mobile/core/widgets/feedback/failure_view.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/errors/error_mapper.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/bloc/entitlements_bloc.dart';
import 'package:yogasala_plus_mobile/features/video_player/domain/entities/playback.dart';
import 'package:yogasala_plus_mobile/features/video_player/presentation/bloc/video_player_bloc.dart';

/// Full-screen Mux HLS player (video_player + chewie).
@RoutePage()
class VideoPlayerPage extends StatelessWidget {
  /// Creates a [VideoPlayerPage].
  const VideoPlayerPage({
    required this.videoId,
    this.serieId,
    this.title,
    super.key,
  });

  /// Video id to play.
  final int videoId;

  /// Optional series context for access checks.
  final int? serieId;

  /// Optional AppBar title override.
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<VideoPlayerBloc>(
        param1: videoId,
        param2: serieId,
      )..add(const VideoPlayerEvent.fetched()),
      child: _VideoPlayerView(title: title),
    );
  }
}

class _VideoPlayerView extends StatefulWidget {
  const _VideoPlayerView({this.title});

  final String? title;

  @override
  State<_VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<_VideoPlayerView> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  String? _initializedStreamUrl;
  bool _completionDispatched = false;
  bool _playerReady = false;

  @override
  void initState() {
    super.initState();
    unawaited(
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.portraitUp,
      ]),
    );
  }

  @override
  void dispose() {
    unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    );
    final videoController = _videoPlayerController;
    if (videoController != null) {
      videoController.removeListener(_onVideoControllerUpdate);
    }
    _chewieController?.dispose();
    unawaited(videoController?.dispose() ?? Future<void>.value());
    super.dispose();
  }

  void _onVideoControllerUpdate() {
    if (!mounted || _completionDispatched) return;

    final controller = _videoPlayerController;
    if (controller == null) return;

    final value = controller.value;
    if (!value.isInitialized || value.duration <= Duration.zero) return;
    if (!value.isCompleted) return;

    _completionDispatched = true;
    context.read<VideoPlayerBloc>().add(
      const VideoPlayerEvent.videoCompleted(),
    );
  }

  Future<void> _openPaywall() async {
    await context.router.push(
      PaywallRoute(highlightPlan: '${SubscriptionPlan.standard.wireValue}'),
    );
    if (!mounted) return;
    context.read<EntitlementsBloc>().add(const EntitlementsEvent.fetched());
    context.read<VideoPlayerBloc>().add(const VideoPlayerEvent.fetched());
  }

  Future<void> _ensurePlayer(Playback playback) async {
    if (_initializedStreamUrl == playback.streamUrl &&
        _chewieController != null &&
        _playerReady) {
      return;
    }

    _completionDispatched = false;
    _playerReady = false;

    final previousVideo = _videoPlayerController;
    if (previousVideo != null) {
      previousVideo.removeListener(_onVideoControllerUpdate);
    }
    _chewieController?.dispose();
    await previousVideo?.dispose();
    _chewieController = null;
    _videoPlayerController = null;

    final videoController = VideoPlayerController.networkUrl(
      Uri.parse(playback.streamUrl),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _videoPlayerController = videoController;
    videoController.addListener(_onVideoControllerUpdate);
    await videoController.setLooping(false);
    await videoController.initialize();

    if (!mounted) {
      await videoController.dispose();
      return;
    }

    _chewieController = ChewieController(
      videoPlayerController: videoController,
      autoPlay: true,
      allowPlaybackSpeedChanging: false,
      fullScreenByDefault: true,
      showOptions: false,
    );
    _initializedStreamUrl = playback.streamUrl;
    _playerReady = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.onSurface,
      appBar: AppBar(
        title: Text(
          widget.title?.trim().isNotEmpty == true
              ? widget.title!.trim()
              : 'video_player'.tr(),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: BlocConsumer<VideoPlayerBloc, VideoPlayerState>(
        listenWhen: (previous, current) =>
            previous.isFailure != current.isFailure ||
            previous.playbackOrNull?.streamUrl !=
                current.playbackOrNull?.streamUrl ||
            previous.activityMarked != current.activityMarked,
        listener: (context, state) {
          final failure = state.failureOrNull;
          if (failure != null) {
            AppFlushbar.showFailure(context, failure);
            return;
          }

          if (state.activityMarked) {
            AppFlushbar.showSuccess(context, 'video_activity_logged'.tr());
          }

          final playback = state.playbackOrNull;
          if (playback != null &&
              (playback.streamUrl != _initializedStreamUrl || !_playerReady)) {
            unawaited(_ensurePlayer(playback));
          }
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
            final failure = state.failureOrNull!;
            return FailureView(
              failure: failure,
              messageColor: scheme.surface,
              onRetry: () => context.read<VideoPlayerBloc>().add(
                const VideoPlayerEvent.fetched(),
              ),
              action: ErrorMapper.requiresSubscription(failure)
                  ? AppButton(
                      label: 'subscribe'.tr(),
                      onPressed: () => unawaited(_openPaywall()),
                    )
                  : null,
            );
          }

          final chewie = _chewieController;
          // Once ready, keep Chewie mounted even if controller flags flicker
          // at end-of-stream / fullscreen transitions.
          if (!_playerReady || chewie == null) {
            return const Center(child: AppLoadingIndicator());
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(child: Chewie(controller: chewie)),
              ),
            ],
          );
        },
      ),
    );
  }
}
