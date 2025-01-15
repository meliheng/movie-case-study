import 'package:movie_case/data/models/movie_response_model.dart';

class MovieUIModel {
  final String title;
  final String overview;
  final String posterUrl;
  final double voteAverage;
  final String releaseDate;
  final String backdropUrl;

  MovieUIModel({
    required this.title,
    required this.overview,
    required this.posterUrl,
    required this.voteAverage,
    required this.releaseDate,
    required this.backdropUrl,
  });

  factory MovieUIModel.fromMovie(Movie movie) {
    return MovieUIModel(
      title: movie.title ?? '',
      overview: movie.overview ?? '',
      posterUrl: movie.posterPath ?? "",
      voteAverage: movie.voteAverage ?? 0.0,
      releaseDate: movie.releaseDate ?? '',
      backdropUrl: movie.backdropPath ?? "",
    );
  }
}
