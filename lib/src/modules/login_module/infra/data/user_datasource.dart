import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';

abstract class IUserDataSource {
  Future<UserModel>? createUser(UserModel? user);
}