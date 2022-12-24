import 'package:flutter/material.dart';
import '../ij_enums/ij_drawer_enum.dart';

class IJDrawerTile extends StatelessWidget {
  const IJDrawerTile(
      {super.key,
      this.icon,
      this.onTap,
      required this.position,
      this.name,
      this.height,
      this.width,
      required this.primaryColor,
      required this.seccundaryColor,
      required this.backgroundColor, required this.iconColor});

  final IconData? icon;
  final IJDrawerPosition position;
  final void Function()? onTap;
  final String? name;
  final double? height;
  final double? width;
  final Color primaryColor;
  final Color seccundaryColor;
  final Color backgroundColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    final widthStandard = MediaQuery.of(context).size.width;
    final heightStandard = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          gradient: LinearGradient(
            colors: [backgroundColor, primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: width ?? widthStandard * 0.1,
        height: height ?? heightStandard * 0.06,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  icon,
                  size: 35,
                  color: iconColor,
                ),
                SizedBox(
                  width: widthStandard * 0.1,
                ),
                Text(
                  name ?? '',
                  style: TextStyle(
                      color: seccundaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: seccundaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: seccundaryColor,
              height: 2,
            )
          ],
        ),
      ),
    );
  }
}
