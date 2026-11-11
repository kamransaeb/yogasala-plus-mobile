// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:device_info_plus/device_info_plus.dart' as _i833;
import 'package:dio/dio.dart' as _i361;
import 'package:enterprise_core/enterprise_core.dart' as _i89;
import 'package:enterprise_logger/enterprise_logger.dart' as _i194;
import 'package:enterprise_network/enterprise_network.dart' as _i496;
import 'package:enterprise_storage/enterprise_storage.dart' as _i42;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/navigation/app_router.dart' as _i159;
import '../core/theme/theme_bloc.dart' as _i905;
import '../errors/app_error_reporter.dart' as _i589;
import '../features/activity/data/api/activity_api_client.dart' as _i75;
import '../features/activity/data/datasources/activity_remote_data_source.dart'
    as _i530;
import '../features/activity/data/datasources/activity_remote_data_source_impl.dart'
    as _i404;
import '../features/activity/data/repositories/activity_repository_impl.dart'
    as _i700;
import '../features/activity/domain/repositories/activity_repository.dart'
    as _i826;
import '../features/activity/domain/use_cases/get_user_activity_streak_use_case.dart'
    as _i370;
import '../features/activity/domain/use_cases/get_user_activity_use_case.dart'
    as _i1031;
import '../features/activity/domain/use_cases/mark_user_activity_use_case.dart'
    as _i413;
import '../features/app/app_config.dart' as _i1025;
import '../features/app/data/api/app_data_api_client.dart' as _i979;
import '../features/app/data/datasources/app_data_remote_data_source.dart'
    as _i763;
import '../features/app/data/datasources/app_data_remote_data_source_impl.dart'
    as _i148;
import '../features/app/data/repositories/app_data_repository_impl.dart'
    as _i305;
import '../features/app/domain/repositories/app_data_repository.dart' as _i426;
import '../features/app/domain/use_cases/get_app_data_use_case.dart' as _i258;
import '../features/app/presentation/bloc/app_bloc.dart' as _i896;
import '../features/app_director/presentation/bloc/app_director_bloc.dart'
    as _i502;
import '../features/auth/data/api/auth_api_client.dart' as _i1005;
import '../features/auth/data/datasources/auth_local_data_source.dart' as _i109;
import '../features/auth/data/datasources/auth_local_data_source_impl.dart'
    as _i889;
import '../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i720;
import '../features/auth/data/datasources/auth_remote_data_source_impl.dart'
    as _i902;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i570;
import '../features/auth/domain/repositories/auth_repository.dart' as _i869;
import '../features/auth/domain/use_cases/check_auth_status_use_case.dart'
    as _i1062;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i498;
import '../features/auth/domain/use_cases/logout_use_case.dart' as _i573;
import '../features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i906;
import '../features/auth/domain/use_cases/sign_up_use_case.dart' as _i500;
import '../features/auth/presentation/bloc/auth_bloc.dart' as _i60;
import '../features/calendar/presentation/bloc/calendar_bloc.dart' as _i628;
import '../features/categories/data/api/categories_api_client.dart' as _i1012;
import '../features/categories/data/datasources/categories_remote_data_source.dart'
    as _i773;
import '../features/categories/data/datasources/categories_remote_data_source_impl.dart'
    as _i173;
import '../features/categories/data/repositories/categories_repository_impl.dart'
    as _i1046;
import '../features/categories/domain/repositories/categories_repository.dart'
    as _i1058;
import '../features/categories/domain/use_cases/get_categories_list_enabled_use_case.dart'
    as _i7;
import '../features/home/presentation/bloc/home_bloc.dart' as _i824;
import '../features/home/presentation/bloc/home_series_bloc.dart' as _i277;
import '../features/home/presentation/bloc/home_teachers_bloc.dart' as _i759;
import '../features/home/presentation/bloc/home_video_favorites_bloc.dart'
    as _i133;
import '../features/leaderboard/presentation/bloc/leaderboard_bloc.dart'
    as _i239;
import '../features/live_sessions/data/api/live_sessions_api_client.dart'
    as _i461;
import '../features/live_sessions/data/datasources/live_sessions_remote_data_source.dart'
    as _i304;
import '../features/live_sessions/data/datasources/live_sessions_remote_data_source_impl.dart'
    as _i2;
import '../features/live_sessions/data/repositories/live_sessions_repository_impl.dart'
    as _i453;
import '../features/live_sessions/domain/repositories/live_sessions_repository.dart'
    as _i73;
import '../features/live_sessions/domain/use_cases/get_live_sessions_use_case.dart'
    as _i696;
import '../features/live_sessions/domain/use_cases/join_live_session_use_case.dart'
    as _i634;
import '../features/live_sessions/presentation/bloc/live_sessions_bloc.dart'
    as _i165;
import '../features/login/presentation/bloc/login_bloc.dart' as _i1022;
import '../features/onboarding/presentation/bloc/onboarding_agreements/onboarding_agreements_bloc.dart'
    as _i732;
import '../features/onboarding/presentation/bloc/onboarding_date_of_birth/onboarding_date_of_birth_bloc.dart'
    as _i408;
