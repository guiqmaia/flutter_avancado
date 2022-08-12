import 'package:flutter/material.dart';

import '../../src/domain/entities/movie_entity.dart';

Color getColorByMovieRating(MovieEntity movie) {
  if (movie.voteAverage > 7) {
    return Colors.greenAccent.shade400;
  } else if (movie.voteAverage > 5) {
    return Colors.yellowAccent.shade700;
  } else {
    return Colors.red;
  }
}
