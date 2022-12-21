import 'package:dartz/dartz.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/errors/get_images_errors.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/infra/models/result_images_search.dart';

abstract class GetImagesDatasource {
  Future<Either<GetImagesErrors,List<ResultImagesSearchModel>?>>? getImages(String? collection);
}
