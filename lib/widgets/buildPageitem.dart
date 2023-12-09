import 'package:flutter/material.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/iconText.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';

class buildPageItem extends StatelessWidget {
  final double currPageVal;
  final double scaleFactor;
  final double height;
  final int index;

  const buildPageItem(
      {super.key,
      required this.currPageVal,
      required this.scaleFactor,
      required this.height,
      required this.index});

  @override
  Widget build(BuildContext context) {
    Matrix4 matrix = Matrix4.identity();

    if (index == currPageVal.floor()) {
      var currscale = 1 - (currPageVal - index) * (1 - scaleFactor);
      var currTransf = height * (1 - currscale) / 2;
      // matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currTransf, 0);
    } else if (index == currPageVal.floor() + 1) {
      var currscale =
          scaleFactor + (currPageVal - index + 1) * (1 - scaleFactor);
      var currTransf = height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(1, currTransf, 1);
    } else if (index == currPageVal.floor() - 1) {
      var currscale = 1 - (currPageVal - index) * (1 - scaleFactor);
      var currTransf = height * (1 - currscale) / 2;
      // matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(1, currTransf, 1);
    } else {
      var currscale = 0.8;
      matrix = matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: height,
            margin: EdgeInsets.symmetric(horizontal: dimensions.width10),
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/image/food0.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(dimensions.radius30)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: dimensions.width30,
                  right: dimensions.width30,
                  top: dimensions.height15,
                  bottom: dimensions.height10),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 2,
                        offset: Offset(0, 2),
                        color: Colors.black12,
                        blurRadius: 2,
                        blurStyle: BlurStyle.normal)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(dimensions.radius30)),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: dimensions.height15,
                    horizontal: dimensions.width10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BigText(text: "Chinese Food"),
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
