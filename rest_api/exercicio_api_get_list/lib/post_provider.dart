import 'package:exercicio_api_get_list/post_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'post_model.dart';

final postProvider = StateNotifierProvider<PostNotifier, List<PostModel>>(
  (ref) => PostNotifier(),
);