import '../features/onboarding/presentation/bloc/onboarding_gender/onboarding_gender_bloc.dart'
    as _i81;
import '../features/onboarding/presentation/bloc/onboarding_name_surname/onboarding_name_surname_bloc.dart'
    as _i464;
import '../features/onboarding/presentation/bloc/onboarding_profile_photo/onboarding_profile_photo_bloc.dart'
    as _i532;
import '../features/points/data/api/points_api_client.dart' as _i984;
import '../features/points/data/datasources/points_remote_data_source.dart'
    as _i535;
import '../features/points/data/datasources/points_remote_data_source_impl.dart'
    as _i761;
import '../features/points/data/repositories/points_repository_impl.dart'
    as _i582;
import '../features/points/domain/repositories/points_repository.dart' as _i183;
import '../features/points/domain/use_cases/get_leaderboard_use_case.dart'
    as _i909;
import '../features/points/domain/use_cases/get_user_points_use_case.dart'
    as _i447;
import '../features/points/presentation/bloc/points_bloc.dart' as _i171;
import '../features/profile/data/api/user_yoga_sala_plus_api_client.dart'
    as _i369;
import '../features/profile/data/datasources/user_yoga_sala_plus_remote_data_source.dart'
    as _i662;
import '../features/profile/data/datasources/user_yoga_sala_plus_remote_data_source_impl.dart'
    as _i777;
import '../features/profile/data/repositories/user_yoga_sala_plus_repository_impl.dart'
    as _i227;
import '../features/profile/domain/repositories/user_yoga_sala_plus_repository.dart'
    as _i994;
import '../features/profile/domain/use_cases/complete_user_yoga_sala_plus_use_case.dart'
    as _i1037;
import '../features/profile/domain/use_cases/get_or_create_user_yoga_sala_plus_use_case.dart'
    as _i514;
import '../features/profile/domain/use_cases/get_user_yoga_sala_plus_mobile_user_use_case.dart'
    as _i890;
import '../features/profile/domain/use_cases/sync_user_time_zone_use_case.dart'
    as _i758;
import '../features/profile/domain/use_cases/update_user_yoga_sala_plus_mobile_user_use_case.dart'
    as _i344;
import '../features/profile/domain/use_cases/upload_profile_image_use_case.dart'
    as _i1071;
import '../features/profile/presentation/bloc/privacy_policy/privacy_policy_bloc.dart'
    as _i703;
import '../features/profile/presentation/bloc/profile_bloc.dart' as _i571;
import '../features/profile/presentation/bloc/profile_info/profile_info_bloc.dart'
    as _i364;
import '../features/profile/presentation/bloc/terms_of_service/terms_of_service_bloc.dart'
    as _i815;
import '../features/quiz/data/api/quiz_api_client.dart' as _i123;
import '../features/quiz/data/datasources/quiz_remote_data_source.dart'
    as _i789;
import '../features/quiz/data/datasources/quiz_remote_data_source_impl.dart'
    as _i55;
import '../features/quiz/data/repositories/quiz_repository_impl.dart' as _i719;
import '../features/quiz/domain/repositories/quiz_repository.dart' as _i741;
import '../features/quiz/domain/use_cases/get_quiz_attempt_by_id_use_case.dart'
    as _i1051;
import '../features/quiz/domain/use_cases/get_quiz_attempts_use_case.dart'
    as _i20;
import '../features/quiz/domain/use_cases/get_video_quiz_use_case.dart'
    as _i924;
import '../features/quiz/domain/use_cases/submit_quiz_answer_use_case.dart'
    as _i615;
import '../features/quiz/presentation/bloc/quiz_attempt_detail_bloc.dart'
    as _i908;
import '../features/quiz/presentation/bloc/quiz_attempts_bloc.dart' as _i689;
import '../features/quiz/presentation/bloc/quiz_bloc.dart' as _i942;
import '../features/reset_password/presentation/bloc/reset_password_bloc.dart'
    as _i314;
import '../features/series/data/api/series_api_client.dart' as _i531;
import '../features/series/data/datasources/series_remote_data_source.dart'
    as _i683;
import '../features/series/data/datasources/series_remote_data_source_impl.dart'
    as _i118;
import '../features/series/data/repositories/series_repository_impl.dart'
    as _i1070;
import '../features/series/domain/repositories/series_repository.dart' as _i665;
import '../features/series/domain/use_cases/get_serie_by_id_use_case.dart'
    as _i244;
import '../features/series/domain/use_cases/get_series_by_categories_use_case.dart'
    as _i812;
import '../features/series/domain/use_cases/get_series_by_category_use_case.dart'
    as _i985;
import '../features/series/domain/use_cases/get_series_use_case.dart' as _i504;
import '../features/series/presentation/bloc/serie_bloc.dart' as _i595;
import '../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i418;
import '../features/subscriptions/data/api/entitlements_api_client.dart'
    as _i681;
import '../features/subscriptions/data/datasources/entitlements_remote_data_source.dart'
    as _i591;
import '../features/subscriptions/data/datasources/entitlements_remote_data_source_impl.dart'
    as _i999;
import '../features/subscriptions/data/repositories/entitlements_repository_impl.dart'
    as _i149;
