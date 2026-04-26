import 'package:get_it/get_it.dart';

import '../data/datasources/auth_remote_datasource.dart';
import '../presentation/blocs/splash/splash_bloc.dart';
import '../presentation/blocs/auth/auth_bloc.dart';

final sl = GetIt.instance;

void init() {
  // 🔹 Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSource(),
  );

  // // 🔹 Blocs
  // sl.registerFactory<SplashBloc>(
  //       () => SplashBloc(sl<AuthRemoteDataSource>()),
  // );
  //
  // sl.registerFactory<AuthBloc>(
  //       () => AuthBloc(sl<AuthRemoteDataSource>()),
  // );
}