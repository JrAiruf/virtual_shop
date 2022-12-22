import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop/src/modules/products_module/errors/product_errors.dart';
import 'package:virtual_shop/src/modules/products_module/infra/data/products/get_products_datasource.dart';
import 'package:virtual_shop/src/modules/products_module/infra/models/product_model.dart';
import 'package:virtual_shop/src/modules/products_module/infra/repositories/products_repo/get_products_repo_impl.dart';

class ProductDataSourceMock extends Mock implements GetProductsDatasource {}

void main() {
  final datasource = ProductDataSourceMock();
  final repository = GetProductsRepoImpl(productsDatasource: datasource);
  test('Should return a List<ProductModel>', () async {
    when(datasource.deleteProducts(any))
        .thenAnswer((_) async => const <ProductModel>[]);
    final result = await repository.deleteProduct('id');
    expect(result! | null, isA<List<ProductModel>>());
  });
  test('Should return a ProductModuleErrors case fail', () async {
    when(datasource.deleteProducts(any)).thenThrow(Exception());
    final result = await repository.deleteProduct('id');
    expect(result!.fold(id, id), isA<ProductModuleErrors>());
  });
  test('Should return a List<ProductModel> (Get all method)', () async {
    when(datasource.getAllProducts(any))
        .thenAnswer((_) async => const <ProductModel>[]);
    final result = await repository.getAllProducts('id');
    expect(result! | null, isA<List<ProductModel>>());
  });
  test('Should return a ProductModuleErrors case fail', () async {
    when(datasource.getAllProducts(any)).thenThrow(Exception());
    final result = await repository.getAllProducts('');
    expect(result!.fold(id, id), isA<ProductModuleErrors>());
  });
  test('Should return a List<ProductModel>', () async {
    when(datasource.createProduct(any, any))
        .thenAnswer((_) async => const <ProductModel>[]);
    final result = await repository.createProduct({}, '');
    expect(result! | null, isA<List<ProductModel>>());
  });
  test('Should return a ProductModuleErrors case fail', () async {
    when(datasource.createProduct(any, any)).thenThrow(Exception());
    final result = await repository.createProduct({}, '');
    expect(result!.fold(id, id), isA<ProductModuleErrors>());
  });
  test('Should return a List<ProductModel>', () async {
    when(datasource.getProductById(any))
        .thenAnswer((_) async => ProductModel());
    final result = await repository.getProductById('id');
    expect(result! | null, isA<ProductModel>());
  });
  test('Should return a ProductModuleErrors case fail', () async {
    when(datasource.getProductById(any)).thenThrow(Exception());
    final result = await repository.getProductById('zxvz');
    expect(result!.fold(id, id), isA<ProductModuleErrors>());
  });
}
