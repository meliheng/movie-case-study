import 'package:flutter/material.dart';
import 'package:movie_case/presentation/bloc/movies_bloc.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    super.key,
    required this.moviesBloc,
    required this.state,
  });

  final MoviesBloc moviesBloc;
  final MoviesLoaded state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              moviesBloc.add(PageChangedEvent(state.currentPage - 1));
            },
          ),
          Text('${state.currentPage} / ${state.totalPages}'),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              moviesBloc.add(PageChangedEvent(state.currentPage + 1));
            },
          ),
        ],
      ),
    );
  }
}
