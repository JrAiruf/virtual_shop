// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:virtual_shop/src/modules/login_module/domain/entities/user_entity.dart';
import 'package:virtual_shop/src/modules/login_module/domain/repositories/iuser_login.dart';
import 'package:virtual_shop/src/modules/login_module/errors/login_errors/login_errors.dart';
import 'package:virtual_shop/src/modules/login_module/errors/sign_in_errors/sign_in_errors.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';
import '../data/iuser_login_datasource.dart';

class UserLoginRepoImpl implements IUserLogin {
  UserLoginRepoImpl({required this.datasource});
  IUserLoginDatasource datasource;

  @override
  Future<Either<LoginError, void>>? createUser(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    try {
      final result = await datasource.createUser(user, onSuccess, onFail);
      onSuccess;
      return Right(result);
    } catch (e) {
      onFail;
      return Left(UserError(error: e.toString()));
    }
  }

  /* @override
  Future<Either<SignInError, void>>? getUserData(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    try {
      final result = await datasource.getUserData(user, onSuccess, onFail);
      if (user != null) {
        onSuccess;
        return Right(result);
      }
      throw UserError(error: 'Usuário Inválido');
    } catch (e) {
       onFail;
      return Left(SignInError(errorMessage: e.toString()));
    }
  } */

  @override
  Future<Either<SignInError, void>>? signIn(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    try {
      final result = await datasource.signIn(user, onSuccess, onFail);
      if (user != null) {
        onSuccess;
        return Right(result);
      }
      throw UserError(error: 'Usuário Inválido');
    } catch (e) {
      onFail;
      return Left(SignInError(errorMessage: e.toString()));
    }
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
