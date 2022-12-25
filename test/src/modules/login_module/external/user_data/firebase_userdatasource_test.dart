import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop/src/modules/login_module/external/user_data/firebase_userdatasource.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';

class UserDatabaseMock extends Mock implements FirebaseUserDatabase {}

void main() {
  final database = UserDatabaseMock();
  test('Should Create an user (returns an UserModel)', () async {
    when(database.createUser(any,any,any))
        .thenAnswer((realInvocation) async => UserModel());
    final user = UserModel();
    final result = await database.createUser(user, (){}, (){});
    expect(result, isA<UserModel>());
  });
}
