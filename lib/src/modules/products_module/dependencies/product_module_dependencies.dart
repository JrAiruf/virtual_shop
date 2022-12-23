import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/products_module/domain/usecases/products/iget_products.dart';
import 'package:virtual_shop/src/modules/products_module/presenter/products/ij_products_bloc/ij_products_bloc.dart';
import '../domain/repositories/iget_products_repo.dart';
import '../domain/usecases/products/get_all_products_impl.dart';
import '../external/product_data/firebase_product_datasource.dart';
import '../infra/data/products/get_products_datasource.dart';
import '../infra/repositories/products_repo/get_products_repo_impl.dart';

abstract class ProductModuleDependencies extends Module {
  static final List<Bind> dependencies = <Bind>[
    Bind<GetProductsDatasource>((i)=> FirebaseProductDataBase()),
    Bind<IGetProductsRepo>((i)=> GetProductsRepoImpl(productsDatasource: i())),
    Bind<IGetProducts>((i)=> GetAllProductsImpl(productsRepository: i())),
    Bind((i)=> IJProductsBloc(usecase: i())),
  ];
}
