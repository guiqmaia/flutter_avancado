import 'package:dio/dio.dart';
import 'package:exercicio_api_get_list/post_list_repository.dart';
import 'package:exercicio_api_get_list/post_model.dart';
import 'package:flutter/material.dart';

class GetListaPage extends StatefulWidget {
  const GetListaPage({Key? key}) : super(key: key);

  @override
  State<GetListaPage> createState() => _GetListaPageState();
}

class _GetListaPageState extends State<GetListaPage> {
  final ResultListRepository repository = ResultListRepository(Dio());

  late Future<List<PostModel>> results;

  @override
  void initState() {
    super.initState();
    results = repository.getAllResults();
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
          builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
            if (snapshot.hasData) {
              List<PostModel>? post = snapshot.data;
              return ListView.builder(
                itemCount: post!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Text(
                        post[index].id.toString(),
                      ),
                      title: Text(post[index].title),
                      subtitle: Text(post[index].body),
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
