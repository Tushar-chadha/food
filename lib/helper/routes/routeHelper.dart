import 'package:foody/screens/food/popularScreenDetails.dart';
import 'package:foody/screens/food/recomendedFood.dart';
import 'package:foody/screens/home/homepage.dart';
import 'package:get/get.dart';

class routeHelper {
  static const initialRoute = "/";
  static String popularFoodDetailsRoute = "/popularFoodDetails";
  static String recommendedFoodDetailsRoute = "/recommendedFoodDetails";

// this will call strings above ^^ they will call routes from list
  static String getInitial() => initialRoute;
  static String getPopularFoodDetails() => popularFoodDetailsRoute;
  static String getRecommendedFoodDetails() => recommendedFoodDetailsRoute;

  static List<GetPage> routes = [
    GetPage(
        name: "/",
        page: () {
          return MyHomePage();
        },
        transition: Transition.cupertinoDialog,
        transitionDuration: Duration(seconds: 5)),
    GetPage(
        name: recommendedFoodDetailsRoute,
        page: () {
          return recomendedFood();
        },
        transition: Transition.cupertinoDialog,
        transitionDuration: Duration(seconds: 1)),
    GetPage(
        name: popularFoodDetailsRoute,
        page: () {
          return popularFoodDetails();
        },
        transition: Transition.cupertinoDialog,
        transitionDuration: Duration(seconds: 1))
  ];
}
