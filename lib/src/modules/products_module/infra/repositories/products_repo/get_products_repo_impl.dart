// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:virtual_shop/src/modules/products_module/domain/entities/products_entities.dart';
import 'package:virtual_shop/src/modules/products_module/domain/repositories/iget_products_repo.dart';
import 'package:virtual_shop/src/modules/products_module/errors/product_errors.dart';

import '../../../errors/empty_product_error.dart';
import '../../data/products/get_products_datasource.dart';

class GetProductsRepoImpl implements IGetProductsRepo {
  GetProductsRepoImpl({
    required this.productsDatasource,
  });

  GetProductsDatasource productsDatasource;

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? createProduct(
      Map<String,dynamic>? product, String? category) async {
    try {
      final result = await productsDatasource.createProduct(product, category!);
      return Right(result);
    } catch (e) {
      return Left(EmptyProductError());
    }
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(
      String?category, productId) async {
    try {
      final result = await productsDatasource.deleteProducts(category, productId);
      return Right(result);
    } catch (e) {
      return Left(ProductNotFound());
    }
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(
      String? category, productId) async {
    try {
      final result = await productsDatasource.getAllProducts(category, productId);
      return Right(result);
    } catch (e) {
      return Left(ProductNotFound());
    }
  }

  @override
  Future<Either<ProductModuleErrors, ProductsEntity?>>? getProductById(
      String? category, productId) async {
    try {
      final result = await productsDatasource.getProductById(category, productId);
      return Right(result);
    } catch (e) {
      return Left(ProductNotFound());
    }
  }
}
