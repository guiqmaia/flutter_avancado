import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_all_trending_movies_usecase/get_all_trending_movies_usecase.dart';

class MoviesNotifier extends StateNotifier<List<MovieEntity>> {
  MoviesNotifier(this._usecase) : super([]) {
    getAllTrendingMovies('day');
  }

  final IGetAllTrendingMoviesUsecase _usecase;

  Future<void> getAllTrendingMovies(String timeWindow) async {
    state = await _usecase.getAllTrendingsMovies(timeWindow);
  }
}
