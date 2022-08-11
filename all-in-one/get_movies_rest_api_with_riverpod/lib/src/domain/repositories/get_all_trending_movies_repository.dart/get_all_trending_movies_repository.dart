import '../../entities/movie_entity.dart';

abstract class IGetAllTrendingMoviesRepository  {
  Future<List<MovieEntity>> getAllTrendingsMovies(String timeWindow);
}