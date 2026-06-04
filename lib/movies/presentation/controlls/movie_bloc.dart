import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<GetNowPlayingMovieEvent>((event, emit) async {
      final result = await getNowPlayingMovieUsecase.execute();
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
    });

    on<GetPopularMovieEvent>((event, emit) async {
      final result = await getPopularMovieUsecase.execute();
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
    });

    on<GetTopRatedMovieEvent>((event, emit) async {
      final result = await getTopRatedMovieUsecase.execute();
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
    });
  }
}
