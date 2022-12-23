import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/products_module/external/category_data/firebase_category_datasource.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/categories/ij_categories_bloc/ij_categories_bloc.dart';

import '../domain/repositories/iget_categories_repo.dart';
import '../domain/usecases/categories/get_all_categories_impl.dart';
import '../domain/usecases/categories/iget_all_categories.dart';
import '../infra/data/categories/get_categories_datasource.dart';
import '../infra/repositories/categories_repo/get_categories_repo_impl.dart';

abstract class CategoryModuleDependencies extends Module {
  static final List<Bind> dependencies = <Bind>[
    Bind<GetCategoriesDatasource>(((i) => FirebaseCategoryDatabase())),
    Bind<IGetCategoriesRepo>(((i) => GetCategoriesRepoImpl(categoriesDatasource: i()))),
    Bind<IGetAllCategories>(((i) => GetAllCategoriesImpl(categoriesRepo: i()))),
    Bind(((i) => IJCategoriesBloc(usecase: i()))),
  ];
}
