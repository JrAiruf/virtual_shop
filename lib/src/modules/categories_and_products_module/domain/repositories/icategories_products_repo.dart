import 'package:dartz/dartz.dart';
import '../../errors/product_errors.dart';
import '../entities/categories_entity.dart';
import '../entities/products_entities.dart';

abstract class ICategoriesProductsRepo {
  Future<Either<ProductModuleErrors, List<CategoryEntity>?>>? getAllCategories();
Future<Either<ProductModuleErrors, CategoryEntity?>>? getCategoryById(String? categoryId);
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts({CategoryEntity category});
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(
      String? category, productId);
  Future<Either<ProductModuleErrors, ProductsEntity?>>? getProductById(
      String? category, productId);
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? createProduct(
      Map<String, dynamic>? product, String? category);
}