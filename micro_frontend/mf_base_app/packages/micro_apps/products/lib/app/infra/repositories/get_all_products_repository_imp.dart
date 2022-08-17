import 'package:products/app/domain/entities/product_entity.dart';
import 'package:products/app/domain/repositories/get_all_products_repository.dart';
import 'package:products/app/infra/datasources/get_all_products_datasource.dart';

class GetAllProductsRepositoryImp implements IGetAllProductsRepository {

  final IGetAllProductsDatasource _datasource;

  GetAllProductsRepositoryImp(this._datasource);

  @override
  List<ProductEntity> call() {
    return _datasource.call();
  }
}
