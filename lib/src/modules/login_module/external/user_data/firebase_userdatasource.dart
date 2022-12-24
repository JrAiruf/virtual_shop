import 'package:firebase_auth/firebase_auth.dart';
import 'package:virtual_shop/src/modules/login_module/errors/login_errors/login_errors.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';
import '../../infra/data/user_datasource.dart';

class FirebaseUserDatabase implements IUserDataSource {
  final _firebase = FirebaseAuth.instance;
  @override
  Future<UserModel>? createUser(UserModel? user) async {
    try {
      final result = await _firebase.createUserWithEmailAndPassword(
          email: user!.email!, password: user.password!);
      user.id = result.user?.uid;
      final newUser = result.credential?.asMap();
      return UserModel.fromMap(newUser!);
    } on LoginError catch (e) {
      throw UserError(error: e.toString());
    }
  }
}