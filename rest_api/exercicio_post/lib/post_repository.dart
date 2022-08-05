import 'package:dio/dio.dart';

class PostRepository {
  final Dio dio;

  PostRepository(this.dio);

  Future<bool> postPost() async {
    bool result = true;

    try {
      var data = {
        "userId": 1,
        "id": 1,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body":
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      };

      final response = await dio
          .post('https://jsonplaceholder.typicode.com/posts', data: data);

      if (response.statusCode == 201) {
        result = true;
      } else {
        result = false;
      }
    } catch (e) {
      print('Deu erro $e');
    }
    return result;
  }
}
