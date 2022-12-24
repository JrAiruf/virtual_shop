import 'package:virtual_shop/src/modules/home_module/infra/models/result_images_search.dart';

abstract class GetImagesDatasource {
  Future<List<ResultImagesSearchModel>>? getAllImages(String? collection);
}
