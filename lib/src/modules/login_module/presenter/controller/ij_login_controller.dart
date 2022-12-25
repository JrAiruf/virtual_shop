import 'package:flutter/cupertino.dart';

import '../../infra/models/user_model.dart';

class IJLoginController {
  TextEditingController nameField = TextEditingController();
  TextEditingController seccondNameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  TextEditingController confirmPasswordField = TextEditingController();
  TextEditingController adressField = TextEditingController();

  
  UserModel? user;

  String? nameValidate(String? value) {
    if (value!.isNotEmpty && value != '') {
      return value;
    }
    return 'Nome Inválido';
  }

  String? emailValidate(String? value) {
    if (value!.isNotEmpty && value != '' && value.contains('@')) {
      return value;
    }
    return 'E-mail Inválido';
  }

  String? passwordValidate(String? value) {
    if (value!.isNotEmpty && value != '' && value.length >= 8) {
      return value;
    }
    return 'Senha Inválida! Sua Senha deve ter pelo menos 8 dígitos';
  }

  String? confirmPasswordValidate(String? value) {
    if (value!.isNotEmpty && value != '' && value == user!.password) {
      return value;
    }
    return 'Senha Inválida! Sua Senha deve ter pelo menos 8 dígitos';
  }

  String? adressValidate(String? value) {
    if (value!.isNotEmpty && value != '') {
      return value;
    }
    return 'Endereço Inválido';
  }
}
