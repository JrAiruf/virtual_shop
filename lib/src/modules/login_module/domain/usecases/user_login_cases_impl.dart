// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:virtual_shop/src/modules/login_module/domain/entities/user_entity.dart';
import 'package:virtual_shop/src/modules/login_module/domain/usecases/iuser_login_cases.dart';
import 'package:virtual_shop/src/modules/login_module/errors/login_errors/login_errors.dart';
import 'package:virtual_shop/src/modules/login_module/errors/sign_in_errors/sign_in_errors.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';

import '../repositories/iuser_login.dart';

class UserLoginCasesImpl implements IUserLoginCases {
  UserLoginCasesImpl({required this.repository});
  final IUserLogin repository;

  @override
  Future<Either<LoginError, void>>? createUser(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    if (user == null) {
      onFail;
      return Left(UserError(error: 'Erro ao criar usuário'));
    }
    onSuccess;
    return (Future.value(repository.createUser(user, onSuccess, onFail)));
  }

  @override
  Future<Either<LoginError, void>>? getUserData(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    if (user == null) {
      onFail;
      return     Left(SignInError(errorMessage: 'Erro ao criar usuário'));
    }
     onSuccess;
    return (Future.value(repository.createUser(user, onSuccess, onFail)));
  }

  @override
  Future<Either<SignInError, void>>? signIn(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    if (user == null || user.password!.isEmpty) {
      onFail;
      return Left(SignInError(errorMessage: 'Usuário Inválido'));
    }
    onSuccess;
    return Future.value(repository.signIn(user, onSuccess, onFail));
  }

  @override
  Future<Either<SignInError, UserEntity?>>? signOut(
      UserModel? user, Function()? onSuccess, Function()? onFail) {
    // TODO: implement SignOut
    throw UnimplementedError();
  }

  @override
  Future<Either<SignInError, UserEntity?>>? deleteUser(
      UserModel? user, Function()? onSuccess, Function()? onFail) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<SignInError, UserEntity?>>? recoverPassword(
      UserModel? user, Function()? onSuccess, Function()? onFail) {
    // TODO: implement recoverPassword
    throw UnimplementedError();
  }
}
