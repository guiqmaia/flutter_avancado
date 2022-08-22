
import 'package:b3_api/app/domain/entities/stock_entity.dart';
import 'package:b3_api/app/domain/repositories/get_all_stocks_repository_interface.dart';
import 'package:b3_api/app/infra/datasources/get_all_stocks_datasources_interface.dart';

class GetAllStocksRepositoryImpl implements GetAllStocksRepositoryInterface {

  final GetAllStocksDatasourcesInterface _datasource;

  GetAllStocksRepositoryImpl(this._datasource);
  @override
  Future<List<StockEntity>> call() {
    return _datasource.call();
  }
  
}