import 'package:movie_case/data/models/movie_response_model.dart';
import 'package:movie_case/domain/entities/movie_ui_model.dart';

final class MoviesResultUiModel {
  final int totalPage;
  final List<MovieUIModel> movies;

  MoviesResultUiModel({required this.totalPage, required this.movies});

  MoviesResultUiModel copyWith({
    int? totalPage,
    List<MovieUIModel>? movies,
  }) {
    return MoviesResultUiModel(
      totalPage: totalPage ?? this.totalPage,
      movies: movies ?? this.movies,
    );
  }

  factory MoviesResultUiModel.fromMoviesResult(MovieResponse movieResponse) {
    return MoviesResultUiModel(
      totalPage: movieResponse.totalPages ?? 0,
      movies: movieResponse.results
              ?.map((movie) => MovieUIModel.fromMovie(movie))
              .toList() ??
          [],
    );
  }
}
