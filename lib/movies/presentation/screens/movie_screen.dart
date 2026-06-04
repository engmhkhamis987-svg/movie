import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/movies/presentation/controlls/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controlls/movie_event.dart';
import 'package:movie_app/movies/presentation/controlls/movie_state.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(sl())..add(GetNowPlayingMovieEvent()),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Movie Screen')),
            body: const Center(child: Text('Movie Screen')),
          );
        },
      ),
    );
  }
}
