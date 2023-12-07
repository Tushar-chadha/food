import 'package:flutter/cupertino.dart';
import 'package:foody/utils/colors.dart';

class smallText extends StatelessWidget {
  final String text;
  final double size;
  final TextOverflow to;
  final Color? color;
  final FontWeight fo;

  const smallText(
      {super.key,
      required this.text,
      this.size = 12,
      this.to = TextOverflow.ellipsis,
      this.color = AppColors.textColor,
      this.fo = FontWeight.w400});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text,
        style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: size,
            color: color,
            overflow: to,
            fontWeight: fo));
  }
}
