// ignore_for_file: overridden_fields, annotate_overrides
import 'package:virtual_shop/src/modules/products_module/domain/entities/categories_entity.dart';

class CategoryModel extends CategoryEntity {
  String? id;
  String? title;
  String? icon;

  CategoryModel({
    this.id,
    this.title,
    this.icon,
  });
}
