import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/layout/components/ij_drawer.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/layout/ij_enums/ij_drawer_enum.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/presenter/ijcategory_products_bloc/ijcategories_and_products_states/ij_categories_and-proucts_states.dart';
import 'package:virtual_shop/src/modules/routes/ij_app_routes.dart';

import '../ijcategory_products_bloc/ijcategories_products_events/ijcategories_and_products_events.dart';
import '../ijcategory_products_bloc/ijcategory_products_bloc.dart';

class IJCategoryPage extends StatelessWidget {
  IJCategoryPage({super.key}) {
    bloc.add(IJLoadCategoryEvent());
  }

  final bloc = Modular.get<IJCategoriesProductsBloc>();
  final user = Modular.args;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: IJDrawerComponent(
          position: IJDrawerPosition.categories, myUser: user.data),
      appBar: AppBar(),
      body: Stack(
        children: [
          _buildBodyBack(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: BlocBuilder(
                bloc: bloc,
                builder: (_, __) {
                  final categoryState = bloc.state;
                  if (categoryState is IJLoadingCategoryState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (categoryState is IJErrorCategoryState) {
                    return const Center(child: Icon(Icons.error));
                  }
                  if (categoryState is IJLoadCategoryState) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 650,
                          child: ListView.builder(
                              itemCount: categoryState.categories!.length,
                              itemBuilder: (_, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: ListTile(
                                        onTap: (() {
                                          Navigator.of(context).pushReplacementNamed(
                                            IJAppRoutes.PRODUCTS,
                                            arguments: categoryState
                                                .categories![index],
                                          );
                                        }),
                                        trailing: ConstrainedBox(
                                          constraints: BoxConstraints.loose(
                                              const Size(95, 30)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(categoryState
                                                  .categories![index].title!),
                                              const Icon(Icons.arrow_right)
                                            ],
                                          ),
                                        ),
                                        leading: SizedBox(
                                          height: height * 0.075,
                                          width: width * 0.139,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            child: Image.network(
                                              categoryState.categories![index]
                                                  .iconimage!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 2,
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    );
                  }
                  return Container();
                }),
          ),
        ],
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