import '../features/subscriptions/data/repositories/purchases_repository_impl.dart'
    as _i790;
import '../features/subscriptions/domain/repositories/entitlements_repository.dart'
    as _i513;
import '../features/subscriptions/domain/repositories/purchases_repository.dart'
    as _i412;
import '../features/subscriptions/domain/use_cases/get_subscription_packages_use_case.dart'
    as _i978;
import '../features/subscriptions/domain/use_cases/get_user_entitlements_use_case.dart'
    as _i421;
import '../features/subscriptions/domain/use_cases/log_in_purchases_use_case.dart'
    as _i611;
import '../features/subscriptions/domain/use_cases/log_out_purchases_use_case.dart'
    as _i214;
import '../features/subscriptions/domain/use_cases/purchase_subscription_use_case.dart'
    as _i257;
import '../features/subscriptions/domain/use_cases/restore_purchases_use_case.dart'
    as _i261;
import '../features/subscriptions/presentation/bloc/entitlements_bloc.dart'
    as _i760;
import '../features/subscriptions/presentation/bloc/paywall_bloc.dart' as _i569;
import '../features/teachers/data/api/teachers_api_client.dart' as _i993;
import '../features/teachers/data/datasources/teachers_remote_data_source.dart'
    as _i44;
import '../features/teachers/data/datasources/teachers_remote_data_source_impl.dart'
    as _i564;
import '../features/teachers/data/repositories/teachers_repository_impl.dart'
    as _i284;
import '../features/teachers/domain/repositories/teachers_repository.dart'
    as _i497;
import '../features/teachers/domain/use_cases/get_teacher_by_id_use_case.dart'
    as _i738;
import '../features/teachers/domain/use_cases/get_teacher_series_use_case.dart'
    as _i680;
import '../features/teachers/domain/use_cases/get_teachers_use_case.dart'
    as _i249;
import '../features/teachers/presentation/bloc/teacher_bloc.dart' as _i831;
import '../features/video_player/data/api/playback_api_client.dart' as _i1038;
import '../features/video_player/data/datasources/playback_remote_data_source.dart'
    as _i77;
import '../features/video_player/data/datasources/playback_remote_data_source_impl.dart'
    as _i747;
import '../features/video_player/data/repositories/playback_repository_impl.dart'
    as _i911;
import '../features/video_player/domain/repositories/playback_repository.dart'
    as _i419;
import '../features/video_player/domain/use_cases/get_playback_use_case.dart'
    as _i333;
import '../features/video_player/presentation/bloc/video_player_bloc.dart'
    as _i71;
import '../features/videos/data/api/videos_api_client.dart' as _i750;
import '../features/videos/data/datasources/videos_remote_data_source.dart'
    as _i366;
import '../features/videos/data/datasources/videos_remote_data_source_impl.dart'
    as _i762;
import '../features/videos/data/repositories/videos_repository_impl.dart'
    as _i737;
import '../features/videos/domain/repositories/videos_repository.dart' as _i169;
import '../features/videos/domain/use_cases/add_video_favorite_use_case.dart'
    as _i24;
import '../features/videos/domain/use_cases/get_favorite_videos_use_case.dart'
    as _i357;
import '../features/videos/domain/use_cases/get_video_favorite_use_case.dart'
    as _i525;
import '../features/videos/domain/use_cases/get_videos_by_categories_use_case.dart'
    as _i724;
import '../features/videos/domain/use_cases/get_videos_by_category_use_case.dart'
    as _i178;
import '../features/videos/domain/use_cases/get_videos_by_serie_use_case.dart'
    as _i348;
import '../features/videos/domain/use_cases/remove_video_favorite_use_case.dart'
    as _i17;
