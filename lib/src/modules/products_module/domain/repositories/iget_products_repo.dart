import 'package:dartz/dartz.dart';
import '../../errors/product_errors.dart';
import '../entities/products_entities.dart';

abstract class IGetProductsRepo {
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(String? category);
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(String? category);
  Future<Either<ProductModuleErrors, ProductsEntity?>>? getProductById(String? productId);
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? createProduct(String? productId);
}
