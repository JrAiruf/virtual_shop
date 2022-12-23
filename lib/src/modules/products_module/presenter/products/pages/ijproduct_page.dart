import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/products_module/infra/models/product_model.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/products/ij_products_bloc/ij_products_bloc.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/products/ij_products_bloc/ij_products_events/ij_products_events.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/products/ij_products_bloc/ij_products_states/ij_products_states.dart';

class IJProductScreen extends StatelessWidget {
  IJProductScreen({super.key});

  final bloc = Modular.get<IJProductsBloc>();

  final product = ProductModel(
      category: 'camisetas',
      description: 'trem bão de mais',
      images: [
        "https://images.pexels.com/photos/581339/pexels-photo-581339.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/991509/pexels-photo-991509.jpeg?auto=compress&cs=tinysrgb&w=600",
        "https://images.pexels.com/photos/1656684/pexels-photo-1656684.jpeg?auto=compress&cs=tinysrgb&w=600",
      ],
      price: 54,
      size: ["XP", "PP", "P", "M", "G", "GG", "XG"],
      title: 'Camisaaa');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              bloc.add(IJCreateProductEvent(
                product: product,
              ));
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
