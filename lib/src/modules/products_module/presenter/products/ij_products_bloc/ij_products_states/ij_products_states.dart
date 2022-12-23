// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/products_module/domain/entities/products_entities.dart';
import 'package:virtual_shop/src/modules/products_module/errors/product_errors.dart';

abstract class IJProductsStates {}

class IJInitialProductsState implements IJProductsStates {}

class IJLoadingProductsState implements IJProductsStates {}

class IJGetProductState implements IJProductsStates {}

class IJCreateProductState implements IJProductsStates {
  IJCreateProductState( {this.product, this.productList});
  ProductsEntity? product;
  List<ProductsEntity>? productList;
}

class IJGetAllProductsState implements IJProductsStates {
  IJGetAllProductsState({this.products});
  List<ProductsEntity>? products;
}

class IJErrorProductState implements IJProductsStates {
  IJErrorProductState({this.error});
  final ProductModuleErrors? error;
}
