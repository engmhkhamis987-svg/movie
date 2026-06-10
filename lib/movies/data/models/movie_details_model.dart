import 'package:movie_app/movies/data/models/genres_model.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.voteAverage,
    required super.releaseDate,
    required super.genres,
    required super.runtime,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      backdropPath:
          json['backdrop_path'], //?? '/uzzTystB8lL0mRDII5Sfs5HxgkI.jpg',
      voteAverage: (json['vote_average']).toDouble(),
      releaseDate: json['release_date'],
      genres: List<GenresModel>.from(
        json['genres'].map((x) => GenresModel.fromJson(x)),
      ),
      runtime: json["runtime"],
    );
  }
}
