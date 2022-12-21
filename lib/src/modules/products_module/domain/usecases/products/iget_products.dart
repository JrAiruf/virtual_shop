import 'package:dartz/dartz.dart';
import '../../../errors/product_errors.dart';
import '../../entities/products_entities.dart';

abstract class IGetProducts {
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(String? category);
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(String? productId);
  Future<Either<ProductModuleErrors, ProductsEntity?>>? getProductById(String? productId);
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? createProduct(String? productId);
}
