import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/errors/datasource_errors.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/infra/data/get_images_datasource.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/infra/models/result_images_search.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/infra/repositories/get_application_images_repo_impl.dart';

class DataSourceMock extends Mock implements GetImagesDatasource {}

void main() {
  final datasource = DataSourceMock();
  final repository = GetApplicationImagesRepoImpl(datasource: datasource);
  test('Should return a List<ResultImagesSearchModel>', () async {
    when(datasource.getImages(any))
        .thenAnswer((realInvocation) async => const <ResultImagesSearchModel>[]);
    final result = await repository.getImages('laranjinha');
    expect(result! | null, isA<List<ResultImagesSearchModel>>());
  });
  test('Should return a DatasourceError case fail', () async {
    when(datasource.getImages(any))
        .thenThrow(Exception());
    final result = await repository.getImages('laranjinha');
    expect(result!.fold(id, id), isA<DatasourceErrors>());
  });
}
