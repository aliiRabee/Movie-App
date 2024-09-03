import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/features/movies/data/repositories_impl/movie_repository_impl.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_app/features/movies/domain/use_cases/get_popular_movies.dart';

Future<void> initializeMovieInjection() async {
  final i = GetIt.I;

  i.registerLazySingleton<MovieRemoteDataSource>(() {
    return MovieRemoteDataSourceImpl(
      apiManager: i(),
    );
  });

  i.registerLazySingleton<MovieRepository>(() {
    return MovieRepositoryImpl(
      remoteDataSource: i(),
    );
  });

  i.registerLazySingleton<GetPopularMovies>(() {
    return GetPopularMovies(
      repository: i(),
    );
  });
}
