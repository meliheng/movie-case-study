import 'package:flutter/material.dart';
import 'package:movie_case/core/extensions/string_extensions.dart';
import 'package:movie_case/domain/entities/movie_ui_model.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
    required this.imageHeight,
    required this.movie,
  });

  final double imageHeight;
  final MovieUIModel movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight,
      width: double.infinity,
      child: Image.network(
        movie.posterUrl.toFullImageUrl,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        },
        fit: BoxFit.contain,
      ),
    );
  }
}
