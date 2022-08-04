import 'package:dio/dio.dart';
import 'package:exercicio_api_get_list/anime_list_repository.dart';
import 'package:exercicio_api_get_list/anime_model.dart';
import 'package:flutter/material.dart';

class AnimesPage extends StatefulWidget {
  const AnimesPage({Key? key}) : super(key: key);

  @override
  State<AnimesPage> createState() => _AnimesPageState();
}

class _AnimesPageState extends State<AnimesPage> {
  final AnimeListRepository repository = AnimeListRepository(Dio());

  late Future<List<AnimeModel>> results;

  @override
  void initState() {
    super.initState();
    results = repository.getAllAnimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Results'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: results,
          builder: (context, AsyncSnapshot<List<AnimeModel>> snapshot) {
            if (snapshot.hasData) {
              List<AnimeModel>? posts = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Text(
                            posts[index].anime_name,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.network(
                            posts[index].anime_img,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                'https://static.wikia.nocookie.net/dublagem/images/5/5e/JujutsuK_Poster1.png/revision/latest?cb=20210220124602&path-prefix=pt-br',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
