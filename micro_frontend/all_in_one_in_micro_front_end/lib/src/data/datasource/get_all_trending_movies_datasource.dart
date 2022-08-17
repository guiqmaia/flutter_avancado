import '../../domain/entities/movie_entity.dart';

abstract class IGetAllTrendingMoviesDatasource {
  Future<List<MovieEntity>> getAllTrendingsMovies(String timeWindow);
}
