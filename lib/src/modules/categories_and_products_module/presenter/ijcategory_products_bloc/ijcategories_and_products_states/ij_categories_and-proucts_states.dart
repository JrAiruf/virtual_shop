// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/categories_entity.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/errors/product_errors.dart';

import '../../../domain/entities/products_entities.dart';

abstract class IJCategoriesAndProductsStates {}

class IJInitialCategoryState extends IJCategoriesAndProductsStates {}

class IJLoadingCategoryState extends IJCategoriesAndProductsStates {}

class IJLoadCategoryState extends IJCategoriesAndProductsStates {
  IJLoadCategoryState({this.categories});
  List<CategoryEntity>? categories;
}

class IJErrorCategoryState extends IJCategoriesAndProductsStates {
  IJErrorCategoryState({required this.error});
  final ProductModuleErrors error;
}

class IJGetCategoryState extends IJCategoriesAndProductsStates {
  IJGetCategoryState({this.category});
  CategoryEntity? category;

}
class IJInitialProductsState implements IJCategoriesAndProductsStates {}

class IJLoadingProductsState implements IJCategoriesAndProductsStates {}

class IJGetProductState implements IJCategoriesAndProductsStates {}

class IJCreateProductState implements IJCategoriesAndProductsStates {
  IJCreateProductState( {this.product, this.productList});
  ProductsEntity? product;
  List<ProductsEntity>? productList;
}

class IJGetAllProductsState implements IJCategoriesAndProductsStates {
  IJGetAllProductsState({this.products});
  List<ProductsEntity>? products;
}

class IJErrorProductState implements IJCategoriesAndProductsStates {
  IJErrorProductState({this.error});
  final ProductModuleErrors? error;
}
