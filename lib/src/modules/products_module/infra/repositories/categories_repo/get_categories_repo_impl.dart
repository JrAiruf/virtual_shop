import 'package:virtual_shop_project/src/modules/products_module/domain/entities/categories_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:virtual_shop_project/src/modules/products_module/errors/product_errors.dart';

import '../../../domain/repositories/iget_categories_repo.dart';

class GetCategoriesRepoImpl implements IGetCategoriesRepo{
  @override
  Future<Either<ProductModuleErrors, List<CategoryEntity>?>>? getAllCategories(String? category) {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<ProductModuleErrors, CategoryEntity?>>? getCategoryById(String? categoryId) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }
}