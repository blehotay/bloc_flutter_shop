import 'dart:convert';

import 'package:bloc_shop_app/features/shop/models/product_model.dart';
import 'package:bloc_shop_app/features/shop/service/product_service.dart';
import 'package:http/http.dart' show Client;

class ProductAppService extends ProductService {
  final client = Client();
  final baseUrl =
      'https://flutter-shop-ab08f-default-rtdb.firebaseio.com/products.json';

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final response = await client.get(Uri.parse(baseUrl));
    final responseAsJson = jsonDecode(response.body) as Map<String, dynamic>;

    final List<ProductModel> loadedProducts = [];
    responseAsJson.forEach((prodId, prodData) {
      loadedProducts.add(ProductModel(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          imageURL: prodData['imageURL']));
    });

    print(loadedProducts.toString());

    return loadedProducts;
  }
}
