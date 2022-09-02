import 'package:bloc_shop_app/features/shop/screens/shop_screeen_state.dart';
import 'package:bloc_shop_app/features/shop/service/product_repostitory.dart';
import 'package:bloc_shop_app/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopCubit extends Cubit<ShopState> {
  final productRepo = serviceLocator<ProductRepository>();

  ShopCubit(): super(ShopLoadingState()) {
loadProduct();
  }
 void loadProduct() async {
    emit(ShopLoadingState());

    try {
      final products = await productRepo.fetchProducts();
      emit(ShopLoadedState(products: products));
    } catch (e) {
      emit(ShopErrorState());
    }
 }

}