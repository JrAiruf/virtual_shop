import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/domain/repositories/icategories_products_repo.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/external/ijdatabase_api.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/infra/repositories/ijcategories_products_repo_impl.dart';
import 'package:virtual_shop/src/modules/services/client_service.dart';

import '../domain/usecases/get_all_products_and_categories.dart';
import '../domain/usecases/iget_categories_and_products.dart';
import '../infra/data/ij_categories_and_products_datasource.dart';
import '../presenter/ijcategory_products_bloc/ijcategory_products_bloc.dart';

abstract class IJCategoriesAndProducts extends Module {

  static final List<Bind> dependencies = <Bind>[
    Bind(((i) => Dio())),
    Bind(((i) => DioService(dio: i()))),
    Bind<IJCategoriesAndProductsDatasource>(((i) => IJDatabaseApi(clientService: i()))),
    Bind<ICategoriesProductsRepo>(((i) => IJCategoriesProductsImpl(datasource: i()))),
    Bind<IGetCategoriesAndProducts>(((i) => GetProductsAndCategories(repository: i()))),
    Bind(((i) => IJCategoriesProductsBloc(usecase: i()))),

  ];
}