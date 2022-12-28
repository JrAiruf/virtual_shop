import '../entities/application_images_entity.dart';

abstract class IGetApplicationImagesRepo {
  Future<List<ApplicationImages>?>? getAllImages();
}
