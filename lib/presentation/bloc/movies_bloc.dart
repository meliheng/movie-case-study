import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_case/domain/entities/movie_ui_model.dart';
import 'package:movie_case/domain/usecases/get_movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

final class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;

  MoviesBloc(this.getMoviesUseCase) : super(MoviesLoading()) {
    on<FetchMovies>(_onFetchMovies);
    on<SearchMovies>(_onSearchMovies);
    on<PageChangedEvent>(_onPageChanged);
    add(FetchMovies());
  }

  FutureOr<void> _onFetchMovies(
      FetchMovies event, Emitter<MoviesState> emit) async {
    final result = await getMoviesUseCase.execute();
    if (result.error != null) {
      emit(MoviesError(result.error!.message));
      return;
    } else if (result.data != null) {
      emit(MoviesLoaded(movies: result.data!.movies));
    }
  }

  FutureOr<void> _onSearchMovies(
      SearchMovies event, Emitter<MoviesState> emit) async {
    if (event.filterText.isEmpty) {
      emit(MoviesLoaded(movies: const [], filterText: ''));
      return;
    }
    if (event.filterText.length > 1) {
      emit(MoviesLoading());
      final result =
          await getMoviesUseCase.execute(filterText: event.filterText);
      if (result.error != null) {
        emit(MoviesError(result.error!.message));
        return;
      } else if (result.data != null) {
        emit(MoviesLoaded(
            movies: result.data!.movies,
            filterText: event.filterText,
            totalPages: result.data!.totalPage));
      }
    }
  }

  FutureOr<void> _onPageChanged(
      PageChangedEvent event, Emitter<MoviesState> emit) async {
    if (state is MoviesLoaded) {
      final currentState = state as MoviesLoaded;
      if (currentState.currentPage == event.pageNumber) return;
      emit(MoviesLoading());
      final result = await getMoviesUseCase.execute(
          pageNumber: event.pageNumber, filterText: currentState.filterText);
      if (result.error != null) {
        emit(MoviesError(result.error!.message));
        return;
      } else if (result.data != null) {
        emit(currentState.copyWith(
            movies: result.data!.movies, currentPage: event.pageNumber));
      }
    }
  }
}
