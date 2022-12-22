import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtual_shop/src/modules/products_module/infra/data/categories/get_categories_datasource.dart';
import '../../infra/models/category_model.dart';

class FirebaseCategoryDatabase implements GetCategoriesDatasource {
  final _database = FirebaseFirestore.instance;
  @override
  Future<List<CategoryModel>>? getAllCategories(String? category) async {
    final result = await _database
        .collection('products')
        .doc(category)
        .collection('items')
        .get();
    return result.docs.map((e) => CategoryModel.fromMap(e.data())).toList();
  }

  @override
  Future<CategoryModel>? getCategoryById(String? category) async {
    final result = _database.collection('products').doc(category);
    final categoryData = await result.get();
    return CategoryModel.fromMap(categoryData.data()!);
  }
}
