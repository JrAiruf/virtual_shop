import 'package:virtual_shop/src/modules/products_module/domain/entities/products_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:virtual_shop/src/modules/products_module/domain/repositories/iget_products_repo.dart';
import 'package:virtual_shop/src/modules/products_module/errors/empty_product_error.dart';
import 'package:virtual_shop/src/modules/products_module/errors/product_errors.dart';

import 'iget_products.dart';

class GetAllProductsImpl implements IGetProducts {
  GetAllProductsImpl({required this.productsRepository});
  final IGetProductsRepo productsRepository;

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(
      String? category, products) async {
    if (category == null || category.isEmpty) {
      if (products == null || products.isEmpty) {
      return Left(EmptyProductError());
      }
    }
    return (Future.value(productsRepository.getAllProducts(category, products)));
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(String? category, productId) async {
    productsRepository.deleteProduct(category,productId);
    if (category == null || category.isEmpty) {
    if (productId == null || productId.isEmpty) {
      return Left(ProductNotFound());  
    }
    
    }
    return (Future.value(productsRepository.deleteProduct(category, productId)));
  }

  @override
  Future<Either<ProductModuleErrors, ProductsEntity?>>? getProductById(
      String?category,  productId) async {
      if (category == null || category.isEmpty) {
    if (productId == null || productId.isEmpty) {
      return Left(ProductNotFound());  
    }
    
    }
    return (Future.value(productsRepository.getProductById(category, productId)));
  }

  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? createProduct(
      Map<String,dynamic>? producData, String? collection ) async {
    if (producData == null || producData.isEmpty) {
      return Left(ProductNotFound());
    }
    return Future.value(productsRepository.createProduct(producData, collection!));
  }
}
