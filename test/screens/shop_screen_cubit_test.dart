import 'dart:async';

import 'package:bloc_shop_app/features/shop/models/product_model.dart';
import 'package:bloc_shop_app/features/shop/screens/shop_screeen_state.dart';
import 'package:bloc_shop_app/features/shop/screens/shop_screen_cubit.dart';
import 'package:bloc_shop_app/features/shop/service/product_repostitory.dart';
import 'package:bloc_shop_app/main.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

FutureOr<List<ProductModel>>? loadedProducts = [
  ProductModel(
      id: '1',
      title: 'Pants',
      description: 'Nice pair of pants',
      price: 50.00,
      imageURL: 'www.image.com')
];
void main() {
  late ProductRepository productRepository;

  setUp(() {
    productRepository = MockProductRepository();
    serviceLocator.registerSingleton<ProductRepository>(productRepository);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  blocTest<ShopCubit, ShopState>(
    "Should Return Product",
    setUp: () {
      when(() => productRepository.fetchProducts())
          .thenAnswer((_) => Future.value([]));
    },
    build: () => ShopCubit(),
    act: (bloc) => bloc.loadProduct(),
    expect: ()=> [
      isA<ShopLoadedState>()
        ..having(
            (state) => state.products,
            'Products as we expected',
            equals([ProductModel(
                id: '1',
                title: 'Pants',
                description: 'Nice pair of pants',
                price: 50.00,
                imageURL: 'www.image.com')],),
        ),],
  );
}
