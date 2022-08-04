import 'package:dio/dio.dart';
import 'package:exercicio_api_get_list/anime_model.dart';

class AnimeListRepository {
  AnimeListRepository(this.dio);

  Dio dio;

  Future<List<AnimeModel>> getAllAnimes() async {
    List<AnimeModel> animes = [];
    try {
      final response =
          await dio.get("https://anime-facts-rest-api.herokuapp.com/api/v1");

      animes = List.from(
        response.data['data'].map((anime) => AnimeModel.fromMap(anime)),
      );
    } catch (e) {
      print('Deu erro $e');
    }

    return animes;
  }
}
