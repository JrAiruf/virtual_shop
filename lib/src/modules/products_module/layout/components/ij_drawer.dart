// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/products_module/layout/ij_enums/ij_drawer_enum.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/categories/ij_categories_bloc/ij_categories_bloc.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/categories/ij_categories_bloc/ij_categories_events/ij_categories_events.dart';
import 'package:virtual_shop/src/routes/ij_app_routes.dart';
import '../../domain/entities/categories_entity.dart';
import '../commons/ij_drawer_tile.dart';

class IJDrawerComponent extends StatelessWidget {
  IJDrawerComponent({Key? key, required this.position}) : super(key: key);

  final bloc = Modular.get<IJCategoriesBloc>();
  CategoryEntity? category;
  final IJDrawerPosition position;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
      child: Drawer(
        width: width * 0.7,
        child: Stack(
          children: [
            _buildBodyBack(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: SizedBox(
                      height: height * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'IJ Store',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 40),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Olá, Júnior!',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IJDrawerTile(
                    name: 'Página Inicial',
                    onTap: () => IJNavigation.home(context),
                    position: position,
                    icon: Icons.home_outlined,
                    width: 150,
                    height: 75,
                    iconColor: Colors.black,
                    backgroundColor: Colors.white,
                    primaryColor: position == IJDrawerPosition.home
                        ? Colors.black
                        : Colors.white,
                    seccundaryColor: position == IJDrawerPosition.home
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IJDrawerTile(
                    name: 'Categorias',
                    onTap: () {
                      bloc.add(IJLoadCategoryEvent());
                      IJNavigation.categories(context);
                    },
                    position: position,
                    icon: Icons.list_alt,
                    width: 150,
                    height: 75,
                    iconColor: Colors.black,
                    backgroundColor: Colors.white,
                    primaryColor: position == IJDrawerPosition.categories
                        ? Colors.black
                        : Colors.white,
                    seccundaryColor: position == IJDrawerPosition.categories
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  /*     IJDrawerTile(
                    name: 'Meu Carrinho',
                    position: position,
                    icon: Icons.shopping_cart_outlined,
                    width: 150,
                    height: 75,
                    primaryColor:
                    position == IJDrawerPosition.cart ? Colors.black : null,
                    seccundaryColor:
                    position == IJDrawerPosition.cart ? Colors.grey : null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IJDrawerTile(
                    name: 'Favoritos',
                    position: position,
                    icon: Icons.star_border,
                    width: 150,
                    height: 75,
                    primaryColor:
                    position == IJDrawerPosition.favorites ? Colors.black : null,
                    seccundaryColor:
                    position == IJDrawerPosition.favorites ? Colors.grey : null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IJDrawerTile(
                    name: 'Lojas Próximas',
                    position: position,
                    icon: Icons.shop_two_outlined,
                    width: 150,
                    height: 75,
                    primaryColor:
                    position == IJDrawerPosition.nearbyStores ? Colors.black : null,
                    seccundaryColor:
                    position == IJDrawerPosition.nearbyStores ? Colors.grey : null,
                  ), */
                  const SizedBox(
                    height: 75,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.exit_to_app_outlined,
                          size: 35,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          'Sair',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
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
