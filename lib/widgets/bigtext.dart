import 'package:flutter/cupertino.dart';
import 'package:foody/utils/colors.dart';

class BigText extends StatelessWidget {
  final String text;
  final double size;
  final TextOverflow to;
  final Color? color;
  final FontWeight fo;

  const BigText(
      {super.key,
      required this.text,
      this.size = 20,
      this.to = TextOverflow.ellipsis,
      this.color = AppColors.mainBlackColor,
      this.fo = FontWeight.normal});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text,
        maxLines: 1,
        style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: size,
            color: color,
            overflow: to,
            fontWeight: fo));
  }
}
