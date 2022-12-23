import 'package:virtual_shop/src/modules/products_module/infra/models/product_model.dart';

abstract class GetProductsDatasource {
  Future<List<ProductModel>>? getAllProducts(String? category);
  Future<List<ProductModel>>? deleteProducts(String? category, productId);
  Future<ProductModel>? getProductById(String? category, productId);
  Future<List<ProductModel>>? createProduct(Map<String,dynamic>? product, String? collection);
}
