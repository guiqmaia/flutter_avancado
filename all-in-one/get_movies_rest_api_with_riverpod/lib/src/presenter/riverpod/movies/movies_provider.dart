import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_all_trending_movies_usecase/get_all_trending_movies_usecase.dart';
import '../../../domain/usecases/get_all_trending_movies_usecase/get_all_trending_movies_usecase_imp.dart';
import 'movies_notifier.dart';

late final IGetAllTrendingMoviesUsecase _usecase;

final dioProvider = Provider(
  (ref) {
    return Dio();
  },
);

final moviesUseCaseProvider = Provider(
  (ref) {
    return GetAllTrendingMoviesUsecaseImp(_repository);
  },
);

final moviesProvider = StateNotifierProvider<MoviesNotifier, List<MovieEntity>>(
  (ref) {
    return MoviesNotifier(
      ref.watch(moviesUseCaseProvider),
    );
  },
);
