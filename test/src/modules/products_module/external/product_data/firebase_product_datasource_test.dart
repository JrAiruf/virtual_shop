import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop/src/modules/products_module/external/product_data/firebase_product_datasource.dart';
import 'package:virtual_shop/src/modules/products_module/infra/models/product_model.dart';

class DBProductsMock extends Mock implements FirebaseProductDataBase {}

void main() {
  final database = DBProductsMock();
  test('Should create a product and return a List<ProductModel>', () async {
    when(database.createProduct(any, any))
        .thenAnswer((_) async => <ProductModel>[]);

    final result = await database.createProduct({}, '');

    expect(result, isA<List<ProductModel>>());
  });
  test('Should delete a product and return a List<ProductModel>', () async {
    when(database.deleteProducts(any, any))
        .thenAnswer((_) async => <ProductModel>[]);

    final result = await database.deleteProducts('', '');

    expect(result, isA<List<ProductModel>>());
  });
  test('Should return a List<ProductModel>', () async {
    when(database.getAllProducts(any))
        .thenAnswer((_) async => <ProductModel>[]);

    final result = await database.getAllProducts('');

    expect(result, isA<List<ProductModel>>());
  });
  test('Should return a ProductModel', () async {
    when(database.getProductById(any, any))
        .thenAnswer((_) async => ProductModel());

    final result = await database.getProductById('', '');

    expect(result, isA<ProductModel>());
  });
}
