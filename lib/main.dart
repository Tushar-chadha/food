import 'package:flutter/material.dart';
import 'package:foody/helper/dependencies.dart';
import 'package:foody/screens/food/popularScreenDetails.dart';
import 'package:foody/screens/food/recomendedFood.dart';
import 'package:foody/utils/colors.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/home/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // waits till dependencies are loaded
  await dep().init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
