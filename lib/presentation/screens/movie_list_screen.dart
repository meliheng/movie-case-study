import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_case/core/constants/app_strings.dart';
import 'package:movie_case/core/di/getit_init.dart';
import 'package:movie_case/data/repository/movie_repository_impl.dart';
import 'package:movie_case/domain/usecases/get_movies.dart';
import 'package:movie_case/presentation/bloc/movies_bloc.dart';
import 'package:movie_case/presentation/components/movie_list_widget.dart';
import 'package:movie_case/presentation/components/movie_search_field.dart';
import 'package:movie_case/presentation/components/pagination_widget.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final MoviesBloc _moviesBloc =
      MoviesBloc(GetMoviesUseCase(MovieRepositoryImpl(getIt())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.movies),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MovieSearchField(
              onSearch: (String value) {
                _moviesBloc.add(SearchMovies(value));
              },
            ),
          ),
          BlocBuilder<MoviesBloc, MoviesState>(
            bloc: _moviesBloc,
            builder: (context, state) {
              if (state is MoviesLoaded) {
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: MovieListWidget(
                          movies: state.movies,
                        ),
                      ),
                      if (state.totalPages > 1)
                        PaginationWidget(
                          moviesBloc: _moviesBloc,
                          state: state,
                        ),
                    ],
                  ),
                );
              } else if (state is MoviesError) {
                return Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(state.message),
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
