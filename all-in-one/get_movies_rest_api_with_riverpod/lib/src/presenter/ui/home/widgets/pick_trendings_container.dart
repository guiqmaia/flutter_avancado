import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverpod/movies/movies_provider.dart';
import '../../movies/movies_page.dart';

class PickTrendingsContainer extends HookConsumerWidget {
  PickTrendingsContainer({
    Key? key,
    required this.timeWindow,
  }) : super(key: key);

  String timeWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies(timeWindow);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const MoviesPage()),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 60,
        ),
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          'Get trending movies of the $timeWindow',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
