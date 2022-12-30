// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:virtual_shop/src/modules/products_module/domain/entities/categories_entity.dart';
import 'package:virtual_shop/src/modules/products_module/errors/product_errors.dart';
import 'package:virtual_shop/src/modules/products_module/infra/data/categories/get_categories_datasource.dart';
import '../../../domain/repositories/iget_categories_repo.dart';
import '../../../errors/category_error.dart';

class GetCategoriesRepoImpl implements IGetCategoriesRepo {
  GetCategoriesRepoImpl({required this.categoriesDatasource});

  GetCategoriesDatasource categoriesDatasource;
  @override
  Future<Either<ProductModuleErrors, List<CategoryEntity>?>>?
      getAllCategories() async {
    try {
      final result = await categoriesDatasource.getAllCategories();
      return Right(result);
    } catch (e) {
      return Left(CategoryError());
    }
  }

  @override
  Future<Either<ProductModuleErrors, CategoryEntity?>>? getCategoryById(
      String? categoryId) async {
    try {
      final result = await categoriesDatasource.getCategoryById(categoryId);
      return Right(result);
    } catch (e) {
      return Left(CategoryError());
    }
  }
}
