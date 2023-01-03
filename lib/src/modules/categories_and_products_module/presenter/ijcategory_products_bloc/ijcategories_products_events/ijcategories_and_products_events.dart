// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/categories_and_products_module/infra/models/category_model.dart';

import '../../../infra/models/product_model.dart';

abstract class IJCategoryAndProductsEvents {}

class IJSelectCategoryEvent extends IJCategoryAndProductsEvents {
  IJSelectCategoryEvent({this.category});
  CategoryModel? category;
}


class IJInitialProductEvent implements IJCategoryAndProductsEvents {}

class IJCreateProductEvent implements IJCategoryAndProductsEvents {
  IJCreateProductEvent({this.product});
  ProductModel? product;
}

class IJGetProductEvent implements IJCategoryAndProductsEvents {}

class IJGetAllProductsEvent implements IJCategoryAndProductsEvents {
  IJGetAllProductsEvent({required this.category});
  String? category;
}

class IJDeleteProductEvent implements IJCategoryAndProductsEvents {}

class IJLoadCategoryEvent extends IJCategoryAndProductsEvents {}
