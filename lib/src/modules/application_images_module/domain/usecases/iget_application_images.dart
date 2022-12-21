import '../../errors/get_images_errors.dart';
import '../entities/application_images_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IGetApplicationImages {
  Future<Either<GetImagesErrors, List<ApplicationImages>?>>? call(String? collection);
}
