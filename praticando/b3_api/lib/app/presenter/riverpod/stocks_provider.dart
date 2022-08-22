import 'package:b3_api/app/domain/entities/stock_entity.dart';
import 'package:b3_api/app/domain/usecases/get_all_stocks_usecase/get_all_stocks_usecase_impl.dart';
import 'package:b3_api/app/domain/usecases/get_all_stocks_usecase/get_all_stocks_usecase_interface.dart';
import 'package:b3_api/app/infra/datasources/remote/get_all_stocks_datasources_api_impl.dart';
import 'package:b3_api/app/infra/repositories/get_all_stocks_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider((ref) => Dio());

final stocksDatasourceProvider = Provider((ref) {
  return GetAllStocksDatasourcesApiImpl(ref.watch(dioProvider));
});

final stocksRepositoryProvider = Provider((ref) {
  return GetAllStocksRepositoryImpl(ref.watch(stocksDatasourceProvider));
});

final stocksUsecaseProvider = Provider((ref) {
  return GetAllStocksUsecaseImpl(ref.watch(stocksRepositoryProvider));
});

final stocksNotifierProvider = StateNotifierProvider<StocksNotifier, List<StockEntity>>((ref) {
  return StocksNotifier(ref.watch(stocksUsecaseProvider));
});


class StocksNotifier extends StateNotifier<List<StockEntity>>{
  final GetAllStocksUsecaseInterface _usecase;
StocksNotifier(this._usecase) : super([]) {
  getAllStocks();
}
  Future<void> getAllStocks() async {
    state = [];
    await Future.delayed(const Duration(seconds: 1));
    state = await _usecase.call();
  }
}