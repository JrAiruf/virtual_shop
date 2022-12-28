import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/products_module/infra/models/category_model.dart';
import 'package:virtual_shop/src/modules/products_module/layout/components/ij_drawer.dart';
import 'package:virtual_shop/src/modules/products_module/layout/ij_enums/ij_drawer_enum.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/categories/ij_categories_bloc/ij_categories_bloc.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/categories/ij_categories_bloc/ij_categories_states/ij_categories_states.dart';

class IJCategoryPage extends StatelessWidget {
  IJCategoryPage({super.key});

  final category = CategoryModel(
    id: 'camisetas',
    title: 'Camisetas',
    items: [
      "https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=600",
      "https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=600",
      "https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=600",
    ],
    icon:
        "https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=600",
  );
  final bloc = Modular.get<IJCategoriesBloc>();
  final user = Modular.args;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: IJDrawerComponent(position: IJDrawerPosition.categories,myUser: user.data),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            _buildBodyBack(),
            BlocBuilder(
                bloc: bloc,
                builder: (_, __) {
                  final categoryState = bloc.state;
                  if (categoryState is IJErrorCategoryState) {
                    return const Center(child: Icon(Icons.error));
                  }
                  if (categoryState is IJLoadingCategoryState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (categoryState is IJLoadCategoryState) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 650,
                          child: ListView.builder(
                              itemCount: categoryState.categories!.length,
                              itemBuilder: (_, index) {
                                return ListTile(
                                  trailing: ConstrainedBox(
                                    constraints: BoxConstraints.loose(
                                        const Size(95, 30)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(categoryState
                                            .categories![0].title!),
                                        const Icon(Icons.arrow_right)
                                      ],
                                    ),
                                  ),
                                  leading: SizedBox(
                                    height: height * 0.075,
                                    width: width * 0.139,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(35),
                                      child: Image.network(
                                        categoryState.categories![0].icon!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    );
                  }
                  return Container();
                }),
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
