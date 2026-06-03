import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMovieUsecase {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUsecase({required this.baseMovieRepository});

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
