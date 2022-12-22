import 'package:virtual_shop/src/modules/products_module/infra/models/product_model.dart';

abstract class GetProductsDatasource {
  Future<List<ProductModel>>? getAllProducts(String? category);
  Future<List<ProductModel>>? deleteProducts(String? productId);
  Future<ProductModel>? getProductById(String? id);
  Future<List<ProductModel>>? createProduct(Map<String,dynamic>? product, String? collection);
}
