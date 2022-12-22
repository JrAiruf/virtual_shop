import 'package:virtual_shop_project/src/modules/products_module/infra/data/categories/get_categories_datasource.dart';

import '../../infra/models/category_model.dart';

class FirebaseCategoryDatabase implements GetCategoriesDatasource{
  @override
  Future<List<CategoryModel>>? getAllCategories(String? category) {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<CategoryModel>? getCategoryById(String? category) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }
}