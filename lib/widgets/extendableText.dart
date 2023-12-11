import 'package:flutter/material.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';

class extendableText extends StatefulWidget {
  final String Text;

  const extendableText({super.key, required this.Text});
  @override
  State<extendableText> createState() => _extendableTextState();
}

// ignore: camel_case_types
class _extendableTextState extends State<extendableText> {
  late String firstText, secondText;
  bool isTextHidden = true;
  double textHeight = dimensions.screenHeight / 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(textHeight);
    if (widget.Text.length > textHeight) {
      firstText = widget.Text.substring(0, textHeight.toInt());
      secondText =
          widget.Text.substring(textHeight.toInt() + 1, widget.Text.length);
    } else {
      firstText = widget.Text;
      secondText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(dimensions.height20),
        BigText(text: "Details", size: dimensions.font26 - 5),
        Gap(dimensions.height10 - 7),
        Container(
          child: secondText == ""
              ? smallText(text: firstText)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallText(
                        size: 15,
                        height: 1.5,
                        to: TextOverflow.visible,
                        color: AppColors.paraColor,
                        text: isTextHidden
                            ? (firstText + "...")
                            : (firstText + secondText)),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isTextHidden = !isTextHidden;
                        });
                      },
                      child: smallText(
                        to: TextOverflow.visible,
                        size: 18,
                        text: isTextHidden ? 'show more...' : 'show less.',
                        color: AppColors.mainColor,
                      ),
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
