import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop_project/src/modules/products_module/errors/product_errors.dart';
import 'package:virtual_shop_project/src/modules/products_module/infra/data/categories/get_categories_datasource.dart';
import 'package:virtual_shop_project/src/modules/products_module/infra/models/category_model.dart';
import 'package:virtual_shop_project/src/modules/products_module/infra/repositories/categories_repo/get_categories_repo_impl.dart';

class CategoryDataSourceMock extends Mock implements GetCategoriesDatasource {}

void main() {
  final datasource = CategoryDataSourceMock();
  final repository = GetCategoriesRepoImpl(categoriesDatasource: datasource);
   test('Should return a List<CategoryModel> (Get all method)', () async {
    when(datasource.getAllCategories(any))
        .thenAnswer((_) async => const <CategoryModel>[]);
    final result = await repository.getAllCategories('id');
    expect(result! | null, isA<List<CategoryModel>>());
  });
   test('Should return a ProductModuleErrors case fail', () async {
    when(datasource.getAllCategories(any))
        .thenThrow(Exception());
    final result = await repository.getAllCategories('');
    expect(result!.fold(id, id), isA<ProductModuleErrors>());
  });

  test('Should return a List<CategoryModel>', () async {
    when(datasource.getCategoryById(any))
        .thenAnswer((_) async => CategoryModel());
    final result = await repository.getCategoryById('id');
    expect(result! | null, isA<CategoryModel>());
  });
   test('Should return a ProductModuleErrors case fail', () async {
    when(datasource.getCategoryById(any))
        .thenThrow(Exception());
    final result = await repository.getCategoryById('zxvz');
    expect(result!.fold(id, id), isA<ProductModuleErrors>());
  });
}
