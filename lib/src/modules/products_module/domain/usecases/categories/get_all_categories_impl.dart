// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:virtual_shop/src/modules/products_module/domain/entities/categories_entity.dart';
import 'package:virtual_shop/src/modules/products_module/domain/repositories/iget_categories_repo.dart';
import 'package:virtual_shop/src/modules/products_module/domain/usecases/categories/iget_all_categories.dart';
import 'package:virtual_shop/src/modules/products_module/errors/product_errors.dart';

import '../../../errors/category_error.dart';

class GetAllCategoriesImpl implements IGetAllCategories {
  GetAllCategoriesImpl({required this.categoriesRepo});

  IGetCategoriesRepo categoriesRepo;
  @override
  Future<Either<ProductModuleErrors, List<CategoryEntity>?>>?
      getAllCategories() async {
    final result = await categoriesRepo.getAllCategories();
    if (result != null) {
      return Future.value(categoriesRepo.getAllCategories());
    }
    return Left(CategoryError());
  }

  @override
  Future<Either<ProductModuleErrors, CategoryEntity?>>? getCategoryById(
      String? categoryId) async {
    await categoriesRepo.getCategoryById(categoryId);
    if (categoryId == null || categoryId.isEmpty) {
      return Left(CategoryError());
    }
    return (Future.value(categoriesRepo.getCategoryById(categoryId)));
  }
}
