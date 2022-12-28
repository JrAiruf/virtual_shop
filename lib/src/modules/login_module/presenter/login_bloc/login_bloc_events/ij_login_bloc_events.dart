// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';

abstract class IJLoginBlocEvents {}

class IJInitialUserEvent extends IJLoginBlocEvents {}

class IJCreatingUserEvent extends IJLoginBlocEvents {
  IJCreatingUserEvent({this.onFail, this.onSuccess, required this.user});
  final UserModel? user;
  Function()? onFail, onSuccess;
}

class IJSignInEvent extends IJLoginBlocEvents {
  IJSignInEvent({required this.user, this.onFail, this.onSuccess});
  final UserModel? user;
  Function()? onFail, onSuccess;
}

class IJGetUserEvent extends IJLoginBlocEvents {
  IJGetUserEvent({required this.user, this.onSuccess, required this.onFail});
  final UserModel user;
  Function()? onSuccess, onFail;
}

class IJLoadingUserEvent extends IJLoginBlocEvents {}

class IJSignOutEvent extends IJLoginBlocEvents {}
