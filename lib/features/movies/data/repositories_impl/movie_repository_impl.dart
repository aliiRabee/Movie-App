import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/injection/common_injection.dart';
import '../../../../core/network/network_info.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    if (await commonInjections.get<NetworkInfo>().isConnected) {
      try {
        final response = await remoteDataSource.getPopularMovies();

        return right(response);
      } on ServerException {
        return left(const ServerFailure());
      }
    } else {
      return left(const ServerFailure());
    }
  }
}
