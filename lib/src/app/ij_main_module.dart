import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/application_images_module/presenter/pages/ij_home_page.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/categories/pages/ij_category_page.dart';
import '../modules/application_images_module/application_images_dependencies/AppImagesDependencies.dart';
import '../modules/products_module/dependencies/category_module_dependencies.dart';
import '../modules/products_module/dependencies/product_module_dependencies.dart';
import '../modules/products_module/presenter/products/pages/ijproduct_page.dart';
import '../routes/ij_app_routes.dart';

class IJMainModule extends Module {
  @override
  List<Bind> get binds => [
        ...AppImagesDependencies.dependencies,
        ...ProductModuleDependencies.dependencies,
        ...CategoryModuleDependencies.dependencies,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) =>  IJHome()),
        ChildRoute(IJAppRoutes.PRODUCTS, child: (_, __) =>  IJProductScreen()),
        ChildRoute(IJAppRoutes.CATEGORIES, child: (_, __) =>  IJCategoryPage()),
      ];
}
