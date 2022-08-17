import 'package:products/app/domain/entities/product_entity.dart';

import '../repositories/get_all_products_repository.dart';

abstract class IGetAllProductsUsecase {
  List<ProductEntity> call();
}

class GetAllProductsUsecaseImp implements IGetAllProductsUsecase {
  final IGetAllProductsRepository _repository;

  GetAllProductsUsecaseImp(this._repository);

  @override
  List<ProductEntity> call() {
    return _repository.call();
  }
}
