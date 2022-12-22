import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop/src/modules/application_images_module/domain/entities/application_images_entity.dart';
import 'package:virtual_shop/src/modules/application_images_module/domain/usecases/iget_application_images.dart';
import 'package:virtual_shop/src/modules/application_images_module/errors/get_images_errors.dart';
import 'package:virtual_shop/src/modules/application_images_module/presenter/ij_get_images_blocs/ij_get_images__events/ij_get_images_events.dart';
import 'package:virtual_shop/src/modules/application_images_module/presenter/ij_get_images_blocs/ij_get_images_bloc.dart';
import 'package:virtual_shop/src/modules/application_images_module/presenter/ij_get_images_blocs/ij_get_images_states/ij_get_images_states.dart';

class GetImagesMock extends Mock implements IGetApplicationImages {}

void main() {
  final usecase = GetImagesMock();
  final bloc = IJGetImagesBloc(usecase: usecase);
  test('Should return states in the right order', () async {
    when(usecase.call(any))
        .thenAnswer((_) async => const Right(<ApplicationImages>[]));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<IJLoadingState>(),
          isA<IJSucessResultState>(),
        ]));

    bloc.add(InitializeSearch());
  });
  test('Should return an error', () async {
    when(usecase.call(any)).thenAnswer((_) async => Left(EmptyClassText()));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<IJLoadingState>(),
          isA<IJErrorState>(),
        ]));

    bloc.add(InitializeSearch());
  });
}
