import 'categories_entity.dart';

class ProductsEntity {
  String? productId;
  CategoryEntity? category;
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
