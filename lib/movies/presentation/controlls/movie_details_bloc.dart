import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationUsecase getRecommendationUsecase;

  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationUsecase)
    : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailsUsecase(
      MovieDetailsParameters(movieId: event.movieId),
    );

    result.fold(
      (l) {
        emit(
          state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            movieDetails: r,
            movieDetailsState: RequestState.loaded,
          ),
        );
      },
    );
  }

  FutureOr<void> _getMovieRecommendations(
    GetMovieRecommendationEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getRecommendationUsecase(
      RecommendationParameters(movieId: event.movieId),
    );

    result.fold(
      (l) {
        emit(
          state.copyWith(
            recommendationsState: RequestState.error,
            recommendationsMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            recommendations: r,
            recommendationsState: RequestState.loaded,
          ),
        );
      },
    );
  }
}
