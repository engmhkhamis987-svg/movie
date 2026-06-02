class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = '63de0943da905d69e78e9e943ae284ea';
  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';
}
