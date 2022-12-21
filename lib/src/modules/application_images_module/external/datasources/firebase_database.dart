import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/errors/datasource_errors.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/infra/models/result_images_search.dart';
import '../../infra/data/get_images_datasource.dart';

class FirebaseDatabase implements GetImagesDatasource {
  final _dataSource = FirebaseFirestore.instance;

  @override
  Future<List<ResultImagesSearchModel>>? getImages(String? collection) async {
    final imageList = await _dataSource.collection(collection ?? '').get();
    if (imageList.docs.isNotEmpty) {
      return imageList.docs
          .map((items) => ResultImagesSearchModel.fromMap(items.data()))
          .toList();
    } else {
      throw DatasourceErrors();
    }
  }
}
