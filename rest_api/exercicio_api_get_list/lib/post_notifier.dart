import 'package:dio/dio.dart';
import 'package:exercicio_api_get_list/post_list_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'post_model.dart';

class PostNotifier extends StateNotifier<List<PostModel>> {
  PostNotifier() : super([]) {
    getAllPosts();
  }

  final _repository = PostListRepository(Dio());

  getAllPosts() async {
    state = await _repository.getAllPosts();
  }
}
