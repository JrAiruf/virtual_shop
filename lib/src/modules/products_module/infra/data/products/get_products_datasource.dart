import 'package:virtual_shop_project/src/modules/products_module/domain/entities/products_entities.dart';
import 'package:virtual_shop_project/src/modules/products_module/infra/models/product_model.dart';

abstract class GetProductsDatasource {
  Future<List<ProductModel>>? getAllProducts(String? category);
  Future<List<ProductModel>>? deleteProducts(String? productId);
  Future<ProductModel>? getProductById(String? id);
  Future<List<ProductModel>>? createProduct(String? category);
}
