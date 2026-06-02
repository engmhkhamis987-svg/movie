import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetPopularMovieUsecase {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMovieUsecase({required this.baseMovieRepository});

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
