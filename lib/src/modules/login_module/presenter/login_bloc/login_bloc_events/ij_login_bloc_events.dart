// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';

abstract class IJLoginBlocEvents {}

class IJCreateUserEvent extends IJLoginBlocEvents {
  IJCreateUserEvent(this.context, {required this.user});
  final UserModel user;
  final BuildContext? context;
}

class IJSignInEvent extends IJLoginBlocEvents {}

class IJSignOutEvent extends IJLoginBlocEvents {}
