import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../shared/utils/date_formater.dart';
import '../../../../../shared/utils/get_color_by_movie_rating.dart';
import '../../../../domain/entities/movie_entity.dart';
import '../../../riverpod/movies/movies_provider.dart';

class VisibilityGridViewBuilder extends HookConsumerWidget {
  const VisibilityGridViewBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Visibility(
          visible: movies.isNotEmpty,
          replacement: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 9.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          height: 300,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'The Most Populars',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        'Click in a movie card for details',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      MovieEntity movie = movies[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: InkWell(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 20,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      top: 10,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300.withOpacity(0.6),
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: const Icon(
                                          Icons.more_horiz,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 15,
                                      child: Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.grey.shade900,
                                            radius: 22,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  (movie.voteAverage * 10).toStringAsFixed(0),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const Text('%', style: TextStyle(color: Colors.white, fontSize: 5)),
                                              ],
                                            ),
                                          ),
                                          TweenAnimationBuilder<double>(
                                            tween: Tween<double>(begin: 0, end: movie.voteAverage / 10),
                                            duration: const Duration(milliseconds: 1500),
                                            builder: (context, value, child) {
                                              return CircularProgressIndicator(
                                                value: value,
                                                color: getColorByMovieRating(movie),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        movie.title,
                                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.magenta),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        dateFormater(movie.releaseDate),
                                        style: TextStyle(color: Colors.pink.shade400, fontSize: 15, fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
