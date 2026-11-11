import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';
import 'package:yogasala_plus_mobile/features/leaderboard/presentation/bloc/leaderboard_bloc.dart';
import 'package:yogasala_plus_mobile/features/leaderboard/presentation/pages/leaderboard_form.dart';

/// Leaderboard tab: ranked users by points.
@RoutePage()
class LeaderboardPage extends StatelessWidget {
  /// Creates a [LeaderboardPage].
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;

    return BlocProvider(
      create: (_) =>
          getIt<LeaderboardBloc>()..add(const LeaderboardEvent.fetched()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('leaderboard'.tr()),
          actions: const [],
        ),
        body: const LeaderboardForm(),
      ),
    );
  }
}
