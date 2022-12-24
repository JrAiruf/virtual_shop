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
      this.width});

  final IconData? icon;
  final IJDrawerPosition position;
  final void Function()? onTap;
  final String? name;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final widthStandard = MediaQuery.of(context).size.width;
    final heightStandard = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width ?? widthStandard * 0.1,
        height: height ?? heightStandard * 0.06,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon),
            SizedBox(
              width: widthStandard * 0.45,
            ),
            Text(name ?? ''),
            const Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }
}
