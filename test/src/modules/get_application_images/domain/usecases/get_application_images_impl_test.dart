import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/domain/entities/application_images_entity.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/domain/repositories/get_application_images_repository.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/domain/usecases/get_application_images_impl.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/errors/get_images_errors.dart';

class GetImagesMock extends Mock implements GetApplicationImagesRepository {}

void main() {
  final repository = GetImagesMock();
  final usecase = GetApplicationImagesImpl(imagesRepository: repository);
  test('Should return a List<ApplicationImages>', () async {
    when(repository.getImages(any))
        .thenAnswer((_) async => const Right(<ApplicationImages>[]));
    final result = await usecase('collection');
    expect(result! | null, isA<List<ApplicationImages>>());
  });
  test('Should return a Exception', () async {
    when(repository.getImages(any))
        .thenAnswer((_) async => const Right(<ApplicationImages>[]));
    var result = await usecase(null);
    expect(result!.isLeft(), true);
    expect(result.fold(id, id), isA<EmptyClassText>());
    result = await usecase("");
  });
}
