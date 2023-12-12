import 'package:foody/controllers/popularProductController.dart';
import 'package:foody/helper/data/apiClient.dart';
import 'package:foody/helper/data/repository/popularProductRepo.dart';
import 'package:get/get.dart';

class dep {
  Future<void> init() async {
    //API CLient
    Get.lazyPut(() => ApiClient(appBaseUrl: "www.dbestech.com"));
    //Repos
    Get.lazyPut(() => popularProductRepo(apiClient: Get.find()));
    //Controllers
    Get.lazyPut(() => popularProductController(productRepo: Get.find()));
  }
}
