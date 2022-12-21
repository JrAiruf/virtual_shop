import 'package:virtual_shop_project/src/modules/products_module/domain/entities/products_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:virtual_shop_project/src/modules/products_module/domain/repositories/iget_products_repo.dart';
import 'package:virtual_shop_project/src/modules/products_module/errors/empty_product_error.dart';
import 'package:virtual_shop_project/src/modules/products_module/errors/product_errors.dart';

import 'iget_products.dart';

class GetAllProductsImpl implements IGetProducts {
  GetAllProductsImpl({required this.productsRepository});
  final IGetProductsRepo productsRepository;

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(
      String? category) async {
    if (category == null || category.isEmpty) {
      return Left(EmptyProductError());
    }
    return (Future.value(productsRepository.getAllProducts(category)));
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(
      String? productId) async {
    productsRepository.deleteProduct(productId);
    if (productId == null || productId.isEmpty) {
      return Left(ProductNotFound());
    }
    return (Future.value(productsRepository.deleteProduct(productId)));
  }

  @override
  Future<Either<ProductModuleErrors, ProductsEntity?>>? getProductById(
      String? productId) async {
    if (productId == null || productId.isEmpty) {
      await productsRepository.getProductById(productId);
      return Left(ProductNotFound());
    }
    return (Future.value(productsRepository.getProductById(productId)));
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? createProduct(
      String? productId) async {
    if (productId == null || productId.isEmpty) {
      await productsRepository.createProduct(productId);
      return Left(ProductNotFound());
    }
    return Future.value(productsRepository.createProduct(productId));
  }
}
