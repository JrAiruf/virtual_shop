import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop_project/src/modules/products_module/domain/entities/products_entities.dart';
import 'package:virtual_shop_project/src/modules/products_module/domain/repositories/iget_products_repo.dart';
import 'package:virtual_shop_project/src/modules/products_module/domain/usecases/get_all_products_impl.dart';

class GetProductsMock extends Mock implements IGetProductsRepo{}

void main() {
   final repository = GetProductsMock();
  final usecase = GetAllProductsImpl(productsRepository: repository);
   test('Should return a List<ProductsEntity>', () async {
    when(repository.getAllProducts(any))
        .thenAnswer((_) async => const Right(<ProductsEntity>[]));
    final result = await usecase.getAllProducts('category');
    expect(result! | null, isA<List<ProductsEntity>>());
  });
   test('Should return a List<ProductsEntity>', () async {
    when(repository.deleteProduct(any))
        .thenAnswer((_) async => const Right(<ProductsEntity>[]));
    final result = await usecase.deleteProduct('id');
    expect(result! | null, isA<List<ProductsEntity>>());
  });
   test('Should return a ProductsEntity', () async {
    when(repository.getProductById(any))
        .thenAnswer((_) async => Right(ProductsEntity()));
    final result = await usecase.getProductById('id');
    expect(result! | null, isA<ProductsEntity>());
  });
   test('Should add a product to List<ProductsEntity>', () async {
    when(repository.createProductById(any))
        .thenAnswer((_) async => const Right(<ProductsEntity>[]));
    final result = await usecase.createProductById('id');
    expect(result! | null, isA<ProductsEntity>());
  });
}