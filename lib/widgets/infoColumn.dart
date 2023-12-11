import 'package:flutter/material.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/iconText.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';

class appColumn extends StatelessWidget {
  final String text1;

  const appColumn({super.key, required this.text1});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text1, size: dimensions.font26),
        Row(children: [
          Wrap(
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.star,
                      color: AppColors.mainColor,
                      size: dimensions.height15,
                    )),
          ),
          Gap(dimensions.width10),
          const smallText(text: "4.5"),
          Gap(dimensions.width10),
          const smallText(text: "1287 Comments")
        ]),
        Gap(dimensions.height10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const iconText(
              color: Colors.amber,
              icons: Icons.circle,
              title: "Normal",
            ),
            Gap(dimensions.width10),
            const iconText(
              color: AppColors.mainColor,
              icons: Icons.location_on,
              title: "1.7 kms",
            ),
            Gap(dimensions.width10),
            iconText(
              color: Colors.red.shade600,
              icons: Icons.access_time_outlined,
              title: "32 mins",
            )
          ],
        ),
      ],
    );
  }
}
