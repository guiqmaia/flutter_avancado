import 'package:products/app/domain/entities/product_entity.dart';
import 'package:products/app/infra/datasources/get_all_products_datasource.dart';

class GetAllProductsLocalDatasourceImp implements IGetAllProductsDatasource {
  @override
  List<ProductEntity> call() {
    return [
      ProductEntity(
        name: 'Coca',
        price: 5.0,
        description: 'Abra a felicidade',
        photo: 'https://riomarrecife.com.br/recife/2019/07/refrigerante_coca_cola_350ml.png',
      ),
      ProductEntity(
        name: 'Pepsi',
        price: 6.0,
        description: 'Pode ser pepsi, pode ser agora',
        photo: 'https://static.clubeextra.com.br/img/uploads/1/249/619249.jpg',
      ),
      ProductEntity(
        name: 'Fanta',
        price: 4.5,
        description: 'É mais sabor, é nivel fanta',
        photo: 'https://www.drogariaminasbrasil.com.br/media/product/dc1/refrigerante-fanta-laranja-lata-350ml-6eb.jpg',
      ),
      ProductEntity(
        name: 'Guaraná',
        price: 4.0,
        description: 'Energia que contagia',
        photo: 'https://www.clubeextra.com.br/img/uploads/1/415/19804415.jpg',
      ),
    ];
  }
}
