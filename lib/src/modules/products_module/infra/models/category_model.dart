// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:virtual_shop/src/modules/products_module/domain/entities/categories_entity.dart';

class CategoryModel extends CategoryEntity {
  String? id;
  String? title;
  String? icon;
  List? items;

  CategoryModel({
    this.id,
    this.title,
    this.icon,
    this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'icon': icon,
      'items': items,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      items: map['items'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
