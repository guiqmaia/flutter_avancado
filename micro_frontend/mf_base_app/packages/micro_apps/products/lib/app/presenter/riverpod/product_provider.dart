import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:products/app/domain/usecases/get_all_products_usecase_imp.dart';
import 'package:products/app/infra/datasources/local/get_all_products_local_datasource.dart';
import 'package:products/app/infra/repositories/get_all_products_repository_imp.dart';

final productsDataSourceProvider = Provider((ref) {
  return GetAllProductsLocalDatasourceImp();
});

final productsRepositoryProvider = Provider((ref) {
  return GetAllProductsRepositoryImp(ref.watch(productsDataSourceProvider));
});

final productsUsecaseProvider = Provider((ref) {
  return GetAllProductsUsecaseImp(ref.watch(productsRepositoryProvider));
});


