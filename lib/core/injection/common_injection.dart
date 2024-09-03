import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app/core/api_manager/api_manager.dart';

import '../../features/movies/injection.dart';
import '../network/network_info.dart';

final commonInjections = GetIt.instance;

Future<void> init() async {
  //! Core

  commonInjections.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: commonInjections()));
  commonInjections.registerLazySingleton(() => APIManager());

  //! External

  commonInjections.registerLazySingleton(() => Dio());
  commonInjections.registerLazySingleton(() => InternetConnectionChecker());

  //! Features
  initializeMovieInjection();
}
