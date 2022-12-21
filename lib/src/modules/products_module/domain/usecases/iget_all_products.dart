import 'package:dartz/dartz.dart';
import '../../errors/product_errors.dart';
import '../entities/products_entities.dart';

abstract class IGetAllProducts {
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(String? category);
}
