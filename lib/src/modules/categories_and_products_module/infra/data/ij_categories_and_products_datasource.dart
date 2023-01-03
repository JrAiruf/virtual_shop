import '../models/product_model.dart';
import '../models/category_model.dart';

abstract class IJCategoriesAndProductsDatasource {
  Future<List<CategoryModel>>? getAllCategories();
  Future<CategoryModel>? getCategoryById(String? category);
  Future<List<ProductModel>>? getAllProducts(String? category);
  Future<List<ProductModel>>? deleteProducts(String? category, productId);
  Future<ProductModel>? getProductById(String? category, productId);
  Future<List<ProductModel>>? createProduct(Map<String,dynamic>? product, String? collection);
}