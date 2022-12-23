import 'package:dartz/dartz.dart';
import '../../../errors/product_errors.dart';
import '../../entities/products_entities.dart';

abstract class IGetProducts {
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(String? category);
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(String? category, String? productId);
  Future<Either<ProductModuleErrors, ProductsEntity?>>? getProductById(String? category, String? productId);
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? createProduct(Map<String,dynamic>? product, String? category);
}
