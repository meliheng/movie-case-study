part of 'movies_bloc.dart';

sealed class MoviesEvent {}

final class FetchMovies extends MoviesEvent {}

final class SearchMovies extends MoviesEvent {
  final String filterText;

  SearchMovies(this.filterText);
}

final class PageChangedEvent extends MoviesEvent {
  final int pageNumber;

  PageChangedEvent(this.pageNumber);
}
