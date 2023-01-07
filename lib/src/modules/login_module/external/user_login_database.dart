import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';

import '../errors/login_errors/login_errors.dart';
import '../errors/sign_in_errors/sign_in_errors.dart';
import '../infra/data/iuser_login_datasource.dart';

class UserLoginDatabase implements IUserLoginDatasource {
  final _firebaseAuth = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;

  User? _firebaseUser;
  UserModel? _userApp;
  @override
  Future<UserModel>? createUser(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: user!.email!, password: user.password!);
      user.id = result.user?.uid;
      final newUser = user.toMap();
      await _database.collection('users').doc(user.id).set(newUser);
      if (user.id != null && user.id == result.user!.uid) {
        onSuccess;
      }
      throw UserError(error: 'Usuário inválido');
    } on LoginError catch (e) {
      onFail;
      throw UserError(error: e.toString());
    }
  }

  @override
  Future<UserModel>? getUserData(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    try {
      final result = await _database.collection('users').doc(user!.id).get();
      if (result.data() != null) {
        return UserModel.fromMap(result.data()!);
      }
      throw SignInError();
    } on LoginError catch (e) {
      onFail;
      throw UserError(error: e.toString());
    }
  }

  @override
  Future<UserModel>? deleteUser(
      UserModel? user, Function()? onSuccess, Function()? onFail) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel>? recoverPassword(
      UserModel? user, Function()? onSuccess, Function()? onFail) {
    // TODO: implement recoverPassword
    throw UnimplementedError();
  }

  @override
  Future<void>? signIn(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    try {
      final firebaseUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: user!.email!, password: user.password!);
      await _loadUserData(firebaseUser: firebaseUser.user);
      onSuccess;
    } catch (e) {
      onFail;
      throw SignInError(errorMessage: e.toString());
    }
  }

  @override
  Future<UserModel>? signOut(
      UserModel? user, Function()? onSuccess, Function()? onFail) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  Future<void>? _loadUserData({User? firebaseUser}) async {
    final User? currenUser = firebaseUser ?? _firebaseAuth.currentUser;
    if (currenUser != null) {
      final snapshot =
          await _database.collection('users').doc(_firebaseUser!.uid).get();
      _userApp = UserModel.fromDocumentSnapshot(snapshot);
    }
    throw SignInError();
  }
}
