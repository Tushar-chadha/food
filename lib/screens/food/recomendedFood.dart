import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody/screens/food/popularScreenDetails.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/extendableText.dart';
import 'package:foody/widgets/iconText.dart';
import 'package:foody/widgets/navigatorRow.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';

class recomendedFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 190,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius:
                        BorderRadius.circular(dimensions.radius20 + 5)),
                child: IconButton(
                  color: Colors.white,
                  iconSize: dimensions.height20 + 5,
                  icon: const Icon(CupertinoIcons.add),
                  onPressed: () {},
                ),
              ),
              const BigText(text: "Rs.100" + " X " + "0"),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius:
                        BorderRadius.circular(dimensions.radius20 + 5)),
                child: Container(
                  child: IconButton(
                    color: Colors.white,
                    iconSize: dimensions.height20 + 5,
                    icon: const Icon(CupertinoIcons.minus),
                    onPressed: () {},
                  ),
                ),
              ),
            ]),
            const Gap(10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(dimensions.radius20)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: dimensions.width10),
                      child: IconButton(
                        padding:
                            EdgeInsets.symmetric(vertical: dimensions.height10),
                        iconSize: dimensions.height30,
                        icon: const Icon(CupertinoIcons.heart),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
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
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: NavigatorRowIcon(),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: dimensions.height15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(dimensions.radius20),
                        topRight: Radius.circular(dimensions.radius20)),
                  ),
                  child: BigText(
                      size: dimensions.height20,
                      text: "My food is my Food",
                      fo: FontWeight.w700),
                ),
              ),
              pinned: true,
              backgroundColor: const Color.fromRGBO(255, 211, 92, 1),
              expandedHeight: dimensions.height300,
              flexibleSpace: const FlexibleSpaceBar(
                background: Image(
                    image: AssetImage("assets/image/food0.png"),
                    fit: BoxFit.cover),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: dimensions.width20,
                        vertical: dimensions.height20 + 10),
                    child: const extendableText(
                        Text: " popularFoodDetails().Textx "))),
          ],
        ),
      ),
    );
  }
}
