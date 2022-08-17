import 'package:products/app/domain/entities/product_entity.dart';

abstract class IGetAllProductsDatasource {
  List<ProductEntity> call();
}