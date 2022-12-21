import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/external/datasources/firebase_database.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/infra/models/result_images_search.dart';

class FirebaseMock extends Mock implements FirebaseDatabase {}

void main() {
  final datasource = FirebaseMock();
  test('Should return a List<ResultImagesSearchModel>', () async {
    when(datasource.getAllImages(any))
        .thenAnswer((_) async => <ResultImagesSearchModel>[]);
    final result = await datasource.getAllImages('');
    expect(result, isA<List<ResultImagesSearchModel>>());
  });
}
