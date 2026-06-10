import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecases/base_usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movie_app/movies/presentation/controlls/movie_event.dart';
import 'package:movie_app/movies/presentation/controlls/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  final GetPopularMovieUsecase getPopularMovieUsecase;
  final GetTopRatedMovieUsecase getTopRatedMovieUsecase;
  MovieBloc(
    this.getNowPlayingMovieUsecase,
    this.getPopularMovieUsecase,
    this.getTopRatedMovieUsecase,
  ) : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>(_getNowPlayingMovie);

    on<GetPopularMovieEvent>(_getPopularMovie);

    on<GetTopRatedMovieEvent>(_getTopRatedMovie);
  }

  FutureOr<void> _getNowPlayingMovie(
    GetNowPlayingMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    final result = await getNowPlayingMovieUsecase(NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPayingMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovie(
    GetPopularMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    final result = await getPopularMovieUsecase(NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(popularState: RequestState.loaded, popularMovies: r),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovie(
    GetTopRatedMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    final result = await getTopRatedMovieUsecase(NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(topRatedState: RequestState.loaded, topRatedMovies: r),
      ),
    );
  }
}
