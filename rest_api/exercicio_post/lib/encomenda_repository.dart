import 'package:dio/dio.dart';
import 'package:exercicio_post/evento_model.dart';

class EncomendaRepository {
  final Dio dio;

  EncomendaRepository(this.dio);

  Future<List<EventoModel>> getEventsInfo() async {
    List<EventoModel> events = [];
    try {
      var data = {
        "code": "ON931559908BR",
        "type": "LS",
      };

      final response = await dio.post(
        'https://correios.contrateumdev.com.br/api/rastreio',
        data: data,
      );

      events = List.from(
        response.data['objeto'][0]['evento'].map(
          (event) {
            return EventoModel.fromMap(event);
          },
        ),
      );
      print(response.data);

      print(events);
    } catch (e) {
      print('Deu erro $e');
    }
    return events;
  }
}
