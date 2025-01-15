import 'package:flutter/material.dart';
import 'package:movie_case/domain/entities/movie_ui_model.dart';
import 'package:movie_case/presentation/components/poster_widget.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final MovieUIModel movie;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth * 0.5;
    return Card(
      child: Column(
        children: [
          PosterWidget(imageHeight: imageHeight, movie: movie),
          Text(
            movie.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
