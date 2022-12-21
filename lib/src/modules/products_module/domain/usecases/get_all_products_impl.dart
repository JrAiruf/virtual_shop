import 'package:virtual_shop_project/src/modules/products_module/domain/entities/products_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:virtual_shop_project/src/modules/products_module/domain/repositories/iget_products_repo.dart';
import 'package:virtual_shop_project/src/modules/products_module/errors/empty_product_error.dart';
import 'package:virtual_shop_project/src/modules/products_module/errors/product_errors.dart';

import 'iget_all_products.dart';

class GetAllProductsImpl implements IGetAllProducts {
  GetAllProductsImpl({required this.repository});
  final IGetProductsRepo repository;
  
  @override
  Future<Either<ProductModuleErrors, List<ProductsEntity>?>>? getAllProducts(String? category) async {
     if (category == null || category.isEmpty) {
      return Left(EmptyProductError());
    }
    return (Future.value(repository.getAllProducts(category)));
  }

}
