import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtual_shop_project/src/modules/products_module/infra/data/products/get_products_datasource.dart';

import '../../infra/models/product_model.dart';

class FirebaseProductDataBase implements GetProductsDatasource {
  final _database = FirebaseFirestore.instance;
  @override
  Future<List<ProductModel>>? createProduct(String? category) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>>? deleteProducts(String? productId) {
    // TODO: implement deleteProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>>? getAllProducts(String? category) {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<ProductModel>? getProductById(String? id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }
}
