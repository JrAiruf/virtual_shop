import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop/src/modules/products_module/domain/entities/categories_entity.dart';
import 'package:virtual_shop/src/modules/products_module/domain/repositories/iget_categories_repo.dart';
import 'package:virtual_shop/src/modules/products_module/domain/usecases/categories/get_all_categories_impl.dart';

class GetProductsMock extends Mock implements IGetCategoriesRepo {}

void main() {
  final repository = GetProductsMock();
  final usecase = GetAllCategoriesImpl(categoriesRepo: repository);
  test('Should return a List<CategoryEntity>', () async {
    when(repository.getAllCategories(any))
        .thenAnswer((_) async => const Right(<CategoryEntity>[]));
    final result = await usecase.getAllCategories('category');
    expect(result! | null, isA<List<CategoryEntity>>());
  });
  test('Should return a CategoryEntity', () async {
    when(repository.getCategoryById(any))
        .thenAnswer((_) async => Right(CategoryEntity()));
    final result = await usecase.getCategoryById('id');
    expect(result! | null, isA<CategoryEntity>());
  });
}
