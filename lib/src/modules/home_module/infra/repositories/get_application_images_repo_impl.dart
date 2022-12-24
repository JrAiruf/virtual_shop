// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:virtual_shop/src/modules/home_module/domain/entities/application_images_entity.dart';
import 'package:virtual_shop/src/modules/home_module/domain/repositories/iget_application_images_repo.dart';
import 'package:virtual_shop/src/modules/home_module/errors/get_images_errors.dart';

import '../../external/errors/datasource_errors.dart';
import '../data/get_images_datasource.dart';

class GetApplicationImagesRepoImpl implements IGetApplicationImagesRepo {
  GetApplicationImagesRepoImpl({
    required this.datasource,
  });
  GetImagesDatasource datasource;
  @override
  Future<Either<GetImagesError, List<ApplicationImages>?>>? getAllImages(
      String? collection) async {
    try {
      final result = await datasource.getAllImages(collection);
      return Right(result);
    } catch (e) {
      return Left(DatasourceErrors());
    }
  }
}
