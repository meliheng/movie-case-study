part of 'movies_bloc.dart';

sealed class MoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MoviesLoading extends MoviesState {}

final class MoviesLoaded extends MoviesState {
  final List<MovieUIModel> movies;
  final int currentPage;
  final int totalPages;
  final String filterText;
  MoviesLoaded({
    required this.movies,
    this.currentPage = 1,
    this.totalPages = 0,
    this.filterText = "",
  });

  @override
  List<Object?> get props => [movies];

  MoviesLoaded copyWith({
    List<MovieUIModel>? movies,
    int? currentPage,
    int? totalPages,
    String? filterText,
  }) {
    return MoviesLoaded(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      filterText: filterText ?? this.filterText,
    );
  }
}

final class MoviesError extends MoviesState {
  final String message;

  MoviesError(this.message);
}
