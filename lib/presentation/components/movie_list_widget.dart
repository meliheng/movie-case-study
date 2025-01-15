import 'package:flutter/material.dart';
import 'package:movie_case/core/constants/app_strings.dart';
import 'package:movie_case/domain/entities/movie_ui_model.dart';
import 'package:movie_case/presentation/components/movie_card.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({
    super.key,
    required this.movies,
  });
  final List<MovieUIModel> movies;
  @override
  Widget build(BuildContext context) {
    return movies.isNotEmpty
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(movie: movie);
            },
          )
        : const Center(
            child: Text(AppStrings.noMoviesFound),
          );
  }
}
