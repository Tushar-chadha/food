import 'package:flutter/material.dart';
import 'package:foody/controllers/popularProductController.dart';
import 'package:foody/helper/dependencies.dart';
import 'package:foody/screens/food/recomendedFood.dart';
import 'package:foody/utils/colors.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // waits till dependencies are loaded
  await dep().init; // dependencies.dart is loaded at the start
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<popularProductController>()
        .getPopularProductList(); // getx finds new list using controller
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
          useMaterial3: true,
        ),
        home: recomendedFood());
  }
}
