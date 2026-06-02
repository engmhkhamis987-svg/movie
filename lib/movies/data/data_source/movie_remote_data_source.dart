import 'package:dio/dio.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=<<api_key>>&language=en-US&page=1',
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map((e) => MovieModel.fromJson(e)).toList(),
      );
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
