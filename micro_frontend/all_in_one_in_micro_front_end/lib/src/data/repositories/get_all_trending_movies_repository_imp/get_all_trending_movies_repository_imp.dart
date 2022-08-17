import '../../../domain/entities/movie_entity.dart';
import '../../../domain/repositories/get_all_trending_movies_repository.dart/get_all_trending_movies_repository.dart';
import '../../datasource/get_all_trending_movies_datasource.dart';

class GetAllTrendingMoviesRepositoryImp implements IGetAllTrendingMoviesRepository {
  final IGetAllTrendingMoviesDatasource _datasource;

  GetAllTrendingMoviesRepositoryImp(this._datasource);

  @override
  Future<List<MovieEntity>> getAllTrendingsMovies(String timeWindow) async{
    return await _datasource.getAllTrendingsMovies(timeWindow);
  }
}