import '../features/videos/presentation/bloc/video_bloc.dart' as _i285;
import 'modules/core_module.dart' as _i134;
import 'modules/firebase_module.dart' as _i398;
import 'modules/logger_module.dart' as _i205;
import 'modules/network_module.dart' as _i851;
import 'modules/storage_module.dart' as _i150;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final loggerModule = _$LoggerModule();
    final firebaseModule = _$FirebaseModule();
    final networkModule = _$NetworkModule();
    final coreModule = _$CoreModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => storageModule.sharedPrefrences,
      preResolve: true,
    );
    gh.factory<_i408.OnboardingDateOfBirthBloc>(
      () => _i408.OnboardingDateOfBirthBloc(),
    );
    gh.factory<_i81.OnboardingGenderBloc>(() => _i81.OnboardingGenderBloc());
    gh.factory<_i464.OnboardingNameSurnameBloc>(
      () => _i464.OnboardingNameSurnameBloc(),
    );
    gh.factory<_i314.ResetPasswordBloc>(() => _i314.ResetPasswordBloc());
    gh.factory<_i418.SignUpBloc>(() => _i418.SignUpBloc());
    gh.singleton<_i159.AppRouter>(() => _i159.AppRouter());
    gh.singleton<_i194.LoggerConfig>(() => loggerModule.loggerConfig());
    gh.singleton<_i558.FlutterSecureStorage>(
      () => storageModule.flutterSecureStorage,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i457.FirebaseStorage>(
      () => firebaseModule.firebaseStorage,
    );
    gh.lazySingleton<_i895.Connectivity>(() => networkModule.connectivity);
    gh.lazySingleton<_i161.InternetConnection>(
      () => networkModule.internetConnection,
    );
    gh.lazySingleton<_i833.DeviceInfoPlugin>(
      () => networkModule.deviceInfoPlugin,
    );
    gh.factoryParam<_i1022.LoginBloc, String?, String?>(
      (email, password) => _i1022.LoginBloc(email: email, password: password),
    );
    gh.lazySingleton<_i496.DeviceNetworkInfo>(
      () => networkModule.deviceNetworkInfo(gh<_i833.DeviceInfoPlugin>()),
    );
    gh.singleton<_i194.LoggerService>(
      () => loggerModule.loggerService(gh<_i194.LoggerConfig>()),
    );
    gh.lazySingleton<_i496.NetworkClientConfig>(
      () => networkModule.networkClientConfig(gh<_i1025.AppConfig>()),
    );
    gh.singleton<_i42.LocalStorage>(
      () => storageModule.hiveStorage(gh<_i194.LoggerService>()),
      instanceName: 'hive_storage',
    );
    gh.singleton<_i42.HiveStorage>(
      () => storageModule.hiveStorageConcrete(
        gh<_i42.LocalStorage>(instanceName: 'hive_storage'),
      ),
    );
    gh.singleton<_i42.LocalStorage>(
      () => storageModule.sharedPrefsStorage(
        gh<_i460.SharedPreferences>(),
        gh<_i194.LoggerService>(),
      ),
      instanceName: 'shared_prefs',
    );
    gh.factory<_i703.PrivacyPolicyBloc>(
      () => _i703.PrivacyPolicyBloc(
        gh<_i42.LocalStorage>(instanceName: 'shared_prefs'),
      ),
    );
    gh.factory<_i815.TermsOfServiceBloc>(
      () => _i815.TermsOfServiceBloc(
        gh<_i42.LocalStorage>(instanceName: 'shared_prefs'),
      ),
    );
    gh.lazySingleton<_i496.NetworkHelper>(
      () => networkModule.networkHelper(
        gh<_i895.Connectivity>(),
        gh<_i161.InternetConnection>(),
        gh<_i194.LoggerService>(),
      ),
    );
    gh.lazySingleton<_i496.NetworkCacheStore>(
      () => networkModule.networkCacheStore(
        gh<_i42.LocalStorage>(instanceName: 'hive_storage'),
      ),
    );
    gh.singleton<_i42.LocalStorage>(
      () => storageModule.secureStorage(
        gh<_i558.FlutterSecureStorage>(),
        gh<_i194.LoggerService>(),
      ),
      instanceName: 'secure_storage',
    );
    gh.lazySingleton<_i412.PurchasesRepository>(
      () => _i790.PurchasesRepositoryImpl(
        gh<_i1025.AppConfig>(),
        gh<_i194.LoggerService>(),
      ),
    );
    gh.lazySingleton<_i905.ThemeBloc>(
      () => _i905.ThemeBloc(
        gh<_i42.LocalStorage>(instanceName: 'hive_storage'),
        gh<_i194.LoggerService>(),
      ),
    );
    gh.lazySingleton<_i109.AuthLocalDataSource>(
      () => _i889.AuthLocalDataSourceImpl(
        gh<_i42.LocalStorage>(instanceName: 'secure_storage'),
      ),
    );
    gh.singleton<_i589.AppErrorReporter>(
      () => coreModule.appErrorReporter(gh<_i194.LoggerService>()),
    );
    gh.lazySingleton<_i496.JsonTransformer>(
      () => networkModule.jsonTransformer(gh<_i194.LoggerService>()),
    );
    gh.lazySingleton<_i496.DioClient>(
      () => networkModule.dioClient(
        gh<_i496.NetworkClientConfig>(),
        gh<_i194.LoggerService>(),
        gh<_i496.DeviceNetworkInfo>(),
        gh<_i496.NetworkCacheStore>(),
      ),
    );
    gh.singleton<_i89.ErrorHandler>(
      () => coreModule.errorHandler(
        gh<_i194.LoggerService>(),
        gh<_i589.AppErrorReporter>(),
      ),
    );
    gh.lazySingleton<_i896.AppBloc>(
      () => _i896.AppBloc(
        gh<_i194.LoggerService>(),
        gh<_i42.LocalStorage>(instanceName: 'shared_prefs'),
      ),
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(gh<_i496.DioClient>()));
    gh.factory<_i1071.UploadProfileImageUseCase>(
      () => _i1071.UploadProfileImageUseCase(
        gh<_i457.FirebaseStorage>(),
        gh<_i59.FirebaseAuth>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.factory<_i532.OnboardingProfilePhotoBloc>(
      () => _i532.OnboardingProfilePhotoBloc(
        gh<_i1071.UploadProfileImageUseCase>(),
      ),
    );
    gh.factory<_i978.GetSubscriptionPackagesUseCase>(
      () =>
          _i978.GetSubscriptionPackagesUseCase(gh<_i412.PurchasesRepository>()),
    );
    gh.factory<_i611.LogInPurchasesUseCase>(
      () => _i611.LogInPurchasesUseCase(gh<_i412.PurchasesRepository>()),
    );
    gh.factory<_i214.LogOutPurchasesUseCase>(
      () => _i214.LogOutPurchasesUseCase(gh<_i412.PurchasesRepository>()),
    );
    gh.factory<_i257.PurchaseSubscriptionUseCase>(
      () => _i257.PurchaseSubscriptionUseCase(gh<_i412.PurchasesRepository>()),
    );
    gh.factory<_i261.RestorePurchasesUseCase>(
      () => _i261.RestorePurchasesUseCase(gh<_i412.PurchasesRepository>()),
    );
    gh.lazySingleton<_i75.ActivityApiClient>(
      () => _i75.ActivityApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i979.AppDataApiClient>(
      () => _i979.AppDataApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i1005.AuthApiClient>(
      () => _i1005.AuthApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i1012.CategoriesApiClient>(
      () => _i1012.CategoriesApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i461.LiveSessionsApiClient>(
      () => _i461.LiveSessionsApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i984.PointsApiClient>(
      () => _i984.PointsApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i369.UserYogaSalaPlusApiClient>(
      () => _i369.UserYogaSalaPlusApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i123.QuizApiClient>(
      () => _i123.QuizApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i531.SeriesApiClient>(
      () => _i531.SeriesApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i681.EntitlementsApiClient>(
      () => _i681.EntitlementsApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i993.TeachersApiClient>(
      () => _i993.TeachersApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i1038.PlaybackApiClient>(
      () => _i1038.PlaybackApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i750.VideosApiClient>(
      () => _i750.VideosApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i789.QuizRemoteDataSource>(
      () => _i55.QuizRemoteDataSourceImpl(gh<_i123.QuizApiClient>()),
    );
    gh.factory<_i763.AppDataRemoteDataSource>(
      () => _i148.AppDataRemoteDataSourceImpl(
        gh<_i194.LoggerService>(),
        gh<_i979.AppDataApiClient>(),
      ),
    );
    gh.lazySingleton<_i773.CategoriesRemoteDataSource>(
      () => _i173.CategoriesRemoteDataSourceImpl(
        gh<_i1012.CategoriesApiClient>(),
      ),
    );
    gh.lazySingleton<_i535.PointsRemoteDataSource>(
      () => _i761.PointsRemoteDataSourceImpl(gh<_i984.PointsApiClient>()),
    );
    gh.lazySingleton<_i366.VideosRemoteDataSource>(
      () => _i762.VideosRemoteDataSourceImpl(gh<_i750.VideosApiClient>()),
    );
    gh.factory<_i662.UserYogaSalaPlusRemoteDataSource>(
      () => _i777.UserYogaSalaPlusRemoteDataSourceImpl(
        gh<_i194.LoggerService>(),
        gh<_i369.UserYogaSalaPlusApiClient>(),
      ),
    );
    gh.lazySingleton<_i169.VideosRepository>(
      () => _i737.VideosRepositoryImpl(
        gh<_i366.VideosRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i1058.CategoriesRepository>(
      () => _i1046.CategoriesRepositoryImpl(
        gh<_i773.CategoriesRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i44.TeachersRemoteDataSource>(
      () => _i564.TeachersRemoteDataSourceImpl(gh<_i993.TeachersApiClient>()),
    );
    gh.lazySingleton<_i741.QuizRepository>(
      () => _i719.QuizRepositoryImpl(
        gh<_i789.QuizRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i304.LiveSessionsRemoteDataSource>(
      () => _i2.LiveSessionsRemoteDataSourceImpl(
        gh<_i461.LiveSessionsApiClient>(),
      ),
    );
    gh.lazySingleton<_i73.LiveSessionsRepository>(
      () => _i453.LiveSessionsRepositoryImpl(
        gh<_i304.LiveSessionsRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i77.PlaybackRemoteDataSource>(
      () => _i747.PlaybackRemoteDataSourceImpl(gh<_i1038.PlaybackApiClient>()),
    );
    gh.factory<_i426.AppDataRepository>(
      () => _i305.AppDataRepositoryImpl(
        gh<_i763.AppDataRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i419.PlaybackRepository>(
      () => _i911.PlaybackRepositoryImpl(
        gh<_i77.PlaybackRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i683.SeriesRemoteDataSource>(
      () => _i118.SeriesRemoteDataSourceImpl(gh<_i531.SeriesApiClient>()),
    );
    gh.lazySingleton<_i183.PointsRepository>(
      () => _i582.PointsRepositoryImpl(
        gh<_i535.PointsRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.factory<_i696.GetLiveSessionsUseCase>(
      () => _i696.GetLiveSessionsUseCase(gh<_i73.LiveSessionsRepository>()),
    );
    gh.factory<_i634.JoinLiveSessionUseCase>(
      () => _i634.JoinLiveSessionUseCase(gh<_i73.LiveSessionsRepository>()),
    );
    gh.factory<_i1051.GetQuizAttemptByIdUseCase>(
      () => _i1051.GetQuizAttemptByIdUseCase(gh<_i741.QuizRepository>()),
    );
    gh.factory<_i20.GetQuizAttemptsUseCase>(
      () => _i20.GetQuizAttemptsUseCase(gh<_i741.QuizRepository>()),
    );
    gh.factory<_i924.GetVideoQuizUseCase>(
      () => _i924.GetVideoQuizUseCase(gh<_i741.QuizRepository>()),
    );
    gh.factory<_i615.SubmitQuizAnswerUseCase>(
      () => _i615.SubmitQuizAnswerUseCase(gh<_i741.QuizRepository>()),
    );
    gh.lazySingleton<_i530.ActivityRemoteDataSource>(
      () => _i404.ActivityRemoteDataSourceImpl(gh<_i75.ActivityApiClient>()),
    );
    gh.lazySingleton<_i591.EntitlementsRemoteDataSource>(
      () => _i999.EntitlementsRemoteDataSourceImpl(
        gh<_i681.EntitlementsApiClient>(),
      ),
    );
    gh.factory<_i258.GetAppDataUseCase>(
      () => _i258.GetAppDataUseCase(gh<_i426.AppDataRepository>()),
    );
    gh.lazySingleton<_i720.AuthRemoteDataSource>(
      () => _i902.AuthRemoteDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i1005.AuthApiClient>(),
      ),
    );
    gh.lazySingleton<_i497.TeachersRepository>(
      () => _i284.TeachersRepositoryImpl(
        gh<_i44.TeachersRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.factory<_i24.AddVideoFavoriteUseCase>(
      () => _i24.AddVideoFavoriteUseCase(gh<_i169.VideosRepository>()),
    );
    gh.factory<_i357.GetFavoriteVideosUseCase>(
      () => _i357.GetFavoriteVideosUseCase(gh<_i169.VideosRepository>()),
    );
    gh.factory<_i525.GetVideoFavoriteUseCase>(
      () => _i525.GetVideoFavoriteUseCase(gh<_i169.VideosRepository>()),
    );
    gh.factory<_i724.GetVideosByCategoriesUseCase>(
      () => _i724.GetVideosByCategoriesUseCase(gh<_i169.VideosRepository>()),
    );
    gh.factory<_i178.GetVideosByCategoryUseCase>(
      () => _i178.GetVideosByCategoryUseCase(gh<_i169.VideosRepository>()),
    );
    gh.factory<_i348.GetVideosBySerieUseCase>(
      () => _i348.GetVideosBySerieUseCase(gh<_i169.VideosRepository>()),
    );
    gh.factory<_i17.RemoveVideoFavoriteUseCase>(
      () => _i17.RemoveVideoFavoriteUseCase(gh<_i169.VideosRepository>()),
    );
    gh.lazySingleton<_i665.SeriesRepository>(
      () => _i1070.SeriesRepositoryImpl(
        gh<_i683.SeriesRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.factory<_i244.GetSerieByIdUseCase>(
      () => _i244.GetSerieByIdUseCase(gh<_i665.SeriesRepository>()),
    );
    gh.factory<_i812.GetSeriesByCategoriesUseCase>(
      () => _i812.GetSeriesByCategoriesUseCase(gh<_i665.SeriesRepository>()),
    );
    gh.factory<_i985.GetSeriesByCategoryUseCase>(
      () => _i985.GetSeriesByCategoryUseCase(gh<_i665.SeriesRepository>()),
    );
    gh.factory<_i504.GetSeriesUseCase>(
      () => _i504.GetSeriesUseCase(gh<_i665.SeriesRepository>()),
    );
    gh.factory<_i333.GetPlaybackUseCase>(
      () => _i333.GetPlaybackUseCase(gh<_i419.PlaybackRepository>()),
    );
    gh.factory<_i133.HomeVideoFavoritesBloc>(
      () => _i133.HomeVideoFavoritesBloc(
        gh<_i357.GetFavoriteVideosUseCase>(),
        gh<_i17.RemoveVideoFavoriteUseCase>(),
      ),
    );
    gh.lazySingleton<_i826.ActivityRepository>(
      () => _i700.ActivityRepositoryImpl(
        gh<_i530.ActivityRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.factoryParam<_i908.QuizAttemptDetailBloc, int, dynamic>(
      (attemptId, _) => _i908.QuizAttemptDetailBloc(
        gh<_i1051.GetQuizAttemptByIdUseCase>(),
        attemptId,
      ),
    );
    gh.factory<_i994.UserYogaSalaPlusRepository>(
      () => _i227.UserYogaSalaPlusRepositoryImpl(
        gh<_i662.UserYogaSalaPlusRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.factory<_i370.GetUserActivityStreakUseCase>(
      () => _i370.GetUserActivityStreakUseCase(gh<_i826.ActivityRepository>()),
    );
    gh.factory<_i1031.GetUserActivityUseCase>(
      () => _i1031.GetUserActivityUseCase(gh<_i826.ActivityRepository>()),
    );
    gh.factory<_i413.MarkUserActivityUseCase>(
      () => _i413.MarkUserActivityUseCase(gh<_i826.ActivityRepository>()),
    );
    gh.factory<_i909.GetLeaderboardUseCase>(
      () => _i909.GetLeaderboardUseCase(gh<_i183.PointsRepository>()),
    );
    gh.factory<_i447.GetUserPointsUseCase>(
      () => _i447.GetUserPointsUseCase(gh<_i183.PointsRepository>()),
    );
    gh.factory<_i738.GetTeacherByIdUseCase>(
      () => _i738.GetTeacherByIdUseCase(gh<_i497.TeachersRepository>()),
    );
    gh.factory<_i680.GetTeacherSeriesUseCase>(
      () => _i680.GetTeacherSeriesUseCase(gh<_i497.TeachersRepository>()),
    );
    gh.factory<_i249.GetTeachersUseCase>(
      () => _i249.GetTeachersUseCase(gh<_i497.TeachersRepository>()),
    );
    gh.factory<_i7.GetCategoriesListEnabledUseCase>(
      () => _i7.GetCategoriesListEnabledUseCase(
        gh<_i1058.CategoriesRepository>(),
      ),
    );
    gh.factory<_i890.GetUserYogaSalaPlusMobileUserUseCase>(
      () => _i890.GetUserYogaSalaPlusMobileUserUseCase(
        gh<_i994.UserYogaSalaPlusRepository>(),
      ),
    );
    gh.factory<_i758.SyncUserTimeZoneUseCase>(
      () =>
          _i758.SyncUserTimeZoneUseCase(gh<_i994.UserYogaSalaPlusRepository>()),
    );
    gh.factory<_i344.UpdateUserYogaSalaPlusMobileUserUseCase>(
      () => _i344.UpdateUserYogaSalaPlusMobileUserUseCase(
        gh<_i994.UserYogaSalaPlusRepository>(),
      ),
    );
    gh.lazySingleton<_i513.EntitlementsRepository>(
      () => _i149.EntitlementsRepositoryImpl(
        gh<_i591.EntitlementsRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.factory<_i824.HomeBloc>(
      () => _i824.HomeBloc(
        gh<_i7.GetCategoriesListEnabledUseCase>(),
        gh<_i985.GetSeriesByCategoryUseCase>(),
        gh<_i249.GetTeachersUseCase>(),
      ),
    );
    gh.factoryParam<_i285.VideoBloc, int, int>(
      (videoId, serieId) => _i285.VideoBloc(
        gh<_i244.GetSerieByIdUseCase>(),
        gh<_i348.GetVideosBySerieUseCase>(),
        gh<_i738.GetTeacherByIdUseCase>(),
        gh<_i525.GetVideoFavoriteUseCase>(),
        gh<_i24.AddVideoFavoriteUseCase>(),
        gh<_i17.RemoveVideoFavoriteUseCase>(),
        gh<_i924.GetVideoQuizUseCase>(),
        videoId,
        serieId,
      ),
    );
    gh.factory<_i628.CalendarBloc>(
      () => _i628.CalendarBloc(
        gh<_i1031.GetUserActivityUseCase>(),
        gh<_i370.GetUserActivityStreakUseCase>(),
      ),
    );
    gh.factoryParam<_i595.SerieBloc, int, dynamic>(
      (serieId, _) => _i595.SerieBloc(
        gh<_i244.GetSerieByIdUseCase>(),
        gh<_i348.GetVideosBySerieUseCase>(),
        gh<_i738.GetTeacherByIdUseCase>(),
        serieId,
      ),
    );
    gh.factory<_i689.QuizAttemptsBloc>(
      () => _i689.QuizAttemptsBloc(gh<_i20.GetQuizAttemptsUseCase>()),
    );
    gh.lazySingleton<_i869.AuthRepository>(
      () => _i570.AuthRepositoryImpl(
        gh<_i720.AuthRemoteDataSource>(),
        gh<_i109.AuthLocalDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.factoryParam<_i831.TeacherBloc, int, dynamic>(
      (teacherId, _) => _i831.TeacherBloc(
        gh<_i738.GetTeacherByIdUseCase>(),
        gh<_i680.GetTeacherSeriesUseCase>(),
        teacherId,
      ),
    );
    gh.lazySingleton<_i171.PointsBloc>(
      () => _i171.PointsBloc(gh<_i447.GetUserPointsUseCase>()),
    );
    gh.factory<_i277.HomeSeriesBloc>(
      () => _i277.HomeSeriesBloc(gh<_i504.GetSeriesUseCase>()),
    );
    gh.factory<_i1037.CompleteUserYogaSalaPlusUseCase>(
      () => _i1037.CompleteUserYogaSalaPlusUseCase(
        gh<_i994.UserYogaSalaPlusRepository>(),
      ),
    );
    gh.factory<_i514.GetOrCreateUserYogaSalaPlusUseCase>(
      () => _i514.GetOrCreateUserYogaSalaPlusUseCase(
        gh<_i994.UserYogaSalaPlusRepository>(),
      ),
    );
    gh.factory<_i239.LeaderboardBloc>(
      () => _i239.LeaderboardBloc(
        gh<_i909.GetLeaderboardUseCase>(),
        gh<_i42.LocalStorage>(instanceName: 'shared_prefs'),
      ),
    );
    gh.factory<_i364.ProfileInfoBloc>(
      () => _i364.ProfileInfoBloc(
        gh<_i1071.UploadProfileImageUseCase>(),
        gh<_i344.UpdateUserYogaSalaPlusMobileUserUseCase>(),
      ),
    );
    gh.factoryParam<_i942.QuizBloc, int, dynamic>(
      (videoId, _) => _i942.QuizBloc(
        gh<_i924.GetVideoQuizUseCase>(),
        gh<_i615.SubmitQuizAnswerUseCase>(),
        gh<_i447.GetUserPointsUseCase>(),
        videoId,
      ),
    );
    gh.factory<_i732.OnboardingAgreementsBloc>(
      () => _i732.OnboardingAgreementsBloc(
        gh<_i1037.CompleteUserYogaSalaPlusUseCase>(),
        gh<_i258.GetAppDataUseCase>(),
      ),
    );
    gh.factory<_i1062.CheckAuthStatusUseCase>(
      () => _i1062.CheckAuthStatusUseCase(gh<_i869.AuthRepository>()),
    );
    gh.factory<_i573.LogoutUseCase>(
      () => _i573.LogoutUseCase(gh<_i869.AuthRepository>()),
    );
    gh.factory<_i498.LoginUseCase>(
      () => _i498.LoginUseCase(gh<_i869.AuthRepository>()),
    );
    gh.factory<_i906.ResetPasswordUseCase>(
      () => _i906.ResetPasswordUseCase(gh<_i869.AuthRepository>()),
    );
    gh.factory<_i500.SignUpUseCase>(
      () => _i500.SignUpUseCase(gh<_i869.AuthRepository>()),
    );
    gh.factory<_i759.HomeTeachersBloc>(
      () => _i759.HomeTeachersBloc(gh<_i249.GetTeachersUseCase>()),
    );
    gh.factory<_i421.GetUserEntitlementsUseCase>(
      () =>
          _i421.GetUserEntitlementsUseCase(gh<_i513.EntitlementsRepository>()),
    );
    gh.factory<_i571.ProfileBloc>(
      () => _i571.ProfileBloc(
        gh<_i890.GetUserYogaSalaPlusMobileUserUseCase>(),
        gh<_i42.LocalStorage>(instanceName: 'shared_prefs'),
      ),
    );
    gh.lazySingleton<_i760.EntitlementsBloc>(
      () => _i760.EntitlementsBloc(gh<_i421.GetUserEntitlementsUseCase>()),
    );
    gh.factoryParam<_i71.VideoPlayerBloc, int, int?>(
      (videoId, serieId) => _i71.VideoPlayerBloc(
        gh<_i333.GetPlaybackUseCase>(),
        gh<_i413.MarkUserActivityUseCase>(),
        gh<_i171.PointsBloc>(),
        gh<_i194.LoggerService>(),
        videoId,
        serieId,
      ),
    );
    gh.factory<_i569.PaywallBloc>(
      () => _i569.PaywallBloc(
        gh<_i978.GetSubscriptionPackagesUseCase>(),
        gh<_i257.PurchaseSubscriptionUseCase>(),
        gh<_i261.RestorePurchasesUseCase>(),
        gh<_i760.EntitlementsBloc>(),
      ),
    );
    gh.factory<_i165.LiveSessionsBloc>(
      () => _i165.LiveSessionsBloc(
        gh<_i696.GetLiveSessionsUseCase>(),
        gh<_i634.JoinLiveSessionUseCase>(),
        gh<_i760.EntitlementsBloc>(),
      ),
    );
    gh.lazySingleton<_i60.AuthBloc>(
      () => _i60.AuthBloc(
        gh<_i498.LoginUseCase>(),
        gh<_i500.SignUpUseCase>(),
        gh<_i906.ResetPasswordUseCase>(),
        gh<_i573.LogoutUseCase>(),
        gh<_i1062.CheckAuthStatusUseCase>(),
        gh<_i214.LogOutPurchasesUseCase>(),
        gh<_i760.EntitlementsBloc>(),
        gh<_i194.LoggerService>(),
      ),
    );
    gh.factory<_i502.AppDirectorBloc>(
      () => _i502.AppDirectorBloc(
        gh<_i194.LoggerService>(),
        gh<_i60.AuthBloc>(),
        gh<_i258.GetAppDataUseCase>(),
        gh<_i514.GetOrCreateUserYogaSalaPlusUseCase>(),
        gh<_i758.SyncUserTimeZoneUseCase>(),
        gh<_i611.LogInPurchasesUseCase>(),
        gh<_i760.EntitlementsBloc>(),
        gh<_i42.LocalStorage>(instanceName: 'shared_prefs'),
      ),
    );
    return this;
  }
}

class _$StorageModule extends _i150.StorageModule {}

class _$LoggerModule extends _i205.LoggerModule {}

class _$FirebaseModule extends _i398.FirebaseModule {}

class _$NetworkModule extends _i851.NetworkModule {}

class _$CoreModule extends _i134.CoreModule {}
