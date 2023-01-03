// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/products_entities.dart';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'category': category,
      'title': title,
      'description': description,
      'images': images,
      'price': price,
      'size': size,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic>? map) {
    return ProductModel(
      productId:map!['productId'],
      category:map['category'] != null ? map['category'] as String : null,
      title:map['title'] != null ? map['title'] as String : null,
      description:map['description'] != null ? map['description'] as String : null,
      images:map['images'],
      price:map['price'] != null ? map['price'] as int : null,
      size:map['size'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
