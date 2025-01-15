import 'package:movie_case/core/data_state.dart';
import 'package:movie_case/domain/entities/movies_result_ui_model.dart';
import 'package:movie_case/domain/repositories/i_movie_repository.dart';

final class GetMoviesUseCase {
  final MovieRepository _movieRepository;

  GetMoviesUseCase(this._movieRepository);

  Future<DataState<MoviesResultUiModel>> execute(
      {String filterText = "", int pageNumber = 1}) async {
    return _movieRepository.getMovies(
        filterText: filterText, pageNumber: pageNumber);
  }
}
