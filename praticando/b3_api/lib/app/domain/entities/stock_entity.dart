class StockEntity {
  String nomeEmpresa;
  String ticker;
  double fechamento;
  double abertura;
  StockEntity({
    required this.nomeEmpresa,
    required this.ticker,
    required this.fechamento,
    required this.abertura,
  });
}
