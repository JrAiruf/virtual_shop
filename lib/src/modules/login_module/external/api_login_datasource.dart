import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:virtual_shop/src/modules/login_module/errors/login_errors/login_errors.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';
import 'package:virtual_shop/src/modules/services/client_service.dart';

import '../infra/data/iuser_login_datasource.dart';

class ApiLoginDatasource implements IUserLoginDatasource {
  ApiLoginDatasource({required CLientService? httpService})
      : _httpService = httpService!;

  final CLientService _httpService;

  @override
  Future<void>? createUser(
      UserModel? user, Function()? onSuccess, Function()? onFail) async {
    const createUserUrl = 'http://192.168.0.102:4466/user';
    try {
      final result = await _httpService.post(
          path: createUserUrl,
          body: user!.toMap(),
          headers: {'contentType': 'applicationJson'});
      final createdUser = jsonDecode(result.data) as Map<String, dynamic>;
      user = UserModel.fromMap(createdUser);
      onSuccess;
    } on LoginError catch (e) {
      onFail;
      throw UserError(error: e.toString());
    }
  }

  @override
  Future<void>? deleteUser(
      UserModel? user, Function()? onSuccess, Function()? onFail) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Response>? getUserData() async {
    const getUserUrl = 'http://192.168.0.102:4466/user';
    final result = await _httpService.get(getUserUrl);
    if (result.statusCode == 200) {
      return result;
    }
    throw Exception;
  }

  @override
  Future<void>? recoverPassword(
      UserModel? user, Function()? onSuccess, Function()? onFail) {
    // TODO: implement recoverPassword
    throw UnimplementedError();
  }

  @override
  Future<void>? signIn(
      UserModel? user, Function()? onSuccess, Function()? onFail) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void>? signOut(
      UserModel? user, Function()? onSuccess, Function()? onFail) {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
