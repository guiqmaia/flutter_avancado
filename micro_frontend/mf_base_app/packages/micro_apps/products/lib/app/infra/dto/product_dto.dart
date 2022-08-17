import 'package:products/app/domain/entities/product_entity.dart';

class ProductDto extends ProductEntity {
  ProductDto({
    required String name,
    required double price,
    required String description,
    required String photo,
  }) : super(description: description, price: price, name: name, photo: photo);
}
