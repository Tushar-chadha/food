import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/dimensions.dart';

class appIcon extends StatelessWidget {
  // for app Icon
  final double size;
  final IconData iconName;
  final Color bgColor, iconColor;

  const appIcon(
      {super.key,
      this.size = 40,
      required this.iconName,
      this.bgColor = Colors.white60,
      this.iconColor = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(size / 2)),
      child: Icon(
        iconName,
        color: iconColor,
        size: dimensions.appIcon16 + 4,
      ),
    );
  }
}
