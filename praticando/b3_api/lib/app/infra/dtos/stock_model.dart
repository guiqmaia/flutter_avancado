import '../../domain/entities/stock_entity.dart';

class StockModel extends StockEntity {
  StockModel({
    required String nomeEmpresa,
    required String ticker,
    required double fechamento,
    required double abertura,
  }) : super(ticker: ticker, nomeEmpresa: nomeEmpresa, fechamento: fechamento, abertura: abertura);

  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      nomeEmpresa: map['nm_empresa_rdz'] ?? '',
      ticker: map['cd_acao'] ?? '',
      fechamento: map['vl_fechamento']?.toDouble() ?? 0.0,
      abertura: map['vl_abertura']?.toDouble() ?? 0.0,
    );
  }
}
