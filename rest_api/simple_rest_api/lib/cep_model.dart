import 'dart:convert';

class CepModel {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;

  CepModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cep': cep});
    result.addAll({'logradouro': logradouro});
    result.addAll({'bairro': bairro});
    result.addAll({'localidade': localidade});
    result.addAll({'uf': uf});

    return result;
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) =>
      CepModel.fromMap(json.decode(source));
}
