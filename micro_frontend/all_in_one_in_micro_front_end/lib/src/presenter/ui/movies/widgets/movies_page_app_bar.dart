import 'package:flutter/material.dart';
import 'package:get_movies_rest_api_with_riverpod/src/presenter/riverpod/movies/movies_page_title_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoviesPageAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const MoviesPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageTitle = ref.watch(moviesPageTitleProvider);
    return AppBar(
      title: Text(
        '$pageTitle Trendings',
        style: const TextStyle(
          fontSize: 25,
          letterSpacing: 2,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
