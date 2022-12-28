// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/home_module/domain/entities/application_images_entity.dart';
import 'package:virtual_shop/src/modules/home_module/domain/repositories/iget_application_images_repo.dart';
import 'package:virtual_shop/src/modules/home_module/infra/models/result_images_search.dart';
import '../data/get_images_datasource.dart';

class GetApplicationImagesRepoImpl implements IGetApplicationImagesRepo {
  GetApplicationImagesRepoImpl({
    required this.datasource,
  });
  GetImagesDatasource datasource;
  @override
  Future<List<ApplicationImages>?>? getAllImages() async {
    try {
      final result = await datasource.getAllImages();
      final listImages = result!
          .map((e) => ResultImagesSearchModel.aplicationImages(e.toMap())).toList();
      return listImages;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
