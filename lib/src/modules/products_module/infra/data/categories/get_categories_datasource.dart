import 'package:virtual_shop_project/src/modules/products_module/domain/entities/categories_entity.dart';

abstract class GetCategoriesDatasource {
  Future<List<CategoryEntity>> getAllProducts(String category);
  Future<CategoryEntity> getProductById(String category);
}
