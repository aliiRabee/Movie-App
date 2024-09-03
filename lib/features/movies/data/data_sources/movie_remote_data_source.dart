import 'package:movie_app/core/api_manager/api_manager.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';

import '../../../../core/errors/exceptions.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final APIManager apiManager;

  MovieRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await apiManager.getData(url: "movie/popular");
    if (apiManager.response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
