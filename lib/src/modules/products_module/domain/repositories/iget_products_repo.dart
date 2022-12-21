import 'package:dartz/dartz.dart';
import 'package:virtual_shop_project/src/modules/products_module/domain/entities/categories_entity.dart';
import '../../errors/product_errors.dart';
import '../entities/products_entities.dart';

abstract class IGetProductsRepo {
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(
      String? category);
}
