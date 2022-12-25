import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:virtual_shop/src/modules/login_module/errors/login_errors/login_errors.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';
import '../../infra/data/user_datasource.dart';

class FirebaseUserDatabase implements IUserDataSource {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebase = FirebaseFirestore.instance;

  @override
  Future<UserModel>? createUser(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: user!.email!, password: user.password!);
      user.id = result.user?.uid;
      final newUser = user.toMap();
      _firebase.collection('users').add(newUser);
      onSuccess;
      return UserModel.fromMap(newUser);
    } on LoginError catch (e) {
      onFail;
      throw UserError(error: e.toString());
    }
  }
}
