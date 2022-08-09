import 'dart:async';

import 'package:flutter/material.dart';
import 'package:future_and_stream_builders/home_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _repository = HomeRepository();

  late Future<List<String>> texts;
  final StreamController<List<String>> streamController = StreamController();

  @override
  void initState() {
    super.initState();
    getAllNamesForStreamController();
  }

  void getAllNamesForStreamController() async {
    List<String> names = await _repository.getAllNames();
    streamController.add(names);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: _repository.timedCounter(const Duration(seconds: 1), 3),
              builder: (context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
