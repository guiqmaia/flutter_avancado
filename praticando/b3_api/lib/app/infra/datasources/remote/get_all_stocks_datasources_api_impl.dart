import 'package:b3_api/app/domain/entities/stock_entity.dart';
import 'package:b3_api/app/infra/datasources/get_all_stocks_datasources_interface.dart';
import 'package:b3_api/app/infra/dtos/stock_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetAllStocksDatasourcesApiImpl implements GetAllStocksDatasourcesInterface {
  final Dio dio;
  GetAllStocksDatasourcesApiImpl(this.dio);
  @override
  Future<List<StockEntity>> call() async {
    List<StockEntity> stocks = [];

    final response = await dio.get('https://api-cotacao-b3.labdo.it/api/cotacao/dt/20200102/02');

    stocks = List.from(
      response.data.map(
        (stock) => StockModel.fromMap(stock),
      ),
    );

    try {} catch (e) {
      debugPrint('$e');
    }
    return stocks;
  }
}
