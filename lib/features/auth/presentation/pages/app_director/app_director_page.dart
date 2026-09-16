import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogasala_plus_mobile/di/injection.dart';

/// Director page to redirect to home page, login page or continue to fill in
/// profile information
@RoutePage()
class AppDirectorPage extends StatelessWidget {
  /// Creates a [AppDirectorPage].
  const AppDirectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<AppDirectorBloc>()..add(const AppDirectorEventFetched()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<AppDirectorBloc, AppDirectorState>(
            buildWhen: (previous, current) =>
                previous.appDirectorStatus != current.appDirectorStatus,
            builder: (context, state) {
              if (state.appDirectorStatus == AppDirectorStatus.initial) {
                return const SplashPage();
              } else if (state.appDirectorStatus == AppDirectorStatus.loading) {
                return const SplashPage();
              } else if (state.appDirectorStatus == AppDirectorStatus.failure) {
                if (state.isAppUpdate) {
                  Future.delayed(
                    const Duration(seconds: 5),
                    () => context.read<AppDirectorBloc>().add(
                      const AppDirectorEventFetched(),
                    ),
                  );
                }

                return const SplashPage();
              } else if (state.appDirectorStatus == AppDirectorStatus.success) {
                // final bool isFirstUse = state.isFirstUse;
                // if (isFirstUse) {
                //   return const IntroPage();
                // } else {
                return const SplashPage();
                // }
              }
              return const SplashPage();
            },
            listenWhen: (previous, current) =>
                previous.appDirectorStatus != current.appDirectorStatus,
            listener: (context, state) {
              if (state.appDirectorStatus == AppDirectorStatus.success
              //    && !state.isFirstUse
              ) {
                if (state.userYorshoEntity.profileCompleted == false) {
                  context.go(
                    AppRouter.homeNameSurnamePath,
                    extra: state.userYorshoEntity,
                  );
                } else {
                  context.go(AppRouter.homePath);
                }
              } else if (state.appDirectorStatus == AppDirectorStatus.failure) {
                if (!state.isAppUpdate) {
                  int appId = Platform.isIOS ? 1 : 2;
                  String updateAppAsset;
                  String updateAppStoreUrl;
                  if (context.read<AppBloc>().state.locale == 'tr') {
                    updateAppStoreUrl = state.updateAppStoreUrlTr;
                    if (appId == 1) {
                      updateAppAsset = AssetsIcons.appStoreTr;
                    } else {
                      updateAppAsset = AssetsIcons.googlePlayTr;
                    }
                  } else {
                    updateAppStoreUrl = state.updateAppStoreUrlEn;
                    if (appId == 1) {
                      updateAppAsset = AssetsIcons.appStoreEn;
                    } else {
                      updateAppAsset = AssetsIcons.googlePlayEn;
                    }
                  }

                  showUpdateAppDialog(
                    context,
                    state.failure.message!,
                    updateAppAsset,
                    updateAppStoreUrl,
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}
