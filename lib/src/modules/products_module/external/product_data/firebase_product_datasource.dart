import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtual_shop/src/modules/products_module/infra/data/products/get_products_datasource.dart';

import '../../infra/models/product_model.dart';

class FirebaseProductDataBase implements GetProductsDatasource {
  final _database = FirebaseFirestore.instance;
  @override
  Future<List<ProductModel>>? createProduct(
      Map<String, dynamic>? product, String? collection) async {
    final productData = _database
        .collection('products')
        .doc(collection)
        .collection('items')
        .doc();
    product!['id'] = productData.id;
    productData.set(product);
    final list =
        await _database.collection('products').doc(collection).collection('items').get();
    return list.docs.map((e) => ProductModel.fromMap(e.data())).toList();
  }

  @override
  Future<List<ProductModel>>? deleteProducts(String? productId) async {
    await _database.collection('products').doc(productId).delete();
    final result = await _database.collection('products').get();
    return result.docs.map((e) => ProductModel.fromMap(e.data())).toList();
  }

  @override
  Future<List<ProductModel>>? getAllProducts(String? category) async {
    final result = await _database.collection('products').get();
    return result.docs.map((e) => ProductModel.fromMap(e.data())).toList();
  }

  @override
  Future<ProductModel>? getProductById(String? id) async {
    final result = await _database.collection('products').doc(id).get();
    return ProductModel.fromMap(result.data());
  }
}
