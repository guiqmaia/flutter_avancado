import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/utils/date_formater.dart';
import '../../../../../shared/utils/get_color_by_movie_rating.dart';
import '../../../../domain/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        fit: BoxFit.fill,
                      ),
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
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dateFormater(movie.releaseDate),
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
