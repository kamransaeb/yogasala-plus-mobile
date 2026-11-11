import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/live_sessions/presentation/bloc/live_sessions_bloc.dart';
import 'package:yogasala_plus_mobile/features/live_videos/presentation/pages/live_videos_form.dart';
import 'package:yogasala_plus_mobile/features/subscriptions/presentation/bloc/entitlements_bloc.dart';

/// Live sessions tab: upcoming Zoom classes.
@RoutePage()
class LiveVideosPage extends StatelessWidget {
  /// Creates a [LiveVideosPage].
  const LiveVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;

    return BlocProvider(
      create: (_) {
        getIt<EntitlementsBloc>().add(const EntitlementsEvent.fetched());
        return getIt<LiveSessionsBloc>()
          ..add(const LiveSessionsEvent.fetched());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('live_videos'.tr()),
          actions: const [],
        ),
        body: const LiveVideosForm(),
      ),
    );
  }
}
