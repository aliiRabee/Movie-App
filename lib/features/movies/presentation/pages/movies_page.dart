import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_list.dart';

import '../bloc/movie_cubit.dart';
import '../widgets/loading_view.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MovieCubit.of(context)..getMoviesList();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie'),
        ),
        body: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (state is MovieLoading) {
                return const AppLoading();
              } else if (state is MovieError) {
                return Text(state.failure.toString());
              } else if (cubit.movies.isEmpty) {
                return const Center(child: Text("No Movies!"));
              }
              return MovieList(
                movieCubit: cubit,
              );
            }));
  }
}
