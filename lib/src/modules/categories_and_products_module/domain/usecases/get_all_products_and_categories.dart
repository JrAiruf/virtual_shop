import 'package:virtual_shop/src/modules/categories_and_products_module/errors/product_errors.dart';

import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/products_entities.dart';

import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/categories_entity.dart';

import 'package:dartz/dartz.dart';

import '../../errors/category_error.dart';
import '../repositories/icategories_products_repo.dart';
import 'iget_categories_and_products.dart';

class GetProductsAndCategories implements IGetCategoriesAndProducts {
  GetProductsAndCategories({required this.repository});

  final ICategoriesProductsRepo repository;

  @override
  Future<Either<ProductModuleErrors, List<CategoryEntity>?>>?
      getAllCategories() async {
    final result = await repository.getAllCategories();
    if (result != null) {
      return Future.value(repository.getAllCategories());
    }
    return Left(CategoryError());
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(
      String? category) {
    // TODO: implement getAllProducts
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
      String? category, String? productId) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? createProduct(
      Map<String, dynamic>? product, String? category) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(
      String? category, String? productId) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
}
