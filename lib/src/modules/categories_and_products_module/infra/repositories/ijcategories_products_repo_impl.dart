import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/products_entities.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/categories_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/errors/category_error.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/errors/product_errors.dart';
import '../../domain/repositories/icategories_products_repo.dart';
import '../../errors/empty_product_error.dart';
import '../data/ij_categories_and_products_datasource.dart';

class IJCategoriesProductsImpl implements ICategoriesProductsRepo {
  IJCategoriesProductsImpl({required this.datasource});

  final IJCategoriesAndProductsDatasource datasource;

  @override
  Future<Either<ProductModuleErrors, List<CategoryEntity>?>>?
      getAllCategories() async {
    final result = await datasource.getAllCategories();
    try {
      return Right(result);
    } catch (e) {
      return Left(CategoryError());
    }
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(
      String? category) async {
    try {
      final result = await datasource.getAllProducts(category);
      return Right(result);
    } catch (e) {
      return Left(ProductNotFound());
    }
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? createProduct(
      Map<String, dynamic>? product, String? category) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(
      String? category, productId) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<ProductModuleErrors, CategoryEntity?>>? getCategoryById(
      String? categoryId) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }

  @override
  Future<Either<ProductModuleErrors, ProductsEntity?>>? getProductById(
      String? category, productId) async {
    try {
      final result = await datasource.getProductById(category, productId);
      return Right(result);
    } catch (e) {
      return Left(ProductNotFound());
    }
  }
}
