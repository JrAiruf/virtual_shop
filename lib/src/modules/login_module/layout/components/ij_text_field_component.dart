import 'package:flutter/material.dart';

class IJTextFieldComponent extends StatelessWidget {
  const IJTextFieldComponent(
      {super.key,
      this.icon,
      this.suffixIcon,
      this.primaryColor,
      this.onPressed,
      this.obscureText,
      this.controller,
      this.input,
      this.onSave,
      this.textColor,
      this.radius,
      this.hint,
      this.label});

  final IconData? icon;
  final IconData? suffixIcon;
  final Color? primaryColor;
  final Color? textColor;
  final double? radius;
  final void Function()? onPressed;
  final void Function()? onSave;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? input;
  final String? hint;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(obscureText: obscureText ?? false,
      style: TextStyle(color: primaryColor ?? Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: primaryColor ?? Colors.white),
        hintText: hint ?? '',
        label: Text(label ?? ''),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 5),
          borderSide: BorderSide(color: primaryColor ?? Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 5),
          borderSide: BorderSide(color: primaryColor ?? Colors.white),
        ),
        prefixIcon: Icon(icon),
        suffixIcon: Icon(suffixIcon),
      ),
    );
  }
}


/* SizedBox(
          height: 300,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: colorTheme,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                  child: Obx(
                    () => TextFormField(
                      obscureText: _controller.visibilityOn ? false : true,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                              style: IconButton.styleFrom(
                                backgroundColor: colorTheme,
                                foregroundColor: colorTheme,
                                shadowColor: colorTheme,
                                animationDuration:
                                    const Duration(milliseconds: 1),
                                highlightColor: colorTheme,
                                focusColor: colorTheme,
                                hoverColor: colorTheme,
                              ),
                              onPressed: () {
                                _controller.visibility =
                                    !_controller.visibilityOn;
                              },
                              icon: Obx(
                                () => Icon(
                                  _controller.visibilityOn
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off_outlined,
                                  color: colorTheme,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      controller: _controller.passwordController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                  child: Obx(
                    () => TextFormField(
                      obscureText: _controller.visibilityOn ? false : true,
                      decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: IconButton(
                            style: IconButton.styleFrom(
                              hoverColor: colorTheme,
                              shadowColor: colorTheme,
                              highlightColor: colorTheme,
                              focusColor: colorTheme,
                              backgroundColor: colorTheme,
                            ),
                            onPressed: () => _controller.visibility = !_controller.visibilityOn,
                            icon: Icon(
                              _controller.visibilityOn
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      controller: _controller.passwordController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
              ],
            ),
          ), */