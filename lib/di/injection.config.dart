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
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/navigation/app_router.dart' as _i159;
import '../core/theme/theme_bloc.dart' as _i905;
import '../errors/app_error_reporter.dart' as _i589;
import '../features/app/app_config.dart' as _i1025;
import '../features/app/data/api/app_data_api_client.dart' as _i978;
import '../features/app/data/datasources/app_data_remote_data_source.dart'
    as _i763;
import '../features/app/data/datasources/app_data_remote_data_source_impl.dart'
    as _i148;
import '../features/app/data/repositories/app_data_repository_impl.dart'
    as _i305;
import '../features/app/domain/repositories/app_data_repository.dart' as _i426;
import '../features/app/domain/usecases/get_app_data_use_case.dart' as _i254;
import '../features/app/presentation/bloc/app_bloc.dart' as _i896;
import '../features/app_director/domain/usecases/get_or_create_user_yoga_sala_plus_open_mobile_use_case.dart'
    as _i501;
import '../features/app_director/presentation/bloc/app_director_bloc.dart'
    as _i502;
import '../features/auth/data/datasources/auth_local_data_source.dart' as _i109;
import '../features/auth/data/datasources/auth_local_data_source_impl.dart'
    as _i889;
import '../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i719;
import '../features/auth/data/datasources/auth_remote_data_source_impl.dart'
    as _i902;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i570;
import '../features/auth/domain/repositories/auth_repository.dart' as _i869;
import '../features/auth/domain/usecases/check_auth_status_usecase.dart'
    as _i403;
import '../features/auth/domain/usecases/login_usecase.dart' as _i406;
import '../features/auth/domain/usecases/logout_usecase.dart' as _i11;
import '../features/auth/domain/usecases/reset_password_use_case.dart' as _i304;
import '../features/auth/domain/usecases/sign_up_use_case.dart' as _i874;
import '../features/auth/presentation/bloc/auth_bloc.dart' as _i60;
import '../features/home/data/api/videos_api_client.dart' as _i561;
import '../features/home/data/datasources/videos_remote_data_source.dart'
    as _i311;
import '../features/home/data/datasources/videos_remote_data_source_impl.dart'
    as _i995;
import '../features/home/data/repositories/videos_repository_impl.dart'
    as _i943;
import '../features/home/domain/repositories/videos_repository.dart' as _i629;
import '../features/home/domain/usecases/get_videos_category_list_enabled_use_case.dart'
    as _i948;
import '../features/home/domain/usecases/get_videos_list_enabled_by_category_ids_use_case.dart'
    as _i375;
import '../features/home/presentation/bloc/home_bloc.dart' as _i824;
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
import '../features/posts/data/api/posts_api_client.dart' as _i347;
import '../features/posts/data/datasources/posts_remote_data_source.dart'
    as _i414;
import '../features/posts/data/datasources/posts_remote_data_source_impl.dart'
    as _i510;
import '../features/posts/data/repositories/posts_repository_impl.dart'
    as _i799;
import '../features/posts/domain/repositories/posts_repository.dart' as _i57;
import '../features/posts/domain/usecases/get_post_usecase.dart' as _i226;
import '../features/posts/domain/usecases/get_posts_usecase.dart' as _i717;
import '../features/posts/presentation/bloc/posts_bloc.dart' as _i71;
import '../features/profile/data/api/user_yoga_sala_plus_api_client.dart'
    as _i369;
import '../features/profile/data/datasources/user_yoga_sala_plus_remote_data_source.dart'
    as _i662;
import '../features/profile/data/datasources/user_yoga_sala_plus_remote_data_source_impl.dart'
    as _i777;
import '../features/profile/data/repositories/user_yoga_sala_plus_repository_impl.dart'
    as _i227;
import '../features/profile/domain/repositories/user_yoga_sala_plus_repository.dart'
    as _i993;
import '../features/profile/domain/usecases/complete_user_yoga_sala_plus_use_case.dart'
    as _i701;
import '../features/reset_password/presentation/bloc/reset_password_bloc.dart'
    as _i314;
