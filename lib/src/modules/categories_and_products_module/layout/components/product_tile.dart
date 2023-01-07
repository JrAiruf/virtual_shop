// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/domain/entities/products_entities.dart';

class ProductTile extends StatelessWidget {
  ProductTile({super.key, required this.tileMode, required this.product});

  final TileMode tileMode;
  final ProductsEntity product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: tileMode == TileMode.grid
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(
                      product.images!.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                          Text(
                            "R\$${product.price!.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Row(),
      ),
    );
  }
}

enum TileMode { list, grid }
