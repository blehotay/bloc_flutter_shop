import 'package:bloc_shop_app/bloc_shop_app.dart';
import 'package:bloc_shop_app/features/shop/service/product_app_service.dart';
import 'package:bloc_shop_app/features/shop/service/product_repository_impl.dart';
import 'package:bloc_shop_app/features/shop/service/product_repostitory.dart';
import 'package:bloc_shop_app/features/shop/service/product_service.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';

GetIt serviceLocator = GetIt.instance;
void main() {
  _buildDependencyGraph();
  runApp(const BlocShopApp());
}

void _buildDependencyGraph() {
  serviceLocator
    ..registerSingleton<ProductService>(ProductAppService())
    ..registerSingleton<ProductRepository>(ProductRepositoryImpl(productService: serviceLocator<ProductService>()));
}
