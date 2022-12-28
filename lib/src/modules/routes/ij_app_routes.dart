// ignore_for_file: constant_identifier_names
import 'package:flutter/cupertino.dart';

abstract class IJAppRoutes {
  static const INITIAL = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const CREATEACCOUNT = '/createAccount';
  static const RECOVERYPASSWORD = '/recoveryPassword';
  static const CATEGORIES = '/categories';
  static const PRODUCTS = '/products';
  static const PRODUCTVIEW = '/productView';
  static const CARTPRODUCTS = '/cartProducts';
}

abstract class IJGeneralNavigation {
  static home({BuildContext? context, Object? args}) {
    Navigator.of(context!).pop();
    Navigator.of(context).pushNamed(IJAppRoutes.HOME, arguments: args);
  }

  static categories(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(IJAppRoutes.CATEGORIES);
  }

  static cart(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(IJAppRoutes.CATEGORIES);
  }

  static favorites(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(IJAppRoutes.CATEGORIES);
  }

  static nearbyStores(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(IJAppRoutes.CATEGORIES);
  }
}

abstract class IJLoginNavigation {
  static newUserHome(BuildContext context, {Object? args}) =>
      Navigator.of(context)
          .pushReplacementNamed(IJAppRoutes.HOME, arguments: args);
  static createUser(BuildContext context) =>
      Navigator.of(context).pushNamed(
        IJAppRoutes.CREATEACCOUNT,
      );
}
