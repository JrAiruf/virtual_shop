import 'package:virtual_shop_project/src/modules/application_images_module/infra/models/result_images_search.dart';

abstract class GetImagesDatasource {
  Future<List<ResultImagesSearchModel>>? getImages(String? collection);
}
