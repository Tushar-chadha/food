import 'package:flutter/material.dart';
import 'package:foody/controllers/recomendedProductController.dart';
import 'package:foody/helper/routes/routeHelper.dart';
import 'package:foody/model/productModel.dart';
import 'package:foody/screens/food/recomendedFood.dart';
import 'package:foody/utils/colors.dart';
import 'package:foody/utils/constants.dart';
import 'package:foody/utils/dimensions.dart';
import 'package:foody/widgets/bigtext.dart';
import 'package:foody/widgets/iconText.dart';
import 'package:foody/widgets/smallText.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class customFoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<recommendedProductController>(builder: (popularProducts) {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: popularProducts.recomendedProduct.length, //here
          itemBuilder: (context, index) {
            return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () =>
                    Get.toNamed(routeHelper.recommendedFoodDetailsRoute),
                child: CustomListItem(
                  popularProductItem:
                      popularProducts.recomendedProduct[index], //here
                ));
          });
    });
  }
}

class CustomListItem extends StatelessWidget {
  final productModel popularProductItem;
  const CustomListItem({
    super.key,
    required this.popularProductItem,
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
              image: DecorationImage(
                  image: NetworkImage(
                      "${constants.baseUrl}/uploads/${popularProductItem.img!}"),
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
                    BigText(
                      to: TextOverflow.ellipsis,
                      text: popularProductItem.name!,
                      fo: FontWeight.w700,
                    ),
                    Gap(dimensions.height10 - 7),
                    smallText(
                      text: popularProductItem.description!,
                    ),
                    Gap(dimensions.height10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        iconText(
                          size: dimensions.height15,
                          color: Colors.amber,
                          icons: Icons.circle,
                          title: "Normal",
                        ),
                        Gap(dimensions.width10 - 5),
                        iconText(
                          size: dimensions.height15,
                          color: AppColors.mainColor,
                          icons: Icons.location_on,
                          title: "1.7 kms",
                        ),
                        Gap(dimensions.width10 - 5),
                        iconText(
                          size: dimensions.height15,
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
