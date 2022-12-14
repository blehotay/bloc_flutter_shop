class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageURL;
  bool isFavorite;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageURL,
      this.isFavorite = false});
}
