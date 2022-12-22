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
      String? productId) async {
    try {
      final result = await productsDatasource.createProduct(productId);
      return Right(result);
    } catch (e) {
      return Left(EmptyProductError());
    }
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(
      String? productId) async {
    try {
      final result = await productsDatasource.deleteProducts(productId);
      return Right(result);
    } catch (e) {
      return Left(ProductNotFound());
    }
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(
      String? category) async {
    try {
      final result = await productsDatasource.getAllProducts(category);
      return Right(result);
    } catch (e) {
      return Left(ProductNotFound());
    }
  }

  @override
  Future<Either<ProductModuleErrors, ProductsEntity?>>? getProductById(
      String? productId) async {
    try {
      final result = await productsDatasource.getProductById(productId);
      return Right(result);
    } catch (e) {
      return Left(ProductNotFound());
    }
  }
}
