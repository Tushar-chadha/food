import 'package:flutter/material.dart';
import 'package:foody/controllers/popularProductController.dart';
import 'package:foody/controllers/recomendedProductController.dart';
import 'package:foody/helper/dependencies.dart';
import 'package:foody/helper/routes/routeHelper.dart';
import 'package:foody/screens/home/homepage.dart';
import 'package:foody/utils/colors.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // waits till dependencies are loaded
  await dep().init(); // dependencies.dart is loaded at the start
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => ApiClient(appBaseUrl: constants.baseUrl));
    // Get.lazyPut(() => popularProductRepo(apiClient: Get.find()));
    // Get.lazyPut(() => popularProductController(productRepo: Get.find()));
    Get.find<recommendedProductController>().getRecommendedProductList();
    Get.find<popularProductController>()
        .getPopularProductList(); // getx finds new list using controller
    return GetMaterialApp(
        getPages: routeHelper.routes,
        initialRoute: routeHelper.getInitial(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
          useMaterial3: true,
        ),
        home: MyHomePage());
  }
}
