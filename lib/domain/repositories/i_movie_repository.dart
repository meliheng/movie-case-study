import 'package:movie_case/core/data_state.dart';
import 'package:movie_case/domain/entities/movies_result_ui_model.dart';

abstract class MovieRepository {
  Future<DataState<MoviesResultUiModel>> getMovies(
      {String filterText = "", int pageNumber = 1});
}
