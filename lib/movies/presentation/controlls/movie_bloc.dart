import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_app/movies/presentation/controlls/movie_event.dart';
import 'package:movie_app/movies/presentation/controlls/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieState()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMovieRepository baseMovieRepository = MovieRepository(
        baseMovieRemoteDataSource,
      );

      final result = await GetNowPlayingMovieUsecase(
        baseMovieRepository: baseMovieRepository,
      ).execute();
    });
  }
}
