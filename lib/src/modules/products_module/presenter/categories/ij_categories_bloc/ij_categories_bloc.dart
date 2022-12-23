import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_shop/src/modules/products_module/domain/usecases/categories/iget_all_categories.dart';
import 'ij_categories_events/ij_categories_events.dart';
import 'ij_categories_states/ij_categories_states.dart';

class IJCategoriesBloc extends Bloc<IJCategoryEvents, IJCategoryStates> {
  IJCategoriesBloc({required this.usecase}) : super(IJInitialCategoryState()) {
    on<IJSelectCategoryEvent>(_mapIJSelectCategoryEventToState);
  }

  final IGetAllCategories usecase;

  void _mapIJSelectCategoryEventToState(
      IJSelectCategoryEvent event, Emitter<IJCategoryStates> emit) async {
    emit(IJLoadingCategoryState());
    final result = await usecase.getAllCategories(event.category!.id);
    result?.fold((l) => emit(IJErrorCategoryState(error: l)),
        (r) => emit(IJGetCategoryState(categories: r)));
  }
}
