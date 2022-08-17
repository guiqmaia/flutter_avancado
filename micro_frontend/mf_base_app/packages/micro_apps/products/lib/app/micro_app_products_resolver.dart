import 'package:core/core.dart';
import 'package:products/app/presenter/ui/products_page.dart';

class MicroAppProductsResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_products';

  @override
  Map<String, WidgetBuilderArgs> get routes {
    return {'/products': ((context, args) => const ProductsPage())};
  }
}