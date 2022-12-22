import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop/src/modules/products_module/external/category_data/firebase_category_datasource.dart';
import 'package:virtual_shop/src/modules/products_module/infra/models/category_model.dart';

class DBCategoryMock extends Mock implements FirebaseCategoryDatabase {}

void main() {
  final database = DBCategoryMock();
  test('Should return a List<CategoryModel>', () async {
    when(database.getAllCategories(any))
        .thenAnswer((_) async => <CategoryModel>[]);

    final result = await database.getAllCategories('');

    expect(result, isA<List<CategoryModel>>());
  });
  test('Should return a CategoryModel', () async {
    when(database.getCategoryById(any))
        .thenAnswer((_) async => CategoryModel());

    final result = await database.getCategoryById('');

    expect(result, isA<CategoryModel>());
  });
}
