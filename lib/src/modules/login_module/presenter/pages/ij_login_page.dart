// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:virtual_shop/src/modules/login_module/layout/components/ij_large_button.dart';
import 'package:virtual_shop/src/modules/login_module/layout/components/ij_text_field_component.dart';

class IJLoginPage extends StatelessWidget {
  IJLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
              const Text(
                'Sua \nLoja Virtual',
                style: TextStyle(fontSize: 45),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const IJTextFieldComponent(
                      label: 'E-mail',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const IJTextFieldComponent(
                      label: 'Password',
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    IJLargeButton(
                      onPressed: () {},
                      width: width,
                      height: 65,
                      buttonName: 'Entre',
                      fontSize: 20,
                      nameColor: Colors.white,
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
