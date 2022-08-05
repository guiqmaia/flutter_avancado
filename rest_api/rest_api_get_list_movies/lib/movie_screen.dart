import 'package:flutter/material.dart';

import 'movie_model.dart';

class MovieDetailedPage extends StatelessWidget {
  MovieModel movie;

  MovieDetailedPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Text(
                              movie.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              child: IconButton(
                                onPressed: (() => Navigator.of(context).pop()),
                                icon: const Icon(
                                  Icons.keyboard_arrow_left,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          movie.originalTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          movie.description,
                          style: const TextStyle(
                            fontSize: 13,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Image.network(
                movie.image,
                height: 400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
