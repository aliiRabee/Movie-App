import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';

import '../../../../core/errors/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies();
}
