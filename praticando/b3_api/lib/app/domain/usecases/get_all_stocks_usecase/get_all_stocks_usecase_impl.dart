import 'package:b3_api/app/domain/entities/stock_entity.dart';
import 'package:b3_api/app/domain/repositories/get_all_stocks_repository_interface.dart';
import 'package:b3_api/app/domain/usecases/get_all_stocks_usecase/get_all_stocks_usecase_interface.dart';

class GetAllStocksUsecaseImpl implements GetAllStocksUsecaseInterface {
  final GetAllStocksRepositoryInterface _repository;
  GetAllStocksUsecaseImpl(this._repository);
  @override
  Future<List<StockEntity>> call() {
    return _repository.call();
  }
}
