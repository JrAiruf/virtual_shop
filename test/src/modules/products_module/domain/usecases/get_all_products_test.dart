import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop_project/src/modules/products_module/domain/entities/products_entities.dart';
import 'package:virtual_shop_project/src/modules/products_module/domain/repositories/iget_products_repo.dart';
import 'package:virtual_shop_project/src/modules/products_module/domain/usecases/get_all_products_impl.dart';
import 'package:virtual_shop_project/src/modules/products_module/errors/empty_product_error.dart';

class ProductRepoMock extends Mock implements IGetProductsRepo {}

void main() {
  final repository = ProductRepoMock();
  final usecase = GetAllProductsImpl(repository: repository);
  test('Should return a List<ProductsEntity>', () async {
    when(repository.getAllProducts(any))
        .thenAnswer((realInvocation) async => const Right(<ProductsEntity>[]));
    final result = await usecase.getAllProducts('category');
    expect(result! | null, isA<List<ProductsEntity>>());
  });
  test('Should return an ProductException', () async {
    when(repository.getAllProducts(any))
        .thenAnswer((realInvocation) async => const Right(<ProductsEntity>[]));
   var result = await usecase.getAllProducts(null);
    expect(result!.isLeft(), true);
    expect(result.fold(id, id), isA<EmptyProductError>());
    result = await usecase.getAllProducts("");
  });
}