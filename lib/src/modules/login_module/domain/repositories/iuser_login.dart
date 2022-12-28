import 'package:dartz/dartz.dart';
import '../../errors/login_errors/login_errors.dart';
import '../../errors/sign_in_errors/sign_in_errors.dart';
import '../../infra/models/user_model.dart';

abstract class IUserLogin {

  Future<Either<LoginError, void>>? createUser(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );

 /*   Future<Either<SignInError, void>>? getUserData(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );
 */
   Future<Either<SignInError, void>>? signIn(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );
   Future<Either<SignInError, void>>? recoverPassword(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );
   Future<Either<SignInError, void>>? signOut(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );
   Future<Either<SignInError, void>>? deleteUser(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );
   
 
}