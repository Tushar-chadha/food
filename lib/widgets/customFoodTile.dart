import 'package:flutter/material.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/iconText.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';

class customFoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 50,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                print("Food");
              },
              child: const CustomListItem());
        });
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: dimensions.width20, vertical: dimensions.height15),
      child: Row(children: [
        Container(
          height: dimensions.listImgSize,
          width: dimensions.listImgSize,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/image/food0.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(30)),
        ),
        Expanded(
          child: Container(
            height: dimensions.listTextCont,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 0.5,
                      color: Colors.black12,
                      offset: Offset(4, 4))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: dimensions.height10),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: dimensions.width10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BigText(
                      text:
                          "My food is my food dnejncjenvcjdenvjdnv jndvjendsjv nesjv ndesjnv  ",
                      fo: FontWeight.w700,
                    ),
                    Gap(dimensions.height10 - 9),
                    smallText(
                      text: "aba daba jab cha ajcbaj",
                    ),
                    Gap(dimensions.height10 - 5),
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
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
