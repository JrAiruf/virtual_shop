// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/products_module/domain/entities/categories_entity.dart';
import 'package:virtual_shop/src/modules/products_module/errors/product_errors.dart';

abstract class IJCategoryStates {}

class IJInitialCategoryState extends IJCategoryStates {}

class IJLoadingCategoryState extends IJCategoryStates {}

class IJErrorCategoryState extends IJCategoryStates {
  IJErrorCategoryState({required this.error});
  final ProductModuleErrors error;
}

class IJGetCategoryState extends IJCategoryStates {
  IJGetCategoryState({this.categories, this.category});
  CategoryEntity? category;
  List<CategoryEntity>? categories;
}
