
import 'package:b3_api/app/domain/entities/stock_entity.dart';

abstract class GetAllStocksUsecaseInterface {
  Future<List<StockEntity>> call();
}