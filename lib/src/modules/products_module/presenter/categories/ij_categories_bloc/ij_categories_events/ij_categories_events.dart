// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/products_module/infra/models/category_model.dart';

abstract class IJCategoryEvents {}

class IJSelectCategoryEvent extends IJCategoryEvents {
  IJSelectCategoryEvent({this.category});
  CategoryModel? category;
}

class IJLoadCategoryEvent extends IJCategoryEvents {}
