import '../entities/application_images_entity.dart';

abstract class IGetApplicationImages {
  Future<List<ApplicationImages>?>? call();
}
