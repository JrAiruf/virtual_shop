// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/categories_entity.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/errors/category_error.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/infra/models/product_model.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/infra/data/ij_categories_and_products_datasource.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/infra/models/category_model.dart';
import 'package:virtual_shop/src/modules/services/client_service.dart';

import '../errors/empty_product_error.dart';

class IJDatabaseApi implements IJCategoriesAndProductsDatasource {
  IJDatabaseApi({ClientService? clientService})
      : _clientService = clientService!;
  final ClientService _clientService;

  static const _categoriesUrl = 'http://192.168.0.103:4466/categories';
  static const _productsUrl = 'http://192.168.0.103:4466/categories/products';
  static const _catProdUrl = 'http://192.168.0.103:4466/categoryProducts/:id';

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
  Future<List<ProductModel>>? getAllProducts({CategoryEntity? category}) async {
    try {
      final result = await _clientService.get(
          'http://192.168.0.103:4466/categoryProducts/${category!.categoryid}');
      if (result.statusCode == 200) {
        final list = result.data as List;
        return list.map((item) => ProductModel.fromMap(item["products"])).toList();
      }
      throw CategoryError();
    } on Exception catch (e) {
      throw CategoryError();
    }
  }

  @override
  Future<List<ProductModel>>? createProduct(
      Map<String, dynamic>? product, String? collection) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<CategoryModel>? getCategoryById({CategoryModel? category}) {
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