import '../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i418;
import 'modules/core_module.dart' as _i134;
import 'modules/firebase_module.dart' as _i398;
import 'modules/logger_module.dart' as _i205;
import 'modules/network_module.dart' as _i851;
import 'modules/storage_module.dart' as _i149;

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
    gh.factory<_i532.OnboardingProfilePhotoBloc>(
      () => _i532.OnboardingProfilePhotoBloc(),
    );
    gh.factory<_i314.ResetPasswordBloc>(() => _i314.ResetPasswordBloc());
    gh.factory<_i418.SignUpBloc>(() => _i418.SignUpBloc());
    gh.singleton<_i159.AppRouter>(() => _i159.AppRouter());
    gh.singleton<_i194.LoggerConfig>(() => loggerModule.loggerConfig());
    gh.singleton<_i558.FlutterSecureStorage>(
      () => storageModule.flutterSecureStorage,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
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
    gh.lazySingleton<_i719.AuthRemoteDataSource>(
      () => _i902.AuthRemoteDataSourceImpl(gh<_i59.FirebaseAuth>()),
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
    gh.lazySingleton<_i905.ThemeBloc>(
      () => _i905.ThemeBloc(
        gh<_i42.LocalStorage>(instanceName: 'hive_storage'),
        gh<_i194.LoggerService>(),
      ),
    );
    gh.lazySingleton<_i496.DioClient>(
      () => networkModule.dioClient(
        gh<_i496.NetworkClientConfig>(),
        gh<_i194.LoggerService>(),
        gh<_i496.DeviceNetworkInfo>(),
        gh<_i42.LocalStorage>(instanceName: 'secure_storage'),
        gh<_i496.NetworkCacheStore>(),
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
    gh.lazySingleton<_i869.AuthRepository>(
      () => _i570.AuthRepositoryImpl(
        gh<_i719.AuthRemoteDataSource>(),
        gh<_i109.AuthLocalDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i978.AppDataApiClient>(
      () => _i978.AppDataApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i561.VideosApiClient>(
      () => _i561.VideosApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i347.PostsApiClient>(
      () => _i347.PostsApiClient(gh<_i496.DioClient>()),
    );
    gh.lazySingleton<_i369.UserYogaSalaPlusApiClient>(
      () => _i369.UserYogaSalaPlusApiClient(gh<_i496.DioClient>()),
    );
    gh.factory<_i403.CheckAuthStatusUseCase>(
      () => _i403.CheckAuthStatusUseCase(gh<_i869.AuthRepository>()),
    );
    gh.factory<_i11.LogoutUseCase>(
      () => _i11.LogoutUseCase(gh<_i869.AuthRepository>()),
    );
    gh.factory<_i763.AppDataRemoteDataSource>(
      () => _i148.AppDataRemoteDataSourceImpl(
        gh<_i194.LoggerService>(),
        gh<_i978.AppDataApiClient>(),
      ),
    );
    gh.factory<_i406.LoginUseCase>(
      () => _i406.LoginUseCase(gh<_i869.AuthRepository>()),
    );
    gh.factory<_i304.ResetPasswordUseCase>(
      () => _i304.ResetPasswordUseCase(gh<_i869.AuthRepository>()),
    );
    gh.factory<_i874.SignUpUseCase>(
      () => _i874.SignUpUseCase(gh<_i869.AuthRepository>()),
    );
    gh.factory<_i662.UserYogaSalaPlusRemoteDataSource>(
      () => _i777.UserYogaSalaPlusRemoteDataSourceImpl(
        gh<_i194.LoggerService>(),
        gh<_i369.UserYogaSalaPlusApiClient>(),
      ),
    );
    gh.lazySingleton<_i60.AuthBloc>(
      () => _i60.AuthBloc(
        gh<_i406.LoginUseCase>(),
        gh<_i874.SignUpUseCase>(),
        gh<_i304.ResetPasswordUseCase>(),
        gh<_i11.LogoutUseCase>(),
        gh<_i403.CheckAuthStatusUseCase>(),
        gh<_i194.LoggerService>(),
      ),
    );
    gh.factory<_i426.AppDataRepository>(
      () => _i305.AppDataRepositoryImpl(
        gh<_i763.AppDataRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i414.PostsRemoteDataSource>(
      () => _i510.PostsRemoteDataSourceImpl(gh<_i347.PostsApiClient>()),
    );
    gh.factory<_i254.GetAppDataUseCase>(
      () => _i254.GetAppDataUseCase(gh<_i426.AppDataRepository>()),
    );
    gh.lazySingleton<_i311.VideosRemoteDataSource>(
      () => _i995.VideosRemoteDataSourceImpl(gh<_i561.VideosApiClient>()),
    );
    gh.lazySingleton<_i629.VideosRepository>(
      () => _i943.VideosRepositoryImpl(
        gh<_i311.VideosRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.lazySingleton<_i57.PostsRepository>(
      () => _i799.PostsRepositoryImpl(
        gh<_i414.PostsRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.factory<_i993.UserYogaSalaPlusRepository>(
      () => _i227.UserYogaSalaPlusRepositoryImpl(
        gh<_i662.UserYogaSalaPlusRemoteDataSource>(),
        gh<_i89.ErrorHandler>(),
      ),
    );
    gh.factory<_i948.GetVideosCategoryListEnabledUseCase>(
      () => _i948.GetVideosCategoryListEnabledUseCase(
        gh<_i629.VideosRepository>(),
      ),
    );
    gh.factory<_i375.GetVideosListEnabledByCategoryIdsUseCase>(
      () => _i375.GetVideosListEnabledByCategoryIdsUseCase(
        gh<_i629.VideosRepository>(),
      ),
    );
    gh.factory<_i717.GetPostsUseCase>(
      () => _i717.GetPostsUseCase(gh<_i57.PostsRepository>()),
    );
    gh.factory<_i824.HomeBloc>(
      () => _i824.HomeBloc(
        gh<_i948.GetVideosCategoryListEnabledUseCase>(),
        gh<_i375.GetVideosListEnabledByCategoryIdsUseCase>(),
      ),
    );
    gh.factory<_i226.GetPostUseCase>(
      () => _i226.GetPostUseCase(gh<_i57.PostsRepository>()),
    );
    gh.factory<_i501.GetOrCreateUserYogaSalaPlusOpenMobileUseCase>(
      () => _i501.GetOrCreateUserYogaSalaPlusOpenMobileUseCase(
        gh<_i993.UserYogaSalaPlusRepository>(),
      ),
    );
    gh.factory<_i701.CompleteUserYogaSalaPlusUseCase>(
      () => _i701.CompleteUserYogaSalaPlusUseCase(
        gh<_i993.UserYogaSalaPlusRepository>(),
      ),
    );
    gh.factory<_i502.AppDirectorBloc>(
      () => _i502.AppDirectorBloc(
        gh<_i194.LoggerService>(),
        gh<_i60.AuthBloc>(),
        gh<_i254.GetAppDataUseCase>(),
        gh<_i501.GetOrCreateUserYogaSalaPlusOpenMobileUseCase>(),
        gh<_i42.LocalStorage>(instanceName: 'shared_prefs'),
      ),
    );
    gh.factory<_i71.PostsBloc>(
      () => _i71.PostsBloc(
        gh<_i226.GetPostUseCase>(),
        gh<_i717.GetPostsUseCase>(),
      ),
    );
    gh.factory<_i732.OnboardingAgreementsBloc>(
      () => _i732.OnboardingAgreementsBloc(
        gh<_i701.CompleteUserYogaSalaPlusUseCase>(),
        gh<_i254.GetAppDataUseCase>(),
      ),
    );
    return this;
  }
}

class _$StorageModule extends _i149.StorageModule {}

class _$LoggerModule extends _i205.LoggerModule {}

class _$FirebaseModule extends _i398.FirebaseModule {}

class _$NetworkModule extends _i851.NetworkModule {}

class _$CoreModule extends _i134.CoreModule {}
