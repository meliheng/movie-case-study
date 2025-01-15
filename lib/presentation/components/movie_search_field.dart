import 'package:flutter/material.dart';
import 'package:movie_case/core/constants/app_strings.dart';

class MovieSearchField extends StatelessWidget {
  final Function(String value) onSearch;
  const MovieSearchField({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: AppStrings.search,
        hintText: AppStrings.searchForAMovie,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onChanged: onSearch,
    );
  }
}
