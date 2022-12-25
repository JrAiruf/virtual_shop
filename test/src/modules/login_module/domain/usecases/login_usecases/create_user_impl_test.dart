import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_shop/src/modules/login_module/domain/entities/user_entity.dart';
import 'package:virtual_shop/src/modules/login_module/domain/repositories/icreate_user.dart';
import 'package:virtual_shop/src/modules/login_module/domain/usecases/login_usecases/create_user_impl.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';

class CreateUserMock extends Mock implements ICreateUser {}

void main() {
  final repository = CreateUserMock();
  final usecase = CreateUserRepoImpl(repository: repository);
  test('Should Create a User (return UserEntity)', () async {
    when(repository.createUser(any, any, any))
        .thenAnswer((_) async => Right(UserEntity()));

    final result = await usecase.createUser(
        user: UserModel(), onFail: () {}, onSuccess: () {});
    expect(result! | null, isA<UserEntity>());
  });
}
