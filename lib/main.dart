import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/movie_cubit.dart';
import 'package:movie_app/features/movies/presentation/pages/movies_page.dart';
import 'core/injection/common_injection.dart' as common;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    common.commonInjections.allowReassignment = true;
    common.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCubit>(create: (movieContext) => MovieCubit()),
      ],
      child: const MaterialApp(
        home: MoviesPage(),
        title: "Movie App",
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
