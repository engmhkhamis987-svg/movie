import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movie_usecase.dart';

class MovieProvider extends ChangeNotifier {
  RequestState nowPlayingState = RequestState.loading;
  List<Movie> nowPayingMovies = [];
  String nowPlayingMessage = '';

  RequestState popularState = RequestState.loading;
  List<Movie> popularMovies = [];
  String popularMessage = '';

  RequestState topRatedState = RequestState.loading;
  List<Movie> topRatedMovies = [];
  String topRatedMessage = '';

  final GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  final GetPopularMovieUsecase getPopularMoviesUseCase;
  final GetTopRatedMovieUsecase getTopRatedMoviesUseCase;
  MovieProvider(
    this.getNowPlayingMovieUsecase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  );

  void init() {
    getNowPlayingMovies();
    getPopularMovies();
    getTopRatedMovies();
  }

  Future<void> getNowPlayingMovies() async {
    final result = await getNowPlayingMovieUsecase();
    result.fold(
      (l) => {
        nowPlayingState = RequestState.error,
        nowPlayingMessage = l.message,
        notifyListeners(),
      },
      (r) => {
        nowPlayingState = RequestState.loaded,
        nowPayingMovies = r,
        notifyListeners(),
      },
    );
  }

  Future<void> getPopularMovies() async {
    final result = await getPopularMoviesUseCase();
    result.fold(
      (l) => {
        popularState = RequestState.error,
        popularMessage = l.message,
        notifyListeners(),
      },
      (r) => {
        popularState = RequestState.loaded,
        popularMovies = r,
        notifyListeners(),
      },
    );
  }

  Future<void> getTopRatedMovies() async {
    final result = await getTopRatedMoviesUseCase();
    result.fold(
      (l) => {
        topRatedState = RequestState.error,
        topRatedMessage = l.message,
        notifyListeners(),
      },
      (r) => {
        topRatedState = RequestState.loaded,
        topRatedMovies = r,
        notifyListeners(),
      },
    );
  }
}
