import 'package:virtual_shop/src/modules/home_module/infra/models/result_images_search.dart';
import '../../../services/client_service.dart';
import '../../infra/data/get_images_datasource.dart';

class GetHomeImagesDatabase implements GetImagesDatasource {
  GetHomeImagesDatabase({ClientService? httpService}): _httpService = httpService!;

static const _imagesUrl = 'http://192.168.0.103:4466/images';

  final ClientService _httpService;

  @override
  Future<List<ResultImagesSearchModel>>? getAllImages() async {
    final list = <ResultImagesSearchModel>[];
    final imagesList =
        await _httpService.get(_imagesUrl);
    for (final map in imagesList.data) {
      final images = ResultImagesSearchModel.fromMap(map);
      list.add(images);
    }
    return list;
  }
}
