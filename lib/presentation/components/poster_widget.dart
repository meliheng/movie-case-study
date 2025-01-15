import 'package:flutter/material.dart';
import 'package:movie_case/core/extensions/string_extensions.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
    required this.imageHeight,
    required this.posterUrl,
  });

  final double imageHeight;
  final String posterUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight,
      width: double.infinity,
      child: posterUrl.isNotEmpty
          ? Image.network(
              posterUrl.toFullImageUrl,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
              fit: BoxFit.contain,
            )
          : const Icon(Icons.error),
    );
  }
}
