import 'package:dartz/dartz.dart';
import '../../errors/get_images_errors.dart';
import '../entities/application_images_entity.dart';

abstract class GetApplicationImagesRepository {
  Future<Either<GetImagesErrors,List<ApplicationImages>?>>? getImages(String? collection);
}
