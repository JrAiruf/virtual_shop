class ProductsEntity {
  String? productId;
  String? category;
  String? title;
  String? description;
  List? images;
  int? price;
  List? size;

  ProductsEntity(
      {this.title,
      this.description,
      this.images,
      this.price,
      this.productId,
      this.category,
      this.size});
}