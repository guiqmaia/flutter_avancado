import 'package:dio/dio.dart';
import 'package:exercicio_api_get_list/post_model.dart';

class PostListRepository {
  PostListRepository(this.dio);

  Dio dio;

  String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> getAllPosts() async {
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
