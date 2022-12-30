// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/products_module/infra/models/category_model.dart';
import 'package:virtual_shop/src/modules/services/client_service.dart';
import '../../errors/empty_product_error.dart';
import '../../infra/data/categories/get_categories_datasource.dart';

class CategoryDatabaseApi implements GetCategoriesDatasource {
  CategoryDatabaseApi({required this.clientService});

  static const _categoriesUrl = 'http://192.168.0.101:4466/categories';

  final CLientService clientService;

  @override
  Future<List<CategoryModel>>? getAllCategories() async {
    final list = <CategoryModel>[];
    final categoriesList = await clientService.get(_categoriesUrl);
    if (categoriesList.statusCode == 200) {
      for (final map in categoriesList.data) {
        final category = CategoryModel.fromMap(map);
        list.add(category);
      }
      return list;
    } else {
      throw ProductNotFound();
    }
  }

  @override
  Future<CategoryModel>? getCategoryById(String? category) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }
}
