import 'package:virtual_shop/src/modules/products_module/infra/data/categories/get_categories_datasource.dart';

import '../../infra/models/category_model.dart';

class FirebaseCategoryDatabase implements GetCategoriesDatasource {
  @override
  Future<List<CategoryModel>>? getAllCategories(String? category) {
    /*   final result = await _database.collection('products').get();
    return result.docs.map((e) => ProductModel.fromMap(e.data())).toList(); */
  }

  @override
  Future<CategoryModel>? getCategoryById(String? category) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }
}
