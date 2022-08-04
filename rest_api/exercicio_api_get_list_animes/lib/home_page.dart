import 'package:exercicio_api_get_list/animes_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AnimesPage()),
          ),
          child: const Text('Lista de Animes'),
        ),
      ),
    );
  }
}
