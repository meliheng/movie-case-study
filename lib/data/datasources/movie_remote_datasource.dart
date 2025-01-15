import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_case/core/constants/api_constants.dart';
import 'package:movie_case/data/models/movie_response_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponse> getMovies({String filterText = "", int pageNumber = 1});
}

final class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  late final http.Client client;

  MovieRemoteDataSourceImpl() {
    client = http.Client();
  }

  @override
  Future<MovieResponse> getMovies(
      {String filterText = "", int pageNumber = 1}) async {
    final response = await client.get(
      Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.moviePath}?api_key=${dotenv.env['MOVIE_API_KEY']}&query=$filterText&page=$pageNumber'),
    );
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body));
    } else {
      throw Error();
    }
  }
}
