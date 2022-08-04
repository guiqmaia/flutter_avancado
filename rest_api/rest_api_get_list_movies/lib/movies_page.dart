import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_get_list_films/movie_model.dart';
import 'package:rest_api_get_list_films/movie_repository.dart';

import 'movie_screen.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MovieRepository _repository = MovieRepository(Dio());

  late Future<List<MovieModel>> movies;

  @override
  void initState() {
    super.initState();
    movies = _repository.getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (() => Navigator.of(context).pop()),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 35,
            )),
        title: const Text('Movies'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: movies,
          builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
            if (snapshot.hasData) {
              return MoviesList(
                movies: snapshot.data!,
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class MoviesList extends StatelessWidget {
  final List<MovieModel> movies;

  const MoviesList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MovieScreen(movie: movies[index]),
                ),
              );
            },
            child: Image.network(
              movies[index].image,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
        );
      }),
    );
  }
}
