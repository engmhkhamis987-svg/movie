import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/network/error_message_model.dart';
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
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
