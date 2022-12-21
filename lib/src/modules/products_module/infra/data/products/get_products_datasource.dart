import 'package:virtual_shop_project/src/modules/products_module/domain/entities/products_entities.dart';

abstract class GetProductsDatasource {
  Future<List<ProductsEntity>>? getAllProducts(String? category);
  Future<List<ProductsEntity>>? deleteProducts(String? productId);
  Future<ProductsEntity>? getProductById(String? id);
  Future<List<ProductsEntity>>? createProduct(String? category);
}
