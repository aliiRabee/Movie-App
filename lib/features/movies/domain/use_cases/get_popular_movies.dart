import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/errors/failure.dart';

class GetPopularMovies {
  GetPopularMovies({required this.repository});

  final MovieRepository repository;

  Future<Either<Failure, List<Movie>>> call() {
    return repository.getPopularMovies();
  }
}
