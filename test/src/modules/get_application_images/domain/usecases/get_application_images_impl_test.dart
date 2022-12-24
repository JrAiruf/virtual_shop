import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop/src/modules/home_module/domain/entities/application_images_entity.dart';
import 'package:virtual_shop/src/modules/home_module/domain/repositories/iget_application_images_repo.dart';
import 'package:virtual_shop/src/modules/home_module/domain/usecases/get_application_images_impl.dart';
import 'package:virtual_shop/src/modules/home_module/errors/get_images_errors.dart';

class GetImagesMock extends Mock implements IGetApplicationImagesRepo {}

void main() {
  final repository = GetImagesMock();
  final usecase = GetApplicationImagesImpl(imagesRepository: repository);
  test('Should return a List<ApplicationImages>', () async {
    when(repository.getAllImages(any))
        .thenAnswer((_) async => const Right(<ApplicationImages>[]));
    final result = await usecase('collection');
    expect(result! | null, isA<List<ApplicationImages>>());
  });
  test('Should return an Exception', () async {
    when(repository.getAllImages(any))
        .thenAnswer((_) async => const Right(<ApplicationImages>[]));
    var result = await usecase(null);
    expect(result!.isLeft(), true);
    expect(result.fold(id, id), isA<EmptyClassText>());
    result = await usecase("");
  });
}
