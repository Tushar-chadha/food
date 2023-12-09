import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';

class iconText extends StatelessWidget {
  final IconData icons;
  final String title;
  final Color color;
  final double size;

  const iconText(
      {super.key,
      this.size = 0,
      required this.icons,
      required this.title,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          color: color,
          size: size == 0 ? dimensions.font20 : size,
        ),
        Gap(2),
        smallText(text: title)
      ],
    );
  }
}
