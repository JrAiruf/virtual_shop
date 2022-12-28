import 'package:virtual_shop/src/modules/home_module/infra/models/result_images_search.dart';
import '../../../services/client_service.dart';
import '../../infra/data/get_images_datasource.dart';

class GetHomeImagesDatabase implements GetImagesDatasource {
  GetHomeImagesDatabase({CLientService? httpService}): _httpService = httpService!;

static const imagesUrl = 'http://192.168.0.102:4466/images';

  final CLientService _httpService;

  @override
  Future<List<ResultImagesSearchModel>>? getAllImages() async {
    final list = <ResultImagesSearchModel>[];
    final imagesList =
        await _httpService.get(imagesUrl);
    for (final map in imagesList.data) {
      final images = ResultImagesSearchModel.fromMap(map);
      list.add(images);
    }
    return list;
  }
}
