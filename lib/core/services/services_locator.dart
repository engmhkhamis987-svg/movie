import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movie_usecase.dart';
import 'package:movie_app/movies/presentation/controlls/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controlls/movie_provider.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));

    sl.registerFactory(() => MovieProvider(sl(), sl(), sl()));

    //Use cases
    sl.registerLazySingleton(() => GetNowPlayingMovieUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMovieUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovieUsecase(sl()));

    // Repositories
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    //Data sources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
