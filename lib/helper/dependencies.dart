import 'package:foody/controllers/popularProductController.dart';
import 'package:foody/controllers/recomendedProductController.dart';
import 'package:foody/helper/data/apiClient.dart';
import 'package:foody/helper/data/repository/popularProductRepo.dart';
import 'package:foody/helper/data/repository/recommendedProductRepo.dart';
import 'package:foody/screens/food/recomendedFood.dart';
import 'package:foody/utils/constants.dart';
import 'package:get/get.dart';

class dep {
  Future<void> init() async {
    print("init");
    // API CLient
    Get.lazyPut(() => ApiClient(
        appBaseUrl: constants.baseUrl)); // sends base url to api clinet
    //Repos
    Get.lazyPut(() => popularProductRepo(apiClient: Get.find()));
    Get.lazyPut(() => recommendedProductRepo(apiClient: Get.find()));
    //Controllers
    Get.lazyPut(() => recommendedProductController(productRepo: Get.find()));
    Get.lazyPut(() => popularProductController(productRepo: Get.find()));
  }
}
