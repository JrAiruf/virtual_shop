import 'package:virtual_shop/src/modules/categories_and_products_module/infra/models/category_model.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/infra/models/product_model.dart';
import 'package:virtual_shop/src/modules/services/client_service.dart';

import '../infra/data/ij_categories_and_products_datasource.dart';

class ProductsDatabaseApi implements IJCategoriesAndProductsDatasource {
  ProductsDatabaseApi({required ClientService? clientService})
      : _clientService = clientService!;
  final ClientService _clientService;
  static const _apiproductUrl = 'http://192.168.0.103:4466/categoryProduct/:id';
  @override
  Future<List<ProductModel>>? createProduct(
      Map<String, dynamic>? product, String? collection) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>>? deleteProducts(String? category, productId) {
    // TODO: implement deleteProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>>? getAllProducts(String? category) async {
    final result = await _clientService.get('http://192.168.0.103:4466/categoryProduct/$category');
    final body = result.data as List;
    return body.map((item) => ProductModel.fromMap(item)).toList();
  }

  @override
  Future<ProductModel>? getProductById(String? category, productId) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryModel>>? getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<CategoryModel>? getCategoryById(String? category) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }
}
