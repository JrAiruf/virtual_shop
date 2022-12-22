import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop/src/modules/products_module/domain/entities/products_entities.dart';
import 'package:virtual_shop/src/modules/products_module/domain/repositories/iget_products_repo.dart';
import 'package:virtual_shop/src/modules/products_module/domain/usecases/products/get_all_products_impl.dart';

class GetProductsMock extends Mock implements IGetProductsRepo {}

void main() {
  final repository = GetProductsMock();
  final usecase = GetAllProductsImpl(productsRepository: repository);
  test('Should return a List<ProductsEntity>', () async {
    when(repository.getAllProducts(any, any))
        .thenAnswer((_) async => const Right(<ProductsEntity>[]));
    final result = await usecase.getAllProducts('asdf', 'asf');
    expect(result! | null, isA<List<ProductsEntity>>());
  });
  test('Should return a List<ProductsEntity>', () async {
    when(repository.deleteProduct(any, any))
        .thenAnswer((_) async => const Right(<ProductsEntity>[]));
    final result = await usecase.deleteProduct('asdf','adsf');
    expect(result! | null, isA<List<ProductsEntity>>());
  });
  test('Should return a ProductsEntity', () async {
    when(repository.getProductById(any, any))
        .thenAnswer((_) async => Right(ProductsEntity()));
    final result = await usecase.getProductById('asdf','adsf');
    expect(result! | null, isA<ProductsEntity>());
  });
  test('Should add a product to List<ProductsEntity>', () async {
    when(repository.createProduct(any, any))
        .thenAnswer((_) async => const Right(<ProductsEntity>[]));
    final result = await usecase.createProduct({"":""}, 'asdf');
    expect(result! | null, isA<List<ProductsEntity>>());
  });
}
