import 'package:dartz/dartz.dart';
import '../../errors/product_errors.dart';
import '../entities/products_entities.dart';

abstract class IGetProductsRepo {
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(String? category , product);
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? deleteProduct(String?category ,  productId);
  Future<Either<ProductModuleErrors, ProductsEntity?>>? getProductById(String?category ,  productId);
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? createProduct(Map<String,dynamic>? product, String? category);
}
