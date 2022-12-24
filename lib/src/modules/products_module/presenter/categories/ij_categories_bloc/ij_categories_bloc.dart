import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtual_shop/src/modules/products_module/domain/usecases/categories/iget_all_categories.dart';
import 'ij_categories_events/ij_categories_events.dart';
import 'ij_categories_states/ij_categories_states.dart';

class IJCategoriesBloc extends Bloc<IJCategoryEvents, IJCategoryStates> {
  IJCategoriesBloc({IGetAllCategories? usecase})
      : _usecase = usecase!,
        super(IJInitialCategoryState()) {
    on<IJSelectCategoryEvent>(_mapIJSelectCategoryEventToState);
    on<IJLoadCategoryEvent>(_mapIJLoadCategoryEventToState);
  }

  final IGetAllCategories _usecase;

  void _mapIJLoadCategoryEventToState(
      IJLoadCategoryEvent event, Emitter<IJCategoryStates> emit) async {
    emit(IJLoadingCategoryState());
    final result = await _usecase.getAllCategories();
    result?.fold((l) => emit(IJErrorCategoryState(error: l)),
        (r) => emit(IJLoadCategoryState(categories: r)));
  }

  void _mapIJSelectCategoryEventToState(
      IJSelectCategoryEvent event, Emitter<IJCategoryStates> emit) async {
    emit(IJLoadingCategoryState());
    final result = await _usecase.getCategoryById(event.category!.id);
    result?.fold((l) => emit(IJErrorCategoryState(error: l)),
        (r) => emit(IJGetCategoryState(category: r)));
  }

  Future<void> loadCategories() async {
    await _usecase.getAllCategories();
  }
}
