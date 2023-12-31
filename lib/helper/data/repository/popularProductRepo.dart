import 'package:foody/helper/data/apiClient.dart';
import 'package:foody/utils/constants.dart';
import 'package:get/get.dart';

class popularProductRepo extends GetxService {
  final ApiClient _apiClient;

  popularProductRepo({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Response> getPopularProductList() async {
    print("api");
    return await _apiClient.getData(constants.popularProductURI);
  }
}
