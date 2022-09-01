import 'package:bloc_shop_app/features/shop/models/product_model.dart';
import 'package:equatable/equatable.dart';



abstract class ShopState extends Equatable{}

class ShopLoadedState extends ShopState {
  final List<ProductModel> products;

  ShopLoadedState({ required this.products});

  @override
  List<Object?> get props => [products];

}

class ShopLoadingState extends ShopState {
  @override
  List<Object?> get props => [];
}

class ShopErrorState extends ShopState {
  @override
  List<Object?> get props => [];
}