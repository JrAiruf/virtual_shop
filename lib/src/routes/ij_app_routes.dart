// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

abstract class IJNavigation {
  static home(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(Modular.initialRoute);
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
