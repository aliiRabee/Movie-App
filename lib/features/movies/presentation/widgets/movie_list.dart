import 'package:flutter/cupertino.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_cubit.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_card.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.movieCubit});

  final MovieCubit movieCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.extentAfter == 0) {
                //categoriesCubit.getMoreCategories();
              }
              return false;
            },
            child: GridView.builder(
              itemCount: movieCubit.movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return MovieCard(movie: movieCubit.movies[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
