import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:foody/widgets/appIcon.dart';

class NavigatorRowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        appIcon(
          iconName: CupertinoIcons.arrow_left,
        ),
        appIcon(
          iconName: CupertinoIcons.shopping_cart,
        ),
      ],
    );
  }
}
