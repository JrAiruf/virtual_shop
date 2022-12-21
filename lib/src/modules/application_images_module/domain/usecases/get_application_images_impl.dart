// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/domain/entities/application_images_entity.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/domain/usecases/iget_application_images.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/errors/get_images_errors.dart';

import '../repositories/get_application_images_repository.dart';

class GetApplicationImagesImpl implements IGetApplicationImages {
  GetApplicationImagesImpl({
    required this.imagesRepository,
  });

  final GetApplicationImagesRepository imagesRepository;

  @override
  Future<Either<GetImagesErrors, List<ApplicationImages>?>>? call(
      String? collection) async {
    if (collection == null || collection.isEmpty) {
      return Left(EmptyClassText());
    }
    return Future.value(imagesRepository.getImages(collection));
  }
}
