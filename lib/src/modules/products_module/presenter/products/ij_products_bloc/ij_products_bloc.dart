import 'package:bloc/bloc.dart';
import 'package:virtual_shop/src/modules/products_module/domain/usecases/products/iget_products.dart';
import 'ij_products_events/ij_products_events.dart';
import 'ij_products_states/ij_products_states.dart';

class IJProductsBloc extends Bloc<IJProductsEvents, IJProductsStates> {
  IJProductsBloc({required this.usecase}) : super(IJInitialProductsState()) {
    on<IJGetAllProductsEvent>(_mapGetAllProductsToState);
    on<IJCreateProductEvent>(_mapIJCreateProductEventToState);
  }

  final IGetProducts usecase;
  void _mapGetAllProductsToState(
      IJGetAllProductsEvent event, Emitter<IJProductsStates> emit) async {
    emit(IJGetAllProductsState());
    final result = await usecase.getAllProducts(event.category);
    result?.fold((error) => emit(IJErrorProductState(error: error)),
        (list) => emit(IJGetAllProductsState(products: list)));
  }

  void _mapIJCreateProductEventToState(
      IJCreateProductEvent event, Emitter<IJProductsStates> emit) async {
    emit(IJLoadingProductsState());
    final result = await usecase.createProduct(
        event.product!.toMap(), event.product!.category);
    emit(IJCreateProductState());
    result?.fold((l) => emit(IJErrorProductState()),
        (r) => emit(IJCreateProductState(productList: r)));
  }
}
