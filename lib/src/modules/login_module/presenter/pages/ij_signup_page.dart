// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/controller/ij_login_controller.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/ij_login_bloc.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/login_bloc_events/ij_login_bloc_events.dart';

import '../../infra/models/user_model.dart';
import '../../layout/components/ij_large_button.dart';
import '../../layout/components/ij_text_field_component.dart';

class IJSignUpPage extends StatelessWidget {
  IJSignUpPage({super.key});

  final bloc = Modular.get<IJLoginBloc>();
  final screenController = Modular.get<IJLoginController>();
  final _formKey = GlobalKey<FormState>();

  UserModel newUser = UserModel();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sua \nLoja Virtual',
                  style: TextStyle(fontSize: 45),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IJTextFieldComponent(
                        validator: screenController.nameValidate,
                        onSaved: (value) => newUser.name = value,
                        controller: screenController.nameField,
                        label: 'Nome',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      IJTextFieldComponent(
                        validator: screenController.nameValidate,
                        onSaved: (value) => newUser.seccondName = value,
                        controller: screenController.seccondNameField,
                        label: 'Sobre Nome',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      IJTextFieldComponent(
                        validator: screenController.emailValidate,
                        onSaved: (value) => newUser.email = value,
                        label: 'E-mail',
                        controller: screenController.emailField,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      IJTextFieldComponent(
                        obscureText: true,
                        validator: screenController.passwordValidate,
                        onSaved: (value) => newUser.password = value,
                        controller: screenController.passwordField,
                        label: 'Senha',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      IJTextFieldComponent(
                        obscureText: true,
                        validator: screenController.passwordValidate,
                        onSaved: (value) => newUser.confirmPassword = value,
                        controller: screenController.confirmPasswordField,
                        label: 'Confirmar Senha',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      IJTextFieldComponent(
                        validator: screenController.adressValidate,
                        onSaved: (value) => newUser.adress = value,
                        controller: screenController.adressField,
                        label: 'Endereço',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 55),
                        child: IJLargeButton(
                          onPressed: () {
                            _formKey.currentState!.validate();
                            _formKey.currentState!.save();
                            if (newUser.confirmPassword == newUser.password) {
                            bloc.add(IJCreateUserEvent(context, user: newUser));
                            }
                          },
                          width: width,
                          height: 65,
                          buttonName: 'Criar Conta',
                          fontSize: 20,
                          nameColor: Colors.white,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
