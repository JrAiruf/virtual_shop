// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';
import 'package:virtual_shop/src/modules/login_module/layout/components/ij_large_button.dart';
import 'package:virtual_shop/src/modules/login_module/layout/components/ij_text_field_component.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/controller/ij_login_controller.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/ij_login_bloc.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/login_bloc_events/ij_login_bloc_events.dart';
import 'package:virtual_shop/src/modules/routes/ij_app_routes.dart';

class IJLoginPage extends StatelessWidget {
  IJLoginPage({super.key});

  final bloc = Modular.get<IJLoginBloc>();
  final screenController = IJLoginController();
  final _formKey = GlobalKey<FormState>();
  final user = UserModel();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                IJLoginNavigation.createUser(context);
              },
              child: const Text(
                'Criar Conta',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ))
        ],
      ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Sua \nLoja Virtual',
                        style: TextStyle(fontSize: 45),
                      ),
                      const SizedBox(
                        height: 210,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IJTextFieldComponent(
                              onSaved: (value) => user.email = value!.trim(),
                              validator: screenController.emailValidate,
                              label: 'E-mail',
                              controller: screenController.userEmailField,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            IJTextFieldComponent(
                              onSaved: (value) => user.password = value!.trim(),
                              obscureText: true,
                              validator: screenController.passwordValidate,
                              controller: screenController.userPasswordField,
                              label: 'Senha',
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 35),
                              child: IJLargeButton(
                                onPressed: () {
                                  _formKey.currentState!.validate();
                                  _formKey.currentState!.save();
                                  if (user.validUserLogin()) {
                                    bloc.add(IJSignInEvent(
                                        user: UserModel(
                                          email: user.email,
                                          password: user.password,
                                        ),
                                        onSuccess: _onSuccess(
                                          context: context,
                                          args: user,
                                        ),
                                        onFail: null));
                                  } else {
                                    bloc.add(
                                      IJSignInEvent(
                                        onSuccess: null,
                                        user: null,
                                        onFail: _onFail(
                                          context: context,
                                          errorMessage: 'Falha ao logar',
                                        ),
                                      ),
                                    );
                                  }
                                },
                                width: width,
                                height: 65,
                                buttonName: 'Entrar',
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

  _onSuccess({UserModel? args, BuildContext? context}) {
    IJGeneralNavigation.home(context: context!, args: user);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.black.withOpacity(0.1),
        elevation: 5,
        content: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Boas vindas ${user.name}!',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              const Icon(
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
