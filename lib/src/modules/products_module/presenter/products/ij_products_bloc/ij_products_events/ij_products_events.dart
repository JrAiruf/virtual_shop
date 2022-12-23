// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/products_module/infra/models/product_model.dart';

abstract class IJProductsEvents {}

class IJInitialProductEvent implements IJProductsEvents {}

class IJCreateProductEvent implements IJProductsEvents {
  IJCreateProductEvent({this.product});
  ProductModel? product;
}

class IJGetProductEvent implements IJProductsEvents {}

class IJGetAllProductsEvent implements IJProductsEvents {
  IJGetAllProductsEvent({required this.category});
  String? category;
}

class IJDeleteProductEvent implements IJProductsEvents {}
