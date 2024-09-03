part of 'movie_cubit.dart';

abstract class MovieState {}

class MovieInit extends MovieState {}

class MovieError extends MovieState {
  final Failure failure;

  MovieError({required this.failure});
}

class MovieLoading extends MovieState {}

class LoadMoreMovies extends MovieState {}
