import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:wisata_ticketing/core/service/shared_preferences_service.dart';
import 'package:wisata_ticketing/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:wisata_ticketing/features/authentication/data/datasources/auth_local_datasource_impl.dart';
import 'package:wisata_ticketing/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:wisata_ticketing/features/authentication/data/datasources/auth_remote_datasource_impl.dart';
import 'package:wisata_ticketing/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:wisata_ticketing/features/authentication/domain/repositories/auth_repository.dart';
import 'package:wisata_ticketing/features/authentication/domain/usecases/get_user.dart';
import 'package:wisata_ticketing/features/authentication/domain/usecases/login.dart';
import 'package:wisata_ticketing/features/authentication/domain/usecases/logout.dart';
import 'package:wisata_ticketing/features/authentication/presentation/cubit/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
  // App Logic
  ..registerFactory(() => AuthCubit(
      login: sl(),
      getUser: sl(),
      logout: sl()
  ))

  // Use Cases
  ..registerLazySingleton(() => Login(sl()))
  ..registerLazySingleton(() => GetUser(sl()))
  ..registerLazySingleton(() => Logout(sl()))

  // Repositories
  ..registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(sl(), sl())
  )

  // Data Sources
  ..registerLazySingleton<AuthRemoteDatasource>(() =>
      AuthRemoteDatasourceImpl(sl(), sl())
  )
  ..registerLazySingleton<AuthLocalDatasource>(() =>
      AuthLocalDatasourceImpl(sl())
  )

  // Helpers
  ..registerLazySingleton<SharedPreferencesService>(() =>
      SharedPreferencesService()
  )

  // External Dependencies
  ..registerLazySingleton(http.Client.new);
}