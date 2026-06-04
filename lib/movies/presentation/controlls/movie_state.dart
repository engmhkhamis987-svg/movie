import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieState extends Equatable {
  final RequestState nowPlayingState;
  final List<Movie> nowPayingMovies;
  final String nowPlayingMessage;

  final RequestState popularState;
  final List<Movie> popularMovies;
  final String popularMessage;

  final RequestState topRatedState;
  final List<Movie> topRatedMovies;
  final String topRatedMessage;

  const MovieState({
    this.nowPlayingState = RequestState.loading,
    this.nowPayingMovies = const [],
    this.nowPlayingMessage = '',

    this.popularState = RequestState.loading,
    this.popularMovies = const [],
    this.popularMessage = '',

    this.topRatedState = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedMessage = '',
  });

  MovieState copyWith({
    RequestState? nowPlayingState,
    List<Movie>? nowPayingMovies,
    String? nowPlayingMessage,
    RequestState? popularState,
    List<Movie>? popularMovies,
    String? popularMessage,
    RequestState? topRatedState,
    List<Movie>? topRatedMovies,
    String? topRatedMessage,
  }) {
    return MovieState(
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPayingMovies: nowPayingMovies ?? this.nowPayingMovies,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularState: popularState ?? this.popularState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingState,
    nowPayingMovies,
    nowPlayingMessage,
    popularState,
    popularMovies,
    popularMessage,
    topRatedState,
    topRatedMovies,
    topRatedMessage,
  ];
}
