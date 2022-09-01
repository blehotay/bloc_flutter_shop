import 'package:bloc_shop_app/features/shop/models/product_model.dart';
import 'package:bloc_shop_app/features/shop/screens/product_card.dart';
import 'package:bloc_shop_app/features/shop/screens/shop_screeen_state.dart';
import 'package:bloc_shop_app/features/shop/screens/shop_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopAppScreen extends StatelessWidget {
  const ShopAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopCubit>(
      create: (_) => ShopCubit(),
      child: BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
        if (state is ShopLoadedState) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Shop App'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.9 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ProductCard(product: product);
                  }),
            ),
          );
        } else if (state is ShopLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(color: Colors.red);
        }
      }),
    );
  }
}
