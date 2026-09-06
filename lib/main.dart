export 'main_dev.dart';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:enterprise_ui/enterprise_ui.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:yogasala_plus_mobile/bootstrap/initialize_app_services.dart';
// import 'package:yogasala_plus_mobile/core/navigation/app_router.dart';
// import 'package:yogasala_plus_mobile/core/theme/theme_bloc.dart';
// import 'package:yogasala_plus_mobile/di/injection.dart';
// import 'package:yogasala_plus_mobile/features/auth/presentation/bloc/auth/auth_bloc.dart';
// import 'package:yogasala_plus_mobile/firebase_options_dev.dart';

// Future<void> main() async {
//   // in main(), before runApp:
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await EasyLocalization.ensureInitialized();
//   await configureDependencies();
//   await initializeAppServices();

//   runApp(
//     EasyLocalization(
//       supportedLocales: const [Locale('en'), Locale('tr')],
//       path: 'assets/translations',
//       fallbackLocale: const Locale('en'),
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider.value(value: getIt<ThemeBloc>()),
//           BlocProvider.value(
//             value: getIt<AuthBloc>()
//               ..add(const AuthEvent.checkStatusRequested()),
//           ),
//         ],
//         child: const YogaSalaPlusApp(),
//       ),
//     ),
//   );
// }

// /// Main App Widget
// class YogaSalaPlusApp extends StatelessWidget {
//   /// Constructor
//   const YogaSalaPlusApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appRouter = getIt<AppRouter>();

//     return BlocBuilder<ThemeBloc, ThemeState>(
//       builder: (context, themeState) {
//         return BlocBuilder<AuthBloc, AuthState>(
//           builder: (context, authState) {
//             return MaterialApp.router(
//               title: 'Yoga Sala Plus',
//               theme: AppTheme.light(seed: Colors.teal),
//               darkTheme: AppTheme.dark(seed: Colors.teal),
//               themeMode: themeState.currentThemeStatus.themeMode,
//               localizationsDelegates: context.localizationDelegates,
//               supportedLocales: context.supportedLocales,
//               locale: context.locale,
//               routerConfig: appRouter.config(),
//               builder: (context, child) {
//                 if (authState.isChecking) {
//                   return const Scaffold(
//                     body: Center(child: AppLoadingIndicator()),
//                   );
//                 }
//                 return child ?? const SizedBox.shrink();
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
