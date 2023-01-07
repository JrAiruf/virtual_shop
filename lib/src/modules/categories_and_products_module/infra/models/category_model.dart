// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
// ignore_for_file: overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/categories_entity.dart';

class CategoryModel implements CategoryEntity {
  String? categoryid;
  String? title;
  String? iconimage;
  List? items;
  
  CategoryModel({this.categoryid, this.title, this.iconimage, this.items});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryid': categoryid,
      'title': title,
      'iconimage': iconimage,
      'items': items,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryid: map['categoryid'] != null ? map['categoryid'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      iconimage: map['iconimage'] != null ? map['iconimage'] as String : null,
      items: map['items'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
