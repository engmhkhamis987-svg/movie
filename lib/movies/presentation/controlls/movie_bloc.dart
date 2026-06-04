import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_app/movies/presentation/controlls/movie_event.dart';
import 'package:movie_app/movies/presentation/controlls/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  MovieBloc(this.getNowPlayingMovieUsecase) : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {
      final result = await getNowPlayingMovieUsecase.execute();
      print(result);
      result.fold(
        (l) => emit(
          MovieState(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          ),
        ),
        (r) => emit(
          MovieState(nowPlayingState: RequestState.loaded, nowPayingMovies: r),
        ),
      );
    });
  }
}
