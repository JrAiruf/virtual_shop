import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/routes/ij_app_routes.dart';
import '../ijcategory_products_bloc/ijcategories_and_products_states/ij_categories_and-proucts_states.dart';
import '../ijcategory_products_bloc/ijcategory_products_bloc.dart';

class IJProductScreen extends StatelessWidget {
  IJProductScreen({super.key});

  final bloc = Modular.get<IJCategoriesProductsBloc>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
             /*  bloc.add(IJCreateProductEvent(
                product: product,
              )); */
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          height: height,
          width: width,
          child: BlocBuilder(
              bloc: bloc,
              builder: (_, __) {
                final productState = bloc.state;
                if (productState is IJErrorProductState) {
                  return const Center(child: Icon(Icons.error));
                }
                if (productState is IJLoadingProductsState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (productState is IJCreateProductState) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 650,
                        width: width,
                        child: ListView.builder(
                            itemCount: productState.productList!.length,
                            itemBuilder: (_, index) {
                              return SizedBox(
                                height: height * 0.5,
                                child: PageView(
                                  children: productState.productList!
                                      .map((items) => Image.network(
                                            items.images![3],
                                            fit: BoxFit.cover,
                                          ))
                                      .toList(),
                                ),
                              );
                            }),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(IJAppRoutes.CATEGORIES);
                        },
                        child: const Icon(Icons.library_add),
                      )
                    ],
                  );
                }
                return Container();
              }),
        ),
      ),
    );
  }
}
