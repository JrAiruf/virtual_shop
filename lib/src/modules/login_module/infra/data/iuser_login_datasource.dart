import '../models/user_model.dart';

abstract class IUserLoginDatasource {
  Future<void>? createUser(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );

 /*  Future<void>? getUserData(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );
 */
  Future<void>? signIn(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );

  Future<void>? recoverPassword(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );
  Future<void>? signOut(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );
  Future<void>? deleteUser(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );
}