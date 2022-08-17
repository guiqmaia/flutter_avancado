import 'package:flutter/material.dart';

import 'widgets/body_movies.dart';
import 'widgets/drawer_movies.dart';
import 'widgets/movies_page_app_bar.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: DrawerMovies(),
      appBar: MoviesPageAppBar(),
      body: BodyMovies(),
    );
  }
}
