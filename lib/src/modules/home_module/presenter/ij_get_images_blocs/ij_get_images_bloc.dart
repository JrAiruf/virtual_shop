import 'package:bloc/bloc.dart';
import 'package:virtual_shop/src/modules/home_module/errors/get_images_errors.dart';
import 'package:virtual_shop/src/modules/home_module/presenter/ij_get_images_blocs/ij_get_images_states/ij_get_images_states.dart';
import '../../domain/usecases/iget_application_images.dart';
import 'ij_get_images__events/ij_get_images_events.dart';

class IJGetImagesBloc extends Bloc<IJGetImagesEvents, IJGetImagesStates> {
  IJGetImagesBloc({required this.usecase}) : super(IJinitialState()) {
    on<InitializeSearch>(_mapInitializeSearchToState);
  }

  final IGetApplicationImages usecase;
  void _mapInitializeSearchToState(
      InitializeSearch event, Emitter<IJGetImagesStates> emit) async {
    emit(IJLoadingState());
    final result = await usecase.call();
    if (result != null) {
      return emit(IJSucessResultState(imagesList: result));
    } else {
      emit(IJErrorState(error: EmptyClassText()));
    }
  }
}
