// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:virtual_shop_project/src/modules/application_images_module/domain/entities/application_images_entity.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/domain/repositories/get_application_images_repo.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/errors/get_images_errors.dart';

import '../../errors/datasource_errors.dart';
import '../data/get_images_datasource.dart';

class GetApplicationImagesRepoImpl implements IGetApplicationImagesRepo {
  GetApplicationImagesRepoImpl({
    required this.datasource,
  });
  final GetImagesDatasource datasource;
  @override
  Future<Either<GetImagesErrors, List<ApplicationImages>?>>? getImages(
      String? collection) async {
    try {
      final result = await datasource.getImages(collection);
      return Future.value(result);
    } catch (e) {
      return Left(DatasourceErrors());
    }
  }
}
