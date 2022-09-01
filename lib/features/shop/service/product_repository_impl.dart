

import 'package:bloc_shop_app/features/shop/models/product_model.dart';
import 'package:bloc_shop_app/features/shop/service/product_repostitory.dart';
import 'package:bloc_shop_app/features/shop/service/product_service.dart';

class ProductRepositoryImpl implements ProductRepository {
   final ProductService productService;

  ProductRepositoryImpl({ required this.productService});
  @override
  Future <List<ProductModel>> fetchProducts() async {
  return await productService.fetchProducts();
  }

}