// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/categories_and_products_module/infra/models/product_model.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/infra/data/ij_categories_and_products_datasource.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/infra/models/category_model.dart';
import 'package:virtual_shop/src/modules/services/client_service.dart';

import '../errors/empty_product_error.dart';

class IJDatabaseApi implements IJCategoriesAndProductsDatasource {
  IJDatabaseApi({ClientService? clientService}) : _clientService = clientService!;
  final ClientService _clientService;

  static const _categoriesUrl = 'http://192.168.0.103:4466/categories';


  @override
  Future<List<CategoryModel>>? getAllCategories() async {
    final list = <CategoryModel>[];
    final categoriesList = await _clientService.get(_categoriesUrl);
    if (categoriesList.statusCode == 200) {
      for (final map in categoriesList.data) {
        final category = CategoryModel.fromMap(map);
        list.add(category);
      }
      return list;
    } else {
      throw ProductNotFound();
    }
  }

@override
  Future<List<ProductModel>>? getAllProducts(String? category) {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>>? createProduct(
      Map<String, dynamic>? product, String? collection) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

 

  

  @override
  Future<CategoryModel>? getCategoryById(String? category) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }

  @override
  Future<ProductModel>? getProductById(String? category, productId) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }
  
  @override
  Future<List<ProductModel>>? deleteProducts(String? category, productId) {
    // TODO: implement deleteProducts
    throw UnimplementedError();
  }
}
