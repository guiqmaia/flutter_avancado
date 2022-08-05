import 'package:dio/dio.dart';
import 'package:exercicio_post/encomenda_repository.dart';
import 'package:exercicio_post/evento_model.dart';
import 'package:flutter/material.dart';

class EncomendasPage extends StatefulWidget {
  const EncomendasPage({Key? key}) : super(key: key);

  @override
  State<EncomendasPage> createState() => _EncomendasPageState();
}

class _EncomendasPageState extends State<EncomendasPage> {
  final repository = EncomendaRepository(Dio());

  late Future<List<EventoModel>> eventos;

  @override
  void initState() {
    eventos = repository.getEventsInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rastreamento de Encomendas'),
      ),
      body: Center(
        child: FutureBuilder(
          future: eventos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text('Has Data');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
