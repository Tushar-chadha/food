import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/appIcon.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/extendableText.dart';
import 'package:foody/widgets/iconText.dart';
import 'package:foody/widgets/infoColumn.dart';
import 'package:foody/widgets/navigatorRow.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';

class popularFoodDetails extends StatefulWidget {
  String Textx =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem ";
  @override
  State<popularFoodDetails> createState() => _popularFoodDetailsState();
}

class _popularFoodDetailsState extends State<popularFoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: dimensions.popularImageHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                ),
              ),
            ),
          ),
          Positioned(
              left: dimensions.width20,
              top: dimensions.height20 + 30,
              right: dimensions.width20,
              child: NavigatorRowIcon()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: dimensions.popularImageHeight - 30,
            child: Container(
                padding: EdgeInsets.only(
                    left: dimensions.width20,
                    right: dimensions.width20,
                    top: dimensions.height20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, -5),
                        blurRadius: 10,
                        spreadRadius: 1,
                        color: Colors.black12),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      dimensions.radius30,
                    ),
                    topRight: Radius.circular(
                      dimensions.radius30,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appColumn(
                      text1: "Chinese Food",
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: extendableText(
                          Text: widget.Textx + widget.Textx + widget.Textx,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.symmetric(
            horizontal: dimensions.width20, vertical: dimensions.height30),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              dimensions.radius20 * 2,
            ),
            topRight: Radius.circular(
              dimensions.radius20 * 2,
            ),
          ),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(dimensions.radius20)),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: dimensions.width10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.add,
                          size: dimensions.height30 - 5,
                        ),
                        Gap(dimensions.width10),
                        BigText(
                          text: "0",
                          size: dimensions.height30,
                        ),
                        Gap(dimensions.width10),
                        Icon(
                          CupertinoIcons.minus,
                          size: dimensions.height30 - 5,
                        )
                      ],
                    ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: dimensions.width10),
                child: TextButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.mainColor)),
                    onPressed: () {},
                    child: const BigText(
                      color: Colors.white,
                      text: "Rs.100 Add to Cart",
                    )),
              )
            ]),
      ),
    );
  }
}
