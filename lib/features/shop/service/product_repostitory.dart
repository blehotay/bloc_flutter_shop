import 'package:bloc_shop_app/features/shop/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> fetchProducts();
}