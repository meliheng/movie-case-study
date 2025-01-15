import 'package:get_it/get_it.dart';
import 'package:movie_case/data/datasources/movie_remote_datasource.dart';
import 'package:movie_case/data/repository/movie_repository_impl.dart';
import 'package:movie_case/domain/repositories/i_movie_repository.dart';
import 'package:movie_case/domain/usecases/get_movies.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<MovieRemoteDataSource>(MovieRemoteDataSourceImpl());
  getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl(getIt()));
  getIt.registerSingleton<GetMoviesUseCase>(GetMoviesUseCase(getIt()));
}
