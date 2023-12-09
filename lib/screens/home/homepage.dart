import 'package:flutter/material.dart';
import 'package:foody/screens/home/foodPageBody.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(5),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: dimensions.width20),
                  height: dimensions.height65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                              fo: FontWeight.bold,
                              text: 'India',
                              color: AppColors.mainColor),
                          Row(
                            children: [
                              smallText(
                                text: "New Delhi",
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: AppColors.textColor,
                              ),
                            ],
                          )
                        ],
                      ),
                      IconButton.filled(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ))),
                          onPressed: () {},
                          icon: const Icon(Icons.search))
                    ],
                  )),
              foodPageBody()
            ],
          ),
        ),
      ),
    );
  }
}
