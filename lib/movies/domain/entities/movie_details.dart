import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  const MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
    required this.runtime,
  });
  final int id;
  final String title;
  final String overview;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;
  final List<Genres> genres;
  final int runtime;

  @override
  List<Object?> get props => [
    id,
    title,
    overview,
    backdropPath,
    voteAverage,
    releaseDate,
    genres,
    runtime,
  ];
}
