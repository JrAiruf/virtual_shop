import 'package:bloc/bloc.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/errors/category_error.dart';
import 'package:virtual_shop/src/modules/categories_and_products_module/presenter/ijcategory_products_bloc/ijcategories_and_products_states/ij_categories_and-proucts_states.dart';
import '../../domain/usecases/iget_categories_and_products.dart';
import 'ijcategories_products_events/ijcategories_and_products_events.dart';

class IJCategoriesProductsBloc
    extends Bloc<IJCategoryAndProductsEvents, IJCategoriesAndProductsStates> {
  IJCategoriesProductsBloc({required this.usecase})
      : super(IJInitialCategoryState()) {
    on<IJLoadCategoryEvent>(_mapGetAllCategoriesEventToState);
    on<IJGetAllProductsEvent>(_mapGetAllProductsToState);
    on<IJCreateProductEvent>(_mapIJCreateProductEventToState);
  }

  final IGetCategoriesAndProducts usecase;

  void _mapGetAllCategoriesEventToState(IJLoadCategoryEvent event,
      Emitter<IJCategoriesAndProductsStates> emit) async {
    emit(IJLoadingCategoryState());
    final result = await usecase.getAllCategories()!;
    result.fold((error) => IJErrorCategoryState(error: CategoryError()),
        (list) => emit(IJLoadCategoryState(categories: list)));
  }

  void _mapGetAllProductsToState(IJGetAllProductsEvent event,
      Emitter<IJCategoriesAndProductsStates> emit) async {
    emit(IJLoadingProductsState());
    final result = await usecase.getAllProducts(category: event.category);
    result?.fold((error) => emit(IJErrorProductState(error: error)),
        (list) => emit(IJGetAllProductsState(products: list)));
  }

  void _mapIJCreateProductEventToState(IJCreateProductEvent event,
      Emitter<IJCategoriesAndProductsStates> emit) async {
    emit(IJLoadingProductsState());
    final result = await usecase.createProduct(
        event.product!.toMap(), event.product!.category);
    emit(IJCreateProductState());
    result?.fold((l) => emit(IJErrorProductState()),
        (r) => emit(IJCreateProductState(productList: r)));
  }
}
