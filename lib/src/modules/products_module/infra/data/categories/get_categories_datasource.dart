import 'package:virtual_shop/src/modules/products_module/infra/models/category_model.dart';

abstract class GetCategoriesDatasource {
  Future<List<CategoryModel>>? getAllCategories();
  Future<CategoryModel>? getCategoryById(String? category);
}
