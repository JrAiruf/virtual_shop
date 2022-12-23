import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtual_shop/src/modules/application_images_module/external/errors/datasource_errors.dart';
import 'package:virtual_shop/src/modules/products_module/infra/data/products/get_products_datasource.dart';

import '../../infra/models/product_model.dart';

class FirebaseProductDataBase implements GetProductsDatasource {
  final _database = FirebaseFirestore.instance;
  @override
  Future<List<ProductModel>>? createProduct(
      Map<String, dynamic>? product, String? category) async {
    final productRef = _database.collection('products').doc(category);
    final newProduct = productRef.collection('items').doc();
    product!['productId'] = newProduct.id;
    await newProduct.set(product);
    final list = await productRef.collection('items').get();
    return list.docs.map((item) => ProductModel.fromMap(item.data())).toList();
  }

  @override
  Future<List<ProductModel>>? deleteProducts(
      String? category, productId) async {
    await _database
        .collection('products')
        .doc(category)
        .collection('items')
        .doc(productId)
        .delete();
    final result = await _database
        .collection('products')
        .doc(category)
        .collection('items')
        .get();
    return result.docs.map((e) => ProductModel.fromMap(e.data())).toList();
  }

  @override
  Future<List<ProductModel>>? getAllProducts(String? category) async {
    final result = await _database
        .collection('products')
        .doc(category)
        .collection('items')
        .get();
    if (result.docs.isNotEmpty) {
      return result.docs.map((e) => ProductModel.fromMap(e.data())).toList();
    } else {
      throw DatasourceErrors();
    }
  }

  @override
  Future<ProductModel>? getProductById(String? category, productId) async {
    final result = await _database
        .collection('products')
        .doc(category)
        .collection('items')
        .doc(productId)
        .get();
    return ProductModel.fromMap(result.data());
  }
}


/*  final productData = _database
        .collection('products')
        .doc(category)
        .collection('items')
        .doc();
    productData.set(product!);
    final list = await _database
        .collection('products')
        .doc(category)
        .collection('items').add(product);
     */