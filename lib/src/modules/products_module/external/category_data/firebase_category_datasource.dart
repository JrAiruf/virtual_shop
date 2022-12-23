import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtual_shop/src/modules/products_module/errors/empty_product_error.dart';
import 'package:virtual_shop/src/modules/products_module/infra/data/categories/get_categories_datasource.dart';
import '../../infra/models/category_model.dart';

class FirebaseCategoryDatabase implements GetCategoriesDatasource {
  final _database = FirebaseFirestore.instance;
  @override
  Future<List<CategoryModel>>? getAllCategories(String? category) async {
    final result = await _database.collection('products').get();
    if (result.docs.isNotEmpty) {
      return result.docs
          .map((item) => CategoryModel.fromMap(item.data()))
          .toList();
    } else {
      throw ProductNotFound();
    }
  }

  @override
  Future<CategoryModel>? getCategoryById(String? category) async {
    final result = await _database.collection('products').doc(category).get();
    final myCategory = result.data();
    return CategoryModel.fromMap(myCategory!);
  }
}
