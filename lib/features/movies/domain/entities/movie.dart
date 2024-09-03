import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final bool isForAdult;
  final bool hasVideo;
  final String title;
  final String originalTitle;
  final String originalLanguage;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final List<dynamic> genreIds;

  const Movie({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.genreIds,
    required this.isForAdult,
    required this.hasVideo,
    required this.originalLanguage,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        originalTitle,
        overview,
        posterPath,
        backdropPath,
        releaseDate,
        voteAverage,
        voteCount,
        popularity,
        genreIds,
        isForAdult,
        hasVideo,
        originalLanguage,
      ];
}
