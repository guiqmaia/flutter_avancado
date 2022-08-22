import 'package:b3_api/app/domain/entities/stock_entity.dart';

abstract class GetAllStocksRepositoryInterface {
  Future<List<StockEntity>> call();
}
