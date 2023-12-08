import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/iconText.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';

// ignore: camel_case_types
class foodPageBody extends StatefulWidget {
  const foodPageBody({super.key});

  @override
  State<foodPageBody> createState() => _foodPageBodyState();
}

// ignore: camel_case_types
class _foodPageBodyState extends State<foodPageBody> {
  PageController pageCon = PageController(viewportFraction: 0.85);
  var _currPageVal = 0.0;
  var _scaleFactor = 0.8;
  double _height = dimensions.pageViewContainer;

  @override
  void initState() {
    pageCon.addListener(() {
      setState(() {
        _currPageVal = pageCon.page!;
        print(_currPageVal);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    pageCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //color: Colors.red,
          height: dimensions.pageview,
          child: PageView.builder(
            controller: pageCon,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _buildPageItem(index);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageVal.toInt(),
          decorator: DotsDecorator(
            color: AppColors.yellowColor, // Inactive color
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPageVal.floor()) {
      var currscale = 1 - (_currPageVal - index) * (1 - _scaleFactor);
      var currTransf = _height * (1 - currscale) / 2;
      // matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currTransf, 0);
    } else if (index == _currPageVal.floor() + 1) {
      var currscale =
          _scaleFactor + (_currPageVal - index + 1) * (1 - _scaleFactor);
      var currTransf = _height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(1, currTransf, 1);
    } else if (index == _currPageVal.floor() - 1) {
      var currscale = 1 - (_currPageVal - index) * (1 - _scaleFactor);
      var currTransf = _height * (1 - currscale) / 2;
      // matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(1, currTransf, 1);
    } else {
      var currscale = 0.8;
      matrix = matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: _height,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/image/food0.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: dimensions.pageViewTextContainer,
              margin: const EdgeInsets.only(
                  left: 30, right: 30, top: 15, bottom: 10),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                    color: Colors.black12,
                    blurRadius: 2,
                    blurStyle: BlurStyle.normal)
              ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BigText(text: "Chinese Food"),
                    Row(children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: 15,
                                )),
                      ),
                      const Gap(10),
                      const smallText(text: "4.5"),
                      const Gap(10),
                      const smallText(text: "1287 Comments")
                    ]),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const iconText(
                          color: Colors.amber,
                          icons: Icons.circle,
                          title: "Normal",
                        ),
                        const Gap(10),
                        const iconText(
                          color: AppColors.mainColor,
                          icons: Icons.location_on,
                          title: "1.7 kms",
                        ),
                        const Gap(10),
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
