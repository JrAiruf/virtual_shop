// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/login_module/domain/entities/user_entity.dart';

abstract class IJLoginBlocStates {}

class IJInitialState extends IJLoginBlocStates {}
class IJNoUserState extends IJLoginBlocStates {}

class IJLoadingUserState extends IJLoginBlocStates {
  IJLoadingUserState({this.user});
  final UserEntity? user;
}
class IJGotgUserState extends IJLoginBlocStates {
  IJGotgUserState({this.user});
  final UserEntity? user;
}

class IJCreatingUserState extends IJLoginBlocStates {
  IJCreatingUserState({this.user});
  final UserEntity? user;
}

class IJSignInState extends IJLoginBlocStates {
  IJSignInState({required this.user});
  final UserEntity user;
}

class IJUserErrorState extends IJLoginBlocStates {
  IJUserErrorState({this.errorMessage});
  final String? errorMessage;
}

class IJSignUpState extends IJLoginBlocStates {}

class IJLogOutState extends IJLoginBlocStates {}
