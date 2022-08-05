import 'package:dio/dio.dart';
import 'package:exercicio_api_get_list/post_model.dart';

class ResultListRepository {
  ResultListRepository(this.dio);

  Dio dio;

  String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> getAllResults() async {
    List<PostModel> results = [];
    try {
      final response = await dio.get(url);

      results = List.from(
        response.data.map(
          (result) => PostModel.fromMap(result),
        ),
      );
    } catch (e) {
      print('Deu erro $e');
    }

    return results;
  }
}
