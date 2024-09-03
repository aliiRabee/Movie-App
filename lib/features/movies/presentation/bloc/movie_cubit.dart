import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/use_cases/get_popular_movies.dart';

import '../../../../core/errors/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInit());

  static MovieCubit of(context) => BlocProvider.of(context);

  final _getIt = GetIt.I;
  int currentPage = 0;
  List<Movie> movies = [];

  Future<void> getMoviesList() async {
    emit(MovieLoading());
    currentPage = 1;
    final result = await _getIt<GetPopularMovies>()();
    result.fold(
      (l) => emit(MovieError(failure: l)),
      (r) {
        movies = r;
        emit(MovieInit());
      },
    );
  }
}
