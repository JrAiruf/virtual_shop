// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/controller/ij_login_controller.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/ij_login_bloc.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/login_bloc_events/ij_login_bloc_events.dart';
import '../../../routes/ij_app_routes.dart';
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
      appBar: AppBar(actions: []),
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
            child: BlocBuilder(
                bloc: bloc,
                builder: (_, __) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                              onSaved: (value) =>
                                  newUser.confirmPassword = value,
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
                                  if (newUser.validUser()) {
                                    bloc.add(IJCreatingUserEvent(
                                        onFail: null,
                                        onSuccess: _onSuccess(
                                            context: context, user: newUser),
                                        user: newUser));
                                  } else {
                                    bloc.add(IJCreatingUserEvent(
                                        onFail:_onFail(context: context, errorMessage: 'Erro ao criar usuário'),
                                        onSuccess: null,
                                        user: null));
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
                  );
                }),
          ),
        ),
      ),
    );
  }

  _onSuccess({UserModel? user, BuildContext? context}) {
    if (user != null) {
      IJLoginNavigation.newUserHome(context!, args: user);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.black.withOpacity(0.1),
          elevation: 5,
          content: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Boas vindas!',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.verified_outlined,
                  size: 55,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  _onFail({String? errorMessage, BuildContext? context}) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 5,
        content: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Opa!',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                errorMessage ?? '',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
