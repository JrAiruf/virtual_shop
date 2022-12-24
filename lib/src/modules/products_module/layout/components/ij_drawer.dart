// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/products_module/layout/ij_enums/ij_drawer_enum.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/categories/ij_categories_bloc/ij_categories_bloc.dart';
import '../../domain/entities/categories_entity.dart';
import '../commons/ij_drawer_tile.dart';

class IJDrawerComponent extends StatelessWidget {
  IJDrawerComponent({Key? key}) : super(key: key);

  final bloc = Modular.get<IJCategoriesBloc>();
  CategoryEntity? category;
  IJDrawerPosition? position;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      child: Drawer(
        elevation: 15,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),
        width: width * 0.7,
        child: Stack(
          children: [
            _buildBodyBack(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: const [
                  SizedBox(
                    height: 45,
                  ),
                  IJDrawerTile(
                      position: IJDrawerPosition.home, icon: Icons.home),
                  Divider(),
                  SizedBox(
                    height: 45,
                  ),
                  IJDrawerTile(
                      position: IJDrawerPosition.categories,
                      icon: Icons.list_alt),
                  Divider(),
                  SizedBox(
                    height: 45,
                  ),
                  IJDrawerTile(
                    position: IJDrawerPosition.cart,
                    icon: Icons.shopping_cart_outlined,
                  ),
                  Divider(),
                  SizedBox(
                    height: 45,
                  ),
                  IJDrawerTile(
                    position: IJDrawerPosition.nearbyStores,
                    icon: Icons.shop_two_outlined,
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildBodyBack() {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white,
          Colors.white,
          Colors.grey,
        ],
      ),
    ),
  );
}
