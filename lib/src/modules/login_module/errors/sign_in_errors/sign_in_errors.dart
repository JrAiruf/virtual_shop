import 'package:virtual_shop/src/modules/login_module/errors/login_errors/login_errors.dart';

class SignInError extends LoginError {
  SignInError({this.errorMessage});
  final String? errorMessage;
}
