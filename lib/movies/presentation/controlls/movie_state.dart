import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieState extends Equatable {
  final RequestState nowPlayingState;
  final List<Movie> nowPayingMovies;
  final String message;

  const MovieState({
    this.nowPlayingState = RequestState.loading,
    this.nowPayingMovies = const [],
    this.message = '',
  });

  @override
  List<Object?> get props => [nowPlayingState, nowPayingMovies, message];
}
