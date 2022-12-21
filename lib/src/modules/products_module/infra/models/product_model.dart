// ignore_for_file: overridden_fields, annotate_overrides
import 'package:virtual_shop_project/src/modules/products_module/domain/entities/products_entities.dart';

class ProductModel extends ProductsEntity {
  String? productId;
  String? category;
  String? title;
  String? description;
  List? images;
  int? price;
  List? size;

  ProductModel(
      {this.title,
      this.description,
      this.images,
      this.price,
      this.productId,
      this.category,
      this.size});
}
