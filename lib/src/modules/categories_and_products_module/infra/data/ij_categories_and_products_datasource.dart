import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/categories_entity.dart';

import '../models/product_model.dart';
import '../models/category_model.dart';

abstract class IJCategoriesAndProductsDatasource {
  Future<List<CategoryModel>>? getAllCategories();
  Future<CategoryModel>? getCategoryById({CategoryModel? category});
  Future<List<ProductModel>>? getAllProducts({CategoryEntity? category});
  Future<List<ProductModel>>? deleteProducts(String? category, productId);
  Future<ProductModel>? getProductById(String? category, productId);
  Future<List<ProductModel>>? createProduct(Map<String,dynamic>? product, String? collection);
}