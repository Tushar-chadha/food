import 'package:foody/controllers/popularProductController.dart';
import 'package:foody/helper/data/apiClient.dart';
import 'package:foody/helper/data/repository/popularProductRepo.dart';
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
    //Controllers
    Get.lazyPut(() => popularProductController(productRepo: Get.find()));
  }
}
