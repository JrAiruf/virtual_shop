import 'package:dartz/dartz.dart';
import '../../errors/product_errors.dart';
import '../entities/products_entities.dart';

abstract class IGetProductsRepo {
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(
      String? category);
}
