import '../../../domain/entities/application_images_entity.dart';
import '../../../errors/get_images_errors.dart';

abstract class IJGetImagesStates {}

class IJinitialState implements IJGetImagesStates {}

class IJLoadingState implements IJGetImagesStates {}

class IJErrorState implements IJGetImagesStates {
  IJErrorState({required this.error});
  final GetImagesError error;
}

class IJSucessResultState implements IJGetImagesStates {
  IJSucessResultState({this.imagesList});
  List<ApplicationImages>? imagesList;
}
