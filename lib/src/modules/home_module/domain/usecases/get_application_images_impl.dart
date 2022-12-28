// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/home_module/domain/entities/application_images_entity.dart';
import 'package:virtual_shop/src/modules/home_module/domain/usecases/iget_application_images.dart';
import '../repositories/iget_application_images_repo.dart';

class GetApplicationImagesImpl implements IGetApplicationImages {
  GetApplicationImagesImpl({
    required this.imagesRepository,
  });

  final IGetApplicationImagesRepo imagesRepository;

  @override
  Future<List<ApplicationImages>?>? call() async {
    return Future.value(imagesRepository.getAllImages());
  }
}
