import 'package:dio/dio.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../dto/movie_dto.dart';
import '../get_all_trending_movies_datasource.dart';

class GetAllTrendingMoviesRemoteDatasourceImp implements IGetAllTrendingMoviesDatasource {
  final Dio dio;

  GetAllTrendingMoviesRemoteDatasourceImp(this.dio);
  @override
  Future<List<MovieEntity>> getAllTrendingsMovies(String timeWindow) async {
    List<MovieEntity> movies = [];
    try {
      Response response = await dio.get(
        "https://api.themoviedb.org/3/trending/movie/$timeWindow",
        queryParameters: {
          "api_key": "8ea92715f7d8106c05adb6c4d6f328af",
        },
      );

      movies = List.from(
        response.data['results'].map(
          (movie) => MovieDto.fromMap(movie),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
    return movies;
  }
}
