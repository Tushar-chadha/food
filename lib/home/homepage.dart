import 'package:flutter/material.dart';
import 'package:foody/home/foodPageBody.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/smallText.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                            size: 20,
                            color: AppColors.mainColor),
                        Center(
                          child: Row(
                            children: [
                              smallText(
                                text: "New Delhi",
                                size: 10,
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: AppColors.textColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    IconButton.filled(
                        style: ButtonStyle(
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
                        onPressed: () {},
                        icon: const Icon(Icons.search))
                  ],
                ),
              )),
          foodPageBody()
        ],
      ),
    );
  }
}
