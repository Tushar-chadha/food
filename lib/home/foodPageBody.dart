import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class foodPageBody extends StatefulWidget {
  const foodPageBody({super.key});

  @override
  State<foodPageBody> createState() => _foodPageBodyState();
}

// ignore: camel_case_types
class _foodPageBodyState extends State<foodPageBody> {
  PageController pageCon = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 320,
      child: PageView.builder(
        controller: pageCon,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return _buildPageItem(index);
        },
      ),
    );
  }
}

Widget _buildPageItem(int index) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: 220,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/image/food0.png"),
              fit: BoxFit.cover,
            ),
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30)),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          margin: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
        ),
      ),
    ],
  );
}
