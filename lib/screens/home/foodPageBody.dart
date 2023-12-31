import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foody/controllers/popularProductController.dart';
import 'package:foody/helper/routes/routeHelper.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/buildPageitem.dart';
import 'package:foody/widgets/customFoodTile.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

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
  final _scaleFactor = 0.8;
  final double _height = dimensions.pageViewContainer;

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
        //page crousel starting
        GetBuilder<popularProductController>(builder: (popularProductsss) {
          return Column(
            children: [
              popularProductsss.isLoaded
                  ? Container(
                      height: dimensions.pageview,
                      child: PageView.builder(
                        controller: pageCon,
                        itemCount: popularProductsss.popularproduct.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(
                                routeHelper.popularFoodDetailsRoute),
                            child: buildPageItem(
                              currPageVal: _currPageVal,
                              scaleFactor: _scaleFactor,
                              height: _height,
                              index: index,
                              porductModel:
                                  popularProductsss.popularproduct[index],
                            ),
                          );
                        },
                      ),
                    )
                  : const CircularProgressIndicator(),
              DotsIndicator(
                dotsCount: popularProductsss.popularproduct.length <= 0
                    ? 1
                    : popularProductsss.popularproduct.length,
                position: _currPageVal.toInt(),
                decorator: DotsDecorator(
                  color: AppColors.yellowColor, // Inactive color
                  activeColor: AppColors.mainColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ],
          );
        }),
        //page crousel ending
        Gap(dimensions.height30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(
                  text: "Popular",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: const smallText(
                  text: " . ",
                  color: Colors.black38,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: const smallText(
                  text: "Food Paring",
                  color: Colors.black38,
                ),
              )
            ],
          ),
        ),
        customFoodList(),
      ],
    );
  }
}
