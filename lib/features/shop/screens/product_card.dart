import 'package:bloc_shop_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: Image.network(
          product.imageURL,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            onPressed: () {},
          ),
          title: Text(product.title),
          trailing: IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
