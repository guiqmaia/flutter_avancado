import 'package:products/app/domain/entities/product_entity.dart';

abstract class IGetAllProductsRepository {
  List<ProductEntity> call();
}