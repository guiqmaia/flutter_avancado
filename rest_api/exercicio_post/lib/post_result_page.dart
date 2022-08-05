import 'package:dio/dio.dart';
import 'package:exercicio_post/post_repository.dart';
import 'package:flutter/material.dart';

class PostResultPage extends StatefulWidget {
  PostResultPage({Key? key}) : super(key: key);

  late Future<bool> result;

  PostRepository repository = PostRepository(Dio());

  @override
  State<PostResultPage> createState() => _PostResultPageState();
}

class _PostResultPageState extends State<PostResultPage> {
  @override
  void initState() {
    super.initState();
    widget.result = widget.repository.postPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: FutureBuilder(
          future: widget.result,
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return const Text('Deu certo');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
