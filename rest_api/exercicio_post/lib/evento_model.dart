import 'dart:convert';

class EventoModel {
  final String cepDestino;
  final String criacao;
  final String data;
  final String dataPostagem;
  final String descricao;
  final String diasUteis;
  final String hora;
  final String prazoGuarda;
  final String status;
  final String tipo;
  final Unidade unidade;
  EventoModel({
    required this.cepDestino,
    required this.criacao,
    required this.data,
    required this.dataPostagem,
    required this.descricao,
    required this.diasUteis,
    required this.hora,
    required this.prazoGuarda,
    required this.status,
    required this.tipo,
    required this.unidade,
  });

  EventoModel copyWith({
    String? cepDestino,
    String? criacao,
    String? data,
    String? dataPostagem,
    String? descricao,
    String? diasUteis,
    String? hora,
    String? prazoGuarda,
    String? status,
    String? tipo,
    Unidade? unidade,
  }) {
    return EventoModel(
      cepDestino: cepDestino ?? this.cepDestino,
      criacao: criacao ?? this.criacao,
      data: data ?? this.data,
      dataPostagem: dataPostagem ?? this.dataPostagem,
      descricao: descricao ?? this.descricao,
      diasUteis: diasUteis ?? this.diasUteis,
      hora: hora ?? this.hora,
      prazoGuarda: prazoGuarda ?? this.prazoGuarda,
      status: status ?? this.status,
      tipo: tipo ?? this.tipo,
      unidade: unidade ?? this.unidade,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cepDestino': cepDestino});
    result.addAll({'criacao': criacao});
    result.addAll({'data': data});
    result.addAll({'dataPostagem': dataPostagem});
    result.addAll({'descricao': descricao});
    result.addAll({'diasUteis': diasUteis});
    result.addAll({'hora': hora});
    result.addAll({'prazoGuarda': prazoGuarda});
    result.addAll({'status': status});
    result.addAll({'tipo': tipo});
    result.addAll({'unidade': unidade.toMap()});

    return result;
  }

  factory EventoModel.fromMap(Map<String, dynamic> map) {
    return EventoModel(
      cepDestino: map['cepDestino'] ?? '',
      criacao: map['criacao'] ?? '',
      data: map['data'] ?? '',
      dataPostagem: map['dataPostagem'] ?? '',
      descricao: map['descricao'] ?? '',
      diasUteis: map['diasUteis'] ?? '',
      hora: map['hora'] ?? '',
      prazoGuarda: map['prazoGuarda'] ?? '',
      status: map['status'] ?? '',
      tipo: map['tipo'] ?? '',
      unidade: Unidade.fromMap(map['unidade']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventoModel.fromJson(String source) =>
      EventoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EncomendaModel(cepDestino: $cepDestino, criacao: $criacao, data: $data, dataPostagem: $dataPostagem, descricao: $descricao, diasUteis: $diasUteis, hora: $hora, prazoGuarda: $prazoGuarda, status: $status, tipo: $tipo, unidade: $unidade)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventoModel &&
        other.cepDestino == cepDestino &&
        other.criacao == criacao &&
        other.data == data &&
        other.dataPostagem == dataPostagem &&
        other.descricao == descricao &&
        other.diasUteis == diasUteis &&
        other.hora == hora &&
        other.prazoGuarda == prazoGuarda &&
        other.status == status &&
        other.tipo == tipo &&
        other.unidade == unidade;
  }

  @override
  int get hashCode {
    return cepDestino.hashCode ^
        criacao.hashCode ^
        data.hashCode ^
        dataPostagem.hashCode ^
        descricao.hashCode ^
        diasUteis.hashCode ^
        hora.hashCode ^
        prazoGuarda.hashCode ^
        status.hashCode ^
        tipo.hashCode ^
        unidade.hashCode;
  }
}

class Unidade {
  final String cidade;
  final String codigo;
  final Endereco endereco;
  final String local;
  final String sto;
  final String tipounidade;
  final String uf;
  Unidade({
    required this.cidade,
    required this.codigo,
    required this.endereco,
    required this.local,
    required this.sto,
    required this.tipounidade,
    required this.uf,
  });

  Unidade copyWith({
    String? cidade,
    String? codigo,
    Endereco? endereco,
    String? local,
    String? sto,
    String? tipounidade,
    String? uf,
  }) {
    return Unidade(
      cidade: cidade ?? this.cidade,
      codigo: codigo ?? this.codigo,
      endereco: endereco ?? this.endereco,
      local: local ?? this.local,
      sto: sto ?? this.sto,
      tipounidade: tipounidade ?? this.tipounidade,
      uf: uf ?? this.uf,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cidade': cidade});
    result.addAll({'codigo': codigo});
    result.addAll({'endereco': endereco.toMap()});
    result.addAll({'local': local});
    result.addAll({'sto': sto});
    result.addAll({'tipounidade': tipounidade});
    result.addAll({'uf': uf});

    return result;
  }

  factory Unidade.fromMap(Map<String, dynamic> map) {
    return Unidade(
      cidade: map['cidade'] ?? '',
      codigo: map['codigo'] ?? '',
      endereco: Endereco.fromMap(map['endereco']),
      local: map['local'] ?? '',
      sto: map['sto'] ?? '',
      tipounidade: map['tipounidade'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Unidade.fromJson(String source) =>
      Unidade.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Unidade(cidade: $cidade, codigo: $codigo, endereco: $endereco, local: $local, sto: $sto, tipounidade: $tipounidade, uf: $uf)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Unidade &&
        other.cidade == cidade &&
        other.codigo == codigo &&
        other.endereco == endereco &&
        other.local == local &&
        other.sto == sto &&
        other.tipounidade == tipounidade &&
        other.uf == uf;
  }

  @override
  int get hashCode {
    return cidade.hashCode ^
        codigo.hashCode ^
        endereco.hashCode ^
        local.hashCode ^
        sto.hashCode ^
        tipounidade.hashCode ^
        uf.hashCode;
  }
}

class Endereco {
  final String bairro;
  final String cep;
  final String codigo;
  final String latitude;
  final String localidade;
  final String logradouro;
  final String longitude;
  final String numero;
  final String uf;
  Endereco({
    required this.bairro,
    required this.cep,
    required this.codigo,
    required this.latitude,
    required this.localidade,
    required this.logradouro,
    required this.longitude,
    required this.numero,
    required this.uf,
  });

  Endereco copyWith({
    String? bairro,
    String? cep,
    String? codigo,
    String? latitude,
    String? localidade,
    String? logradouro,
    String? longitude,
    String? numero,
    String? uf,
  }) {
    return Endereco(
      bairro: bairro ?? this.bairro,
      cep: cep ?? this.cep,
      codigo: codigo ?? this.codigo,
      latitude: latitude ?? this.latitude,
      localidade: localidade ?? this.localidade,
      logradouro: logradouro ?? this.logradouro,
      longitude: longitude ?? this.longitude,
      numero: numero ?? this.numero,
      uf: uf ?? this.uf,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'bairro': bairro});
    result.addAll({'cep': cep});
    result.addAll({'codigo': codigo});
    result.addAll({'latitude': latitude});
    result.addAll({'localidade': localidade});
    result.addAll({'logradouro': logradouro});
    result.addAll({'longitude': longitude});
    result.addAll({'numero': numero});
    result.addAll({'uf': uf});

    return result;
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      bairro: map['bairro'] ?? '',
      cep: map['cep'] ?? '',
      codigo: map['codigo'] ?? '',
      latitude: map['latitude'] ?? '',
      localidade: map['localidade'] ?? '',
      logradouro: map['logradouro'] ?? '',
      longitude: map['longitude'] ?? '',
      numero: map['numero'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Endereco(bairro: $bairro, cep: $cep, codigo: $codigo, latitude: $latitude, localidade: $localidade, logradouro: $logradouro, longitude: $longitude, numero: $numero, uf: $uf)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Endereco &&
        other.bairro == bairro &&
        other.cep == cep &&
        other.codigo == codigo &&
        other.latitude == latitude &&
        other.localidade == localidade &&
        other.logradouro == logradouro &&
        other.longitude == longitude &&
        other.numero == numero &&
        other.uf == uf;
  }

  @override
  int get hashCode {
    return bairro.hashCode ^
        cep.hashCode ^
        codigo.hashCode ^
        latitude.hashCode ^
        localidade.hashCode ^
        logradouro.hashCode ^
        longitude.hashCode ^
        numero.hashCode ^
        uf.hashCode;
  }
}
