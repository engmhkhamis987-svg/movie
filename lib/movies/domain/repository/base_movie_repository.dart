import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class BaseMovieRepository {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getPopularMovies();
}
