import 'package:flutter/material.dart';
import 'package:get_movies_rest_api_with_riverpod/src/presenter/riverpod/movies/movies_page_title_provider.dart';
import 'package:get_movies_rest_api_with_riverpod/src/presenter/riverpod/movies/movies_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerMovies extends HookConsumerWidget {
  const DrawerMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Text(
              'Trending Movies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                letterSpacing: 4,
              ),
            ),
          ),
          ListTile(
            title: const Text('Daily Trendings'),
            onTap: () {
              ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('day');
              ref.read(moviesPageTitleProvider.notifier).changeTrendings('Weekly');
              Navigator.pop(context);
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.shade700,
            height: 10,
          ),
          ListTile(
            title: const Text('Weekly Trendings'),
            onTap: () {
              ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('week');
              ref.read(moviesPageTitleProvider.notifier).changeTrendings('Daily');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
