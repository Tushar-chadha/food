import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';

class iconText extends StatelessWidget {
  final IconData icons;
  final String title;
  final Color color;

  const iconText(
      {super.key,
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
          size: 20,
        ),
        Gap(2),
        smallText(text: title)
      ],
    );
  }
}
