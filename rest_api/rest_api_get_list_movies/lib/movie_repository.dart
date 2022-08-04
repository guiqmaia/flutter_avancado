import 'package:dio/dio.dart';
import 'package:rest_api_get_list_films/movie_model.dart';

class MovieRepository {
  final Dio dio;
  MovieRepository(this.dio);

  Future<List<MovieModel>> getAllMovies() async {
    List<MovieModel> movies = [];
    try {
      final response = await dio.get("https://ghibliapi.herokuapp.com/films");

      movies =
          List.from(response.data.map((movie) => MovieModel.fromMap(movie)));
    } catch (e) {
      print("Deu erro");
    }
    return movies;
  }
}
