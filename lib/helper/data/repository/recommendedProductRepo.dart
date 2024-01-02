import 'package:foody/helper/data/apiClient.dart';
import 'package:foody/utils/constants.dart';
import 'package:get/get.dart';

class recommendedProductRepo extends GetxService {
  final ApiClient _apiClient;

  recommendedProductRepo({required ApiClient apiClient})
      : _apiClient = apiClient;

  Future<Response> getRecommendedProductList() async {
    print("api");
    return await _apiClient.getData(constants.recommendedProductURI);
  }
}
