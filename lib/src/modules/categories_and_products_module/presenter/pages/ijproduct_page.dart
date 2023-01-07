import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/categories_entity.dart';
import '../../layout/components/product_tile.dart';
import '../ijcategory_products_bloc/ijcategories_and_products_states/ij_categories_and-proucts_states.dart';
import '../ijcategory_products_bloc/ijcategories_products_events/ijcategories_and_products_events.dart';
import '../ijcategory_products_bloc/ijcategory_products_bloc.dart';

class IJProductScreen extends StatelessWidget {
  IJProductScreen({super.key}) {
    bloc.add(IJGetAllProductsEvent(category: category));
  }

  final bloc = Modular.get<IJCategoriesProductsBloc>();
  final CategoryEntity category = Modular.args.data;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(category.title!),
          bottom: const TabBar(indicatorColor: Colors.black, tabs: [
            Tab(icon: Icon(Icons.grid_on)),
            Tab(icon: Icon(Icons.list)),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            height: height,
            width: width,
            child: TabBarView(
              children: [
                BlocBuilder(
                  bloc: bloc,
                  builder: (_, __) {
                    final productState = bloc.state;
                    if (productState is IJLoadingProductsState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (productState is IJErrorProductState) {
                      return const Center(child: Icon(Icons.error));
                    }
                    if (productState is IJGetAllProductsState) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 650,
                            width: width,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                childAspectRatio: 0.65,
                              ),
                              itemCount: productState.products!.length,
                              itemBuilder: (_, i) {
                                return ProductTile(
                                  product: productState.products![i],
                                  tileMode: TileMode.grid,
                                );
                              },
                            ),
                          ),
                          /* SizedBox(
                            height: 650,
                            width: width,
                            child: ListView.builder(
                              itemCount: productState.products!.length,
                              itemBuilder: (_, index) {
                                return SizedBox(
                                  height: height * 0.5,
                                  child: PageView(
                                    children: productState.products!
                                        .map(
                                          (items) => Image.network(
                                            items.images![2],
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                );
                              },
                            ),
                          ), 
                          SizedBox(
                            height: 650,
                            width: width,
                            child: ListView.builder(
                              itemCount: productState.products!.length,
                              itemBuilder: (_, index) {
                                return SizedBox(
                                  height: height * 0.5,
                                  child: PageView(
                                    children: productState.products!
                                        .map((items) => Image.network(
                                              items.images![2],
                                              fit: BoxFit.cover,
                                            ))
                                        .toList(),
                                  ),
                                );
                              },
                            ),
                          ), */
                        ],
                      );
                    }
                    return Container();
                  },
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
