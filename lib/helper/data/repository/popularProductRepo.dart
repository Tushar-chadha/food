import 'package:foody/helper/data/apiClient.dart';
import 'package:get/get.dart';

class popularProductRepo extends GetxService {
  final ApiClient _apiClient;

  popularProductRepo({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Response> getPopularProductList() async {
    return await _apiClient.getData("end point");
  }
}
