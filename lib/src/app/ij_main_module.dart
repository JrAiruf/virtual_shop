import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/home_module/dependencies/appImagesDependencies.dart';
import 'package:virtual_shop/src/modules/home_module/presenter/pages/ij_home_page.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/pages/ij_login_page.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/pages/ij_signup_page.dart';
import '../modules/categories_and_products_module/dependencies/ijcategories_and_products_dependencies.dart';
import '../modules/categories_and_products_module/presenter/pages/ij_category_page.dart';
import '../modules/login_module/dependencies/login_dependencies.dart';
import '../modules/categories_and_products_module/presenter/pages/ijproduct_page.dart';
import '../modules/routes/ij_app_routes.dart';

class IJMainModule extends Module {
  @override
  List<Bind> get binds => [
        ...AppImagesDependencies.dependencies,
        ...IJCategoriesAndProducts.dependencies,
        ...LoginDependencies.dependencies,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => IJLoginPage()),
        ChildRoute(IJAppRoutes.HOME, child: (_, __) => IJHome()),
        ChildRoute(IJAppRoutes.PRODUCTS, child: (_, __) => IJProductScreen()),
        ChildRoute(IJAppRoutes.CREATEACCOUNT, child: (_, __) => IJSignUpPage()),
        ChildRoute(IJAppRoutes.CATEGORIES, child: (_, __) => IJCategoryPage()),
      ];
}
