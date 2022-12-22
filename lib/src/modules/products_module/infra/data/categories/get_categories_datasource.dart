import 'package:virtual_shop_project/src/modules/products_module/domain/entities/categories_entity.dart';
import 'package:virtual_shop_project/src/modules/products_module/infra/models/category_model.dart';

abstract class GetCategoriesDatasource {
  Future<List<CategoryModel>>? getAllCategories(String? category);
  Future<CategoryModel>? getCategoryById(String? category);
}
