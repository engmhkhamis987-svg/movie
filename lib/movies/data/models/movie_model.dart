import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: List<int>.from(json['genre_ids'].map((e) => e as int)),
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: (json['vote_average']).toDouble(),
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'overview': overview,
      'release_date': releaseDate,
      'vote_average': voteAverage,
    };
  }
}
