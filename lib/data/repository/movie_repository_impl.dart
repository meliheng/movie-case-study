import 'package:flutter/material.dart';
import 'package:movie_case/core/model/data_state.dart';
import 'package:movie_case/data/datasources/movie_remote_datasource.dart';
import 'package:movie_case/domain/entities/movies_result_ui_model.dart';
import 'package:movie_case/domain/repositories/i_movie_repository.dart';

final class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _remoteDataSource;

  MovieRepositoryImpl(this._remoteDataSource);
  @override
  Future<DataState<MoviesResultUiModel>> getMovies(
      {String filterText = "", int pageNumber = 1}) async {
    try {
      var result = await _remoteDataSource.getMovies(
          filterText: filterText, pageNumber: pageNumber);
      return DataSuccess(MoviesResultUiModel.fromMoviesResult(result));
    } on FlutterError catch (error) {
      return DataFailed(error);
    }
  }
}
